<table>
  <tr>
    <td width="50%" align="center">
      <a href="docs/branding/sponsor-chaoge-wechat.jpg"><img src="docs/branding/sponsor-chaoge-wechat.jpg" height="140" alt="MSI Gaming Chaoge WeChat QR code"></a><br>
      <strong>Project sponsor · 微星电竞超哥</strong><br>
      <sub>Thank you for supporting the continued maintenance of M-Control</sub>
    </td>
    <td width="50%" align="center">
      <a href="docs/branding/sponsor-qrcode.png"><img src="docs/branding/sponsor-qrcode.png" height="140" alt="M-Control donation QR code"></a><br>
      <strong>Support M-Control</strong><br>
      <sub>Every contribution supports independent development</sub>
    </td>
  </tr>
</table>

<div align="center">
  <img height="96" src="docs/branding/m-control-repository-icon.png" alt="M-Control Logo">
  <h1>M-Control</h1>
  <p><strong>A lightweight, local-first, telemetry-free control center for MSI laptops.</strong></p>
  <p>Bring hardware monitoring, fan control, performance modes, battery settings, GPU modes, and keyboard lighting into one Windows app.<br>M-Control is an independent third-party project and is not official MSI software.</p>
  <p>
    <img src="https://img.shields.io/badge/Windows-10%20%2F%2011-0078D4?logo=windows&logoColor=white" alt="Windows 10 / 11">
    <img src="https://img.shields.io/badge/MSI-Laptop-D23D1D" alt="MSI Laptop">
    <img src="https://img.shields.io/badge/Processing-Local-success" alt="Local processing">
    <img src="https://img.shields.io/badge/Telemetry-None-success" alt="No telemetry">
  </p>
  <p><a href="README.md">简体中文</a> · English</p>
</div>

> [!NOTE]
> Download official builds only from this repository's [Releases](https://github.com/Sakura-Lhy0409/M-Control-Releases/releases) page and verify the supplied SHA256 checksums. Most users should choose the regular installer; portable users can choose the standard archive. An installer with the embedded Microsoft x64 Fixed Version Runtime may be provided for both baseline releases and hotfixes; hotfixes still do not include a Fixed Runtime portable ZIP.

> [!IMPORTANT]
> `v1.1.0` establishes the in-place upgrade baseline. If you use an earlier version, uninstall it before installing `v1.1.0`. Future releases can be installed directly over `v1.1.0` or later.

## Why M-Control

- **Focused**: Keep the MSI laptop controls you use most in one application instead of switching between several tools.
- **Local-first**: Core monitoring and hardware control run on your PC without an account or cloud service.
- **No telemetry**: Hardware data is processed locally for monitoring and control, not recorded or uploaded for telemetry; M-Control does not read personal files.

## Core capabilities

- **Monitoring**: CPU/GPU temperature, clocks, power and utilization, plus battery, fan, and model-dependent extended sensors.
- **Cooling and performance**: CPU/GPU fan curves, full-speed mode, performance modes, Windows power plans, and state readback on supported hardware.
- **Battery and GPU modes**: Charge limits, battery health, and integrated, hybrid, or discrete GPU-mode switching on supported models.
- **Lighting and hotkeys**: SteelSeries / Mystic Light lighting, hotkey feedback and OSD; per-key features depend on topology and HID routes. PRISM realtime effects are generated from algorithms, not replayed capture frames.
- **Display color**: LM import and True Color profiles for a matching internal panel. HDR pauses SDR calibration; an inactive internal panel never redirects calibration to an external screen.

Restore startup fan curve uses the snapshot taken before this session's first fan write, not BIOS factory defaults. GPU modes are in Performance and follow device capabilities; apply now may restart or perform S5 shutdown/automatic wake. Battery health, limits and calibration are in Settings.

> [!IMPORTANT]
> Current release builds provide read-only GPU telemetry and GPU-mode switching on supported models. They do not include GPU overclocking, VF-curve controls, GPU clock locking, game FPS monitoring, or a real-time hardware overlay.

## Compatibility and trust

**Requirements**

- Windows 10/11 x64, .NET Framework 4.6.2, and Microsoft Edge WebView2 Runtime.
- Designed for MSI laptops; available features depend on the model, BIOS, EC firmware, and installed drivers.
- The executable requests Windows UAC administrator approval. Regular builds use system WebView2; Fixed builds use the bundled Runtime. Portable builds do not install PawnIO automatically.
- M-Control uses its own MSI ACPI client and MOF resource, without requiring MSI Center or old official runtime DLLs. Platform drivers and firmware interfaces must still be available.

**Safety principles**

- Official release packages include SHA256 checksums; do not run a file when its checksum does not match.
- Core features run locally; hardware data is not used for telemetry or uploaded automatically.
- Multiple suites writing the same hardware feature may conflict.
- Update checks read a fixed manifest and configured mirrors; confirmed updates download and verify an installer. Fixed installations retain the Fixed edition. Diagnostic reports are not uploaded automatically.
- Compatibility is recorded per device and feature, not certified for an entire series. NVIDIA 6xx private-telemetry crash and delayed gamma-transform fixes are included in v1.3.49; affected devices still require retesting.

## Documentation and support

- [Quick Start](docs/QUICKSTART.md) · installation, permissions, and first use
- [FAQ](docs/FAQ.md) · common problems and troubleshooting
- [Compatibility](docs/COMPATIBILITY.md) · platform requirements and model differences
- [Pre-installation notes (Chinese)](docs/M-Control_安装前说明.txt) · what to know before installation
- [Post-installation notes (Chinese)](docs/M-Control_安装后说明.txt) · first launch and usage guidance
- [License and disclaimer (Chinese)](docs/M-Control_许可协议.txt) · usage terms and risk notice
- [GitHub Issues](https://github.com/Sakura-Lhy0409/M-Control-Releases/issues) · bugs and compatibility reports
- [GitHub Discussions](https://github.com/Sakura-Lhy0409/M-Control-Releases/discussions) · questions and user tips

When reporting a problem, include the exact laptop model, Windows version, BIOS/EC versions, relevant driver versions, reproduction steps, and necessary logs. Remove information you do not want to publish before uploading diagnostics.

## Usage boundaries

M-Control uses a closed-source freeware license. It is not affiliated with, authorized by, or endorsed by MSI / Micro-Star International, NVIDIA, AMD, Intel, or Microsoft. Hardware behavior varies by model and firmware and may affect thermals, acoustics, battery life, stability, or warranty coverage; understand the risks and keep a recovery path before using hardware controls. Official packages may be used free of charge on personal devices, but commercial resale, impersonation, and attribution removal are prohibited.

<div align="center">
  <sub>Thank you to our sponsor, contributors, and everyone who shares compatibility feedback.</sub>
</div>
