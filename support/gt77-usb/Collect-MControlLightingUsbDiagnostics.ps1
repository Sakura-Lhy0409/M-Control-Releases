<#
.SYNOPSIS
    Reads SteelSeries device history and failed USB nodes when GT77 ALC is absent.
.DESCRIPTION
    Only creates a new local report directory and ZIP. No device changes, driver
    installation, application launch, hardware writes, deletion, or upload.
    Device instance suffixes are replaced with report-local salted identifiers.
#>
[CmdletBinding()]
param([string]$OutputRoot)

$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
$script:ReportSalt = [Guid]::NewGuid().ToString('N')
$script:CollectionErrors = New-Object 'System.Collections.Generic.List[string]'

function ConvertTo-ReportDeviceId {
    param([string]$InstanceId)
    if ([string]::IsNullOrWhiteSpace($InstanceId)) { return '' }
    $parts = $InstanceId.ToUpperInvariant().Split('\')
    $hardware = if ($parts.Length -ge 2) { $parts[0] + '\' + $parts[1] } else { $parts[0] }
    $sha = [Security.Cryptography.SHA256]::Create()
    try {
        $hash = [BitConverter]::ToString($sha.ComputeHash([Text.Encoding]::UTF8.GetBytes($script:ReportSalt + $InstanceId.ToUpperInvariant()))).Replace('-', '')
        return $hardware + '\instance-' + $hash.Substring(0, 12)
    } finally { $sha.Dispose() }
}

function Test-LightingUsbEvidenceTarget {
    param([string]$InstanceId, [object]$ProblemCode)
    $id = ([string]$InstanceId).ToUpperInvariant()
    if ($id.StartsWith('USB\VID_1038&') -or $id.StartsWith('HID\VID_1038&')) { return $true }
    if ($id.StartsWith('USB\') -and $null -ne $ProblemCode) {
        try { return [int]$ProblemCode -gt 0 } catch { return $false }
    }
    return $false
}

function Get-DevicePropertyData {
    param([string]$InstanceId, [string]$KeyName)
    try {
        return (Get-PnpDeviceProperty -InstanceId $InstanceId -KeyName $KeyName -ErrorAction Stop).Data
    } catch { return $null }
}

if (-not $OutputRoot) { $OutputRoot = Join-Path ([Environment]::GetFolderPath('Desktop')) 'M-Control-Diagnostics' }
$outputBase = [IO.Path]::GetFullPath($OutputRoot)
$reportRoot = Join-Path $outputBase ('MControl_Lighting_USB_' + (Get-Date -Format 'yyyyMMdd_HHmmss') + '_' + [Guid]::NewGuid().ToString('N').Substring(0, 8))
if (Test-Path -LiteralPath $reportRoot) { throw 'Refusing to overwrite a report.' }
[IO.Directory]::CreateDirectory($reportRoot) | Out-Null
$reportPrefix = [IO.Path]::GetFullPath($reportRoot).TrimEnd('\') + '\'

$allDevices = @()
$present = @{}
$presenceKnown = $false
$allDevicesKnown = $false
try {
    $allDevices = @(Get-PnpDevice -ErrorAction Stop)
    $allDevicesKnown = $true
    try {
        foreach ($device in Get-PnpDevice -PresentOnly -ErrorAction Stop) { $present[$device.InstanceId] = $true }
        $presenceKnown = $true
    } catch { $script:CollectionErrors.Add('Present enumeration: ' + $_.Exception.GetType().Name) }
} catch { $script:CollectionErrors.Add('PnP history enumeration: ' + $_.Exception.GetType().Name) }

$lookup = @{}
foreach ($device in $allDevices) { if ($device.InstanceId) { $lookup[$device.InstanceId] = $device } }
$selected = @{}
foreach ($device in $allDevices) {
    if (Test-LightingUsbEvidenceTarget -InstanceId $device.InstanceId -ProblemCode $device.Problem) { $selected[$device.InstanceId] = 'target' }
}
$targetIds = @($selected.Keys | Sort-Object | Select-Object -First 128)
$totalTargetCount = $selected.Count
$selected = @{}
foreach ($targetId in $targetIds) { $selected[$targetId] = 'target' }
$parents = @{}
foreach ($targetId in $targetIds) {
    $current = $targetId
    for ($depth = 0; $depth -lt 3; $depth++) {
        $parent = [string](Get-DevicePropertyData $current 'DEVPKEY_Device_Parent')
        if (-not $parent -or $parent -eq $current) { break }
        $parents[$current] = $parent
        if (-not $selected.ContainsKey($parent)) { $selected[$parent] = 'parent' }
        $current = $parent
    }
}

$records = @()
foreach ($id in @($selected.Keys | Sort-Object | Select-Object -First 512)) {
    $device = $lookup[$id]
    $code = Get-DevicePropertyData $id 'DEVPKEY_Device_ProblemCode'
    $problemStatus = Get-DevicePropertyData $id 'DEVPKEY_Device_ProblemStatus'
    $records += [pscustomobject]@{
        Id = ConvertTo-ReportDeviceId $id
        Kind = $selected[$id]
        Class = if ($device) { [string]$device.Class } else { '' }
        Status = if ($device) { [string]$device.Status } else { '' }
        Present = if ($presenceKnown) { $present.ContainsKey($id) } else { $null }
        ProblemCode = $code
        ProblemStatus = $problemStatus
        Parent = ConvertTo-ReportDeviceId ([string]$parents[$id])
        LocationPaths = @(Get-DevicePropertyData $id 'DEVPKEY_Device_LocationPaths')
        Service = Get-DevicePropertyData $id 'DEVPKEY_Device_Service'
        DriverVersion = Get-DevicePropertyData $id 'DEVPKEY_Device_DriverVersion'
        DriverInf = Get-DevicePropertyData $id 'DEVPKEY_Device_DriverInfPath'
    }
}

$registryHistory = @()
try {
    $enumRoot = 'HKLM:\SYSTEM\CurrentControlSet\Enum\USB'
    foreach ($hardware in Get-ChildItem -LiteralPath $enumRoot -ErrorAction Stop | Where-Object { $_.PSChildName -match '^VID_1038&PID_[0-9A-F]{4}(&|$)' }) {
        foreach ($instance in Get-ChildItem -LiteralPath $hardware.PSPath -ErrorAction Stop | Select-Object -First 64) {
            $values = Get-ItemProperty -LiteralPath $instance.PSPath -ErrorAction Stop
            $registryHistory += [pscustomobject]@{
                Id = ConvertTo-ReportDeviceId ('USB\' + $hardware.PSChildName + '\' + $instance.PSChildName)
                Service = [string]$values.Service
                Driver = [string]$values.Driver
                ConfigFlags = $values.ConfigFlags
                Meaning = 'Registry history only; does not prove the device is currently connected.'
            }
        }
    }
} catch { $script:CollectionErrors.Add('Scoped USB registry history: ' + $_.Exception.GetType().Name) }

$model = ''
$board = ''
try { $model = [string](Get-CimInstance Win32_ComputerSystem -ErrorAction Stop).Model } catch {}
try { $board = [string](Get-CimInstance Win32_BaseBoard -ErrorAction Stop).Product } catch {}
$report = [pscustomobject]@{
    SchemaVersion = 1
    GeneratedUtc = [DateTime]::UtcNow.ToString('O')
    Model = $model
    Board = $board
    Privacy = 'SteelSeries, failed USB and up to three parent nodes only; instance suffixes anonymized per report. No computer/user names, serial fields or uploads.'
    CollectionErrors = @($script:CollectionErrors.ToArray())
    AllDevicesEnumerationSucceeded = $allDevicesKnown
    PresentEnumerationSucceeded = $presenceKnown
    TargetCount = $targetIds.Count
    TotalTargetCount = $totalTargetCount
    Truncated = $totalTargetCount -gt $targetIds.Count -or $selected.Count -gt 512
    TargetLimit = 128
    DeviceRecords = $records
    RegistryHistory = $registryHistory
    ExpectedGt77Alc = @('VID_1038&PID_1146', 'VID_1038&PID_114F')
    DiagnosticOnlyBoot = @('VID_1038&PID_1147', 'VID_1038&PID_1150')
    Limitations = 'Absent matching IDs alone do not identify the original cause. Registry history is not presence. Failed/limited enumeration must not be treated as absence.'
}
$reportFile = Join-Path $reportRoot 'lighting_usb_history.json'
if (-not [IO.Path]::GetFullPath($reportFile).StartsWith($reportPrefix, [StringComparison]::OrdinalIgnoreCase)) { throw 'Unexpected report path.' }
[IO.File]::WriteAllText($reportFile, ($report | ConvertTo-Json -Depth 8), [Text.UTF8Encoding]::new($false))
[IO.File]::WriteAllText((Join-Path $reportRoot 'README.txt'), 'Read-only evidence. Review the JSON before attaching this ZIP to your original M-Control report. Nothing was uploaded or changed on devices.', [Text.UTF8Encoding]::new($false))
Add-Type -AssemblyName System.IO.Compression.FileSystem
$zipPath = $reportRoot + '.zip'
[IO.Compression.ZipFile]::CreateFromDirectory($reportRoot, $zipPath)
if (-not (Test-Path -LiteralPath $zipPath -PathType Leaf)) { throw 'Report ZIP was not created.' }
Write-Output ('Report: ' + $zipPath)
Write-Output ('SHA256: ' + (Get-FileHash -LiteralPath $zipPath -Algorithm SHA256).Hash)
Write-Output ('Target nodes: ' + $targetIds.Count + '; collection errors: ' + $script:CollectionErrors.Count)
