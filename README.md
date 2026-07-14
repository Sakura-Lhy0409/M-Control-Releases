<div align="center">
  <img height="128" src="docs/branding/m-control-repository-icon.png" alt="M-Control Logo">
  <h1>M-Control Releases</h1>
  <p>M-Control 官方下载、更新、文档与问题反馈仓库</p>
</div>

<table>
  <tr>
    <td width="50%" align="center">
      <strong>赞助商 · 微星电竞超哥</strong><br>
      <img src="docs/branding/sponsor-chaoge-wechat.jpg" height="320" alt="微星电竞超哥微信二维码"><br>
      打游戏选微星 · 买微星找超哥
    </td>
    <td width="50%" align="center">
      <strong>M-Control 赞赏支持</strong><br>
      <img src="docs/branding/sponsor-qrcode.png" height="320" alt="M-Control 软件赞赏码"><br>
      感谢支持 M-Control 持续维护
    </td>
  </tr>
</table>

## 下载与版本

- 当前正式源码版本：`1.0.191`。
- 正式安装包、便携包和 SHA256 校验值统一发布在 [GitHub Releases](https://github.com/Sakura-Lhy0409/M-Control-Releases/releases)。
- 安装版文件名为 `MControl_v<版本号>_Setup.exe`，适合大多数用户。
- 便携版文件名为 `MControl_v<版本号>_Portable.zip`，解压后使用。
- 如果 Releases 页面暂时没有对应版本资产，请等待正式发布，不要从不明第三方下载。

[English](README_EN.md) · [快速开始](docs/QUICKSTART.md) · [安装前说明](docs/M-Control_安装前说明.txt) · [安装后说明](docs/M-Control_安装后说明.txt)

## M-Control 是什么

M-Control 是面向 MSI 微星笔记本的第三方 Windows 硬件控制与监控工具，目标是把常用的本地控制能力集中在一个轻量应用中。它不是 MSI / Micro-Star International 官方软件，也不代表 MSI、NVIDIA、AMD、Intel 或 Microsoft 提供、授权或背书。

## 正式版功能

- 仪表盘：CPU / GPU 温度、频率、功耗、利用率、电池和风扇状态。
- GPU 监控：通过当前可用驱动接口提供只读遥测，不修改频率或电压。
- 风扇控制：CPU / GPU 风扇曲线、全速模式、校准、RPM 与百分比显示。
- 性能与电源：情景模式、Windows 电源计划、系统能效和真实状态同步。
- GPU 模式：在机型支持时切换核显、混合与独显模式；部分切换需要重启。
- 电池：充电上限、健康度、循环次数、容量和充放电状态。
- SteelSeries 键盘灯效：在兼容设备和可用 HID 通道上提供灯效、亮度、速度与逐键能力。
- 快捷键与 OSD：风扇全速、触摸板及机型支持的状态提示。
- 诊断与支持：本地日志、诊断报告、MSI 支持页入口和版本检查。

正式版不包含 GPU 超频、VF 曲线、GPU 锁频、游戏 FPS 检测或硬件实时监控叠加层。实验分支中的能力不代表正式 Release 功能。

## 系统与兼容性

- Windows 10 / 11 x64。
- .NET Framework 4.6.2 和 Microsoft Edge WebView2 Runtime。
- MSI 笔记本；具体功能取决于机型、BIOS、EC 固件、MSI 平台驱动和硬件通道。
- NVIDIA 只读 GPU 遥测需要可用的 NVIDIA 驱动及相应接口。
- 底层硬件访问和部分控制操作需要管理员权限。

请先阅读 [兼容性说明](docs/COMPATIBILITY.md)。未列出的机型不等于不支持，但应从默认设置开始逐项验证。

## 文档

- [快速开始](docs/QUICKSTART.md)
- [常见问题](docs/FAQ.md)
- [兼容性说明](docs/COMPATIBILITY.md)
- [安装前说明](docs/M-Control_安装前说明.txt)
- [安装后说明](docs/M-Control_安装后说明.txt)
- [软件许可与免责声明](docs/M-Control_许可协议.txt)

## 反馈与社区

- [提交 Issue](https://github.com/Sakura-Lhy0409/M-Control-Releases/issues)
- [参与 Discussion](https://github.com/Sakura-Lhy0409/M-Control-Releases/discussions)

反馈时请提供机型、Windows 版本、BIOS / EC 版本、相关驱动版本、M-Control 版本、复现步骤和必要日志。上传诊断包前请自行检查并移除不希望公开的信息。

## 风险说明

M-Control 会访问 EC、MSI WMI、UEFI、风扇、电池、键盘 HID 和显卡只读遥测接口。不同机型和固件的行为可能不同。风扇曲线、GPU 模式、电池限制及其他硬件控制可能影响温度、噪音、续航、稳定性或保修判断。请先保存工作、保留恢复方案，并在理解风险后使用。

## 隐私与网络访问

M-Control 不做遥测，不收集用户数据，不主动上传硬件信息，也不读取个人文件。核心控制在本机执行。网络访问限于用户主动打开支持页面、检查 GitHub Releases 更新或提交反馈；用户自行上传的 Issue、Discussion 和诊断附件受 GitHub 的公开范围与隐私规则约束。

## 授权

M-Control 当前以闭源免费方式发布。个人设备可免费安装和使用官方发布包；不得商业售卖、冒充原作者、删除或篡改署名，也不得声称与 MSI 或其他厂商存在官方授权关系。完整条款见 [M-Control 软件许可与免责声明](docs/M-Control_许可协议.txt)。
