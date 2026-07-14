<div align="center">
  <img height="128" src="docs/branding/m-control-repository-icon.png" alt="M-Control Logo">
  <h1>M-Control Releases</h1>
  <p>Official downloads, updates, documentation, and issue tracking for M-Control</p>
</div>

<table>
  <tr>
    <td width="50%" align="center">
      <strong>Sponsor · MSI Gaming Chaoge</strong><br>
      <img src="docs/branding/sponsor-chaoge-wechat.jpg" height="320" alt="MSI Gaming Chaoge WeChat QR code"><br>
      MSI gaming laptops and purchase assistance
    </td>
    <td width="50%" align="center">
      <strong>Support M-Control</strong><br>
      <img src="docs/branding/sponsor-qrcode.png" height="320" alt="M-Control donation QR code"><br>
      Thank you for supporting continued maintenance
    </td>
  </tr>
</table>

## Downloads and version

- Current formal source version: `1.0.191`.
- Official installers, portable archives, and SHA256 checksums are published on [GitHub Releases](https://github.com/Sakura-Lhy0409/M-Control-Releases/releases).
- Installer: `MControl_v<version>_Setup.exe`.
- Portable archive: `MControl_v<version>_Portable.zip`.
- If a matching asset is not available on the Releases page, wait for an official release instead of downloading from an unknown third party.

[简体中文](README.md) · [Quick Start](docs/QUICKSTART.md) · [Compatibility](docs/COMPATIBILITY.md)

## What is M-Control?

M-Control is a third-party Windows hardware control and monitoring utility for MSI laptops. It brings common local controls into one lightweight application. It is not official MSI / Micro-Star International software and is not supplied, authorized, or endorsed by MSI, NVIDIA, AMD, Intel, or Microsoft.

## Formal-release features

- Dashboard monitoring for CPU/GPU temperature, frequency, power, utilization, battery, and fans.
- Read-only GPU telemetry through available driver interfaces; it does not modify GPU frequency or voltage.
- CPU/GPU fan curves, full-speed mode, fan calibration, and RPM/percentage display.
- MSI scenario modes, Windows power plans, system-efficiency controls, and real-state synchronization.
- Integrated, hybrid, and discrete GPU-mode switching on supported models; some changes require a restart.
- Battery charge limits, health, cycle count, capacity, and charge/discharge state.
- SteelSeries keyboard lighting on compatible devices and available HID channels.
- Hotkey and OSD feedback for supported controls.
- Local diagnostics, MSI support-page links, and version checking.

Formal releases do not include GPU overclocking, VF-curve controls, GPU clock locking, game FPS monitoring, or a hardware monitoring overlay. Experimental branch work is not a formal Release feature.

## Requirements and compatibility

- Windows 10 / 11 x64.
- .NET Framework 4.6.2 and Microsoft Edge WebView2 Runtime.
- An MSI laptop; availability depends on the model, BIOS, EC firmware, MSI platform drivers, and hardware channels.
- Read-only NVIDIA GPU telemetry requires a compatible NVIDIA driver and available interfaces.
- Administrator privileges are required for low-level hardware access and some control operations.

Read [Compatibility](docs/COMPATIBILITY.md) before use. A model not listed there is unverified, not automatically unsupported.

## Documentation

- [Quick Start](docs/QUICKSTART.md)
- [FAQ](docs/FAQ.md)
- [Compatibility](docs/COMPATIBILITY.md)
- [Pre-installation notes (Chinese)](docs/M-Control_安装前说明.txt)
- [Post-installation notes (Chinese)](docs/M-Control_安装后说明.txt)
- [License and disclaimer (Chinese)](docs/M-Control_许可协议.txt)

## Feedback and community

- [Open an Issue](https://github.com/Sakura-Lhy0409/M-Control-Releases/issues)
- [Join Discussions](https://github.com/Sakura-Lhy0409/M-Control-Releases/discussions)

Include the exact laptop model, Windows version, BIOS/EC versions, relevant driver versions, M-Control version, reproduction steps, and necessary logs. Review diagnostic archives and remove information you do not want to publish before uploading them.

## Risk, privacy, and authorization

M-Control accesses EC, MSI WMI, UEFI, fans, battery controls, keyboard HID, and read-only GPU telemetry. Behavior varies by model and firmware. Hardware controls can affect temperature, noise, battery life, stability, and warranty assessment. Save your work and keep a recovery path before changing hardware settings.

M-Control contains no telemetry, does not collect user data, does not upload hardware information automatically, and does not read personal files. Network access is limited to user-requested support pages, GitHub Releases update checks, and feedback submission.

M-Control is closed-source freeware. Official packages may be used free of charge on personal devices. Commercial resale, impersonation, attribution removal, and claims of official vendor authorization are prohibited. See [the full license and disclaimer](docs/M-Control_许可协议.txt).
