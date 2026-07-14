<table>
  <tr>
    <td width="50%" align="center">
      <a href="docs/branding/sponsor-chaoge-wechat.jpg"><img src="docs/branding/sponsor-chaoge-wechat.jpg" height="140" alt="微星电竞超哥微信二维码"></a><br>
      <strong>项目赞助支持 · 微星电竞超哥</strong><br>
      <sub>感谢为 M-Control 的持续维护提供支持</sub>
    </td>
    <td width="50%" align="center">
      <a href="docs/branding/sponsor-qrcode.png"><img src="docs/branding/sponsor-qrcode.png" height="140" alt="M-Control 软件赞赏码"></a><br>
      <strong>M-Control 赞赏支持</strong><br>
      <sub>感谢每一份对独立开发的支持</sub>
    </td>
  </tr>
</table>

<div align="center">
  <img height="96" src="docs/branding/m-control-repository-icon.png" alt="M-Control Logo">
  <h1>M-Control</h1>
  <p><strong>轻量、本地、无遥测的 MSI 笔记本控制台</strong></p>
  <p>把实时监控、风扇、性能、电池、GPU 模式和键盘灯效集中在一个 Windows 应用中。<br>M-Control 由社区独立开发，并非 MSI 官方软件。</p>
  <p>
    <img src="https://img.shields.io/badge/Windows-10%20%2F%2011-0078D4?logo=windows&logoColor=white" alt="Windows 10 / 11">
    <img src="https://img.shields.io/badge/MSI-Laptop-D23D1D" alt="MSI Laptop">
    <img src="https://img.shields.io/badge/Processing-Local-success" alt="Local processing">
    <img src="https://img.shields.io/badge/Telemetry-None-success" alt="No telemetry">
  </p>
  <p>简体中文 · <a href="README_EN.md">English</a></p>
</div>

> [!NOTE]
> 正式版请只从本仓库的 [Releases](https://github.com/Sakura-Lhy0409/M-Control-Releases/releases) 下载，并核对发布页提供的 SHA256。大多数用户选择安装包；免安装使用可选普通便携版；系统缺少 WebView2 时可选附带微软官方 x64 WebView2 离线安装程序的便携版。

## 为什么选择 M-Control

- **轻量集中**：把 MSI 笔记本常用控制集中到一个应用，减少在多个工具之间切换。
- **本地优先**：核心监控与硬件控制在本机执行，不依赖账号或云服务。
- **无遥测**：硬件数据仅用于本机监控与控制，不为遥测目的记录或上传；软件也不读取个人文件。

## 核心能力

- **实时监控**：CPU / GPU 温度、频率、功耗、利用率，以及电池、风扇和机型支持的扩展传感器。
- **散热与性能**：CPU / GPU 风扇曲线、全速模式、性能模式、Windows 电源计划，以及受支持硬件的状态读回。
- **电池与显卡模式**：充电上限、健康信息，以及受支持机型的核显、混合和独显模式切换。
- **灯效与快捷键**：SteelSeries 键盘灯效、快捷键状态反馈和 OSD 提示；逐键控制仅适用于具备对应键位拓扑和 HID 通道的受支持设备。

> [!IMPORTANT]
> 计划发布的正式版 GPU 功能以只读遥测和受支持机型的 GPU 模式切换为主，不包含 GPU 超频、VF 曲线、GPU 锁频、游戏 FPS 检测或硬件实时监控叠加层。

## 兼容与可信

**运行要求**

- Windows 10 / 11 x64、.NET Framework 4.6.2、Microsoft Edge WebView2 Runtime。
- 面向 MSI 笔记本；实际能力取决于机型、BIOS、EC 固件和相关驱动。
- 部分底层硬件控制需要管理员权限。

**可信原则**

- 正式发布包将提供 SHA256；校验不一致时不要运行。
- 核心功能本地执行；硬件数据不用于遥测，也不会主动上传。
- 与 MSI Center 等硬件控制软件同时运行可能产生冲突。

## 文档与反馈

- [快速开始](docs/QUICKSTART.md) · 下载、安装、权限与首次使用
- [常见问题](docs/FAQ.md) · 常见故障与排查方法
- [兼容性说明](docs/COMPATIBILITY.md) · 支持条件与机型差异
- [安装前说明](docs/M-Control_安装前说明.txt) · 安装前必须了解的事项
- [安装后说明](docs/M-Control_安装后说明.txt) · 首次启动与使用建议
- [软件许可与免责声明](docs/M-Control_许可协议.txt) · 使用边界与风险说明
- [GitHub Issues](https://github.com/Sakura-Lhy0409/M-Control-Releases/issues) · 报告问题和兼容性反馈
- [GitHub Discussions](https://github.com/Sakura-Lhy0409/M-Control-Releases/discussions) · 使用交流与经验分享

反馈问题时，请提供具体机型、Windows 版本、BIOS / EC 版本、相关驱动版本、复现步骤和必要日志。公开上传诊断资料前，请先移除不希望公开的信息。

## 使用边界

M-Control 采用闭源免费授权。它不是 MSI / Micro-Star International 官方软件，也不受 MSI、NVIDIA、AMD、Intel 或 Microsoft 授权或背书。硬件控制行为会因机型和固件而异，可能影响温度、噪音、续航、稳定性或保修判断；请在理解风险并保留恢复方案后使用。正式发布包可在个人设备上免费使用，但不得商业售卖、冒充原作者或删除署名。

<div align="center">
  <sub>感谢赞助商、赞赏支持者，以及每一位提交兼容性反馈的用户。</sub>
</div>
