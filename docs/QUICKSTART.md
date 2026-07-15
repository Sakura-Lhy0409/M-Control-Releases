# M-Control 快速开始

这份指南面向 M-Control 正式版。M-Control 是 MSI 微星笔记本第三方硬件控制工具，不是 MSI 官方软件。

## 1. 下载并校验

1. 打开 [M-Control Releases](https://github.com/Sakura-Lhy0409/M-Control-Releases/releases)。
2. 大多数用户选择 `MControl_v<版本号>_Setup.exe`；免安装使用可选择 `MControl_v<版本号>_Portable.zip`；系统无法安装或加载 WebView2 时，可选择补丁位为 `0` 的基线版本所提供的 `MControl_v<版本号>_Setup_WebView2_Fixed.exe`。
3. 对照同一 Release 提供的 SHA256 校验值。校验不一致时不要运行，应重新下载。
4. 如果 Releases 页面没有对应资产，请等待正式发布，不要从不明第三方获取安装包或驱动。

## 2. 确认系统环境

- Windows 10 / 11 x64。
- .NET Framework 4.6.2。
- Microsoft Edge WebView2 Runtime。
- 正常工作的 MSI 平台驱动、芯片组驱动和显卡驱动。
- 底层硬件访问和部分控制操作需要管理员权限。

安装程序会检查它能够确认的系统条件，但不同 Release 包含的前置组件可能不同。补丁位为 `0` 的基线版本可以提供 `Setup_WebView2_Fixed.exe`，它内嵌微软官方 x64 Fixed Version Runtime，不依赖系统 Evergreen Runtime；补丁位不为 `0` 的 hotfix 不提供该大包。缺少 .NET Framework 时仍需从 Microsoft 官方渠道安装；不要假定发布包附带所有硬件驱动。

## 3. 安装或使用便携版

### 安装版

1. 运行 `MControl_v<版本号>_Setup.exe`。
2. 阅读安装前说明、许可协议和风险提示。
3. 选择安装目录并完成安装。
4. 从桌面或开始菜单启动 M-Control。

系统无法安装或加载 WebView2 时，优先使用补丁位为 `0` 的基线版本 Fixed 安装包；它仍是安装包，不是便携 ZIP。hotfix 不提供 Fixed 安装包，可先安装系统 WebView2 Runtime，再安装最新 hotfix。

`v1.1.0` 是覆盖升级支持的起始版本。早于 `v1.1.0` 的版本建议先卸载旧版，再安装 `v1.1.0`；从 `v1.1.0` 升级到后续版本时，可以直接运行新安装包覆盖安装。

### 便携版

1. 将 ZIP 完整解压到普通可写目录。
2. 不要直接在压缩包内运行。
3. 启动 `MControl.exe`。

## 4. 首次启动

首次启动后先确认：

- 软件识别出的机型、CPU、GPU 和 BIOS / EC 信息是否合理。
- 仪表盘数据是否稳定，未支持项目是否明确显示不可用。
- 没有同时运行 MSI Center、Dragon Center 或其他会接管同一硬件控制项的软件。

如果程序提示权限不足，请退出后以管理员身份重新运行。界面空白时优先检查 WebView2 Runtime。

## 5. 仪表盘与只读 GPU 监控

仪表盘可显示 CPU / GPU 温度、频率、功耗、利用率、电池和风扇数据。具体项目取决于机型和传感器能力。

正式版 GPU 功能仅提供只读遥测和 GPU 模式状态。正式版不包含 GPU 超频、VF 曲线、GPU 锁频、游戏 FPS 检测或硬件实时监控叠加层。

## 6. 性能和 GPU 模式

在性能页面可根据机型使用情景模式、Windows 电源计划和 GPU 模式：

- 平衡：日常使用。
- 安静：优先降低噪音。
- 节能：优先续航。
- 高性能：优先性能和散热。
- GPU 模式：机型支持时可选择核显、混合或独显。

GPU 模式切换可能要求重启。切换前保存工作，并以软件实际提示为准。

## 7. 风扇控制

1. 先读取并记录当前曲线。
2. 从默认曲线开始小幅调整，不直接套用其他机型参数。
3. 应用后观察温度、噪音和稳定性。
4. 百分比显示需要风扇校准；校准期间风扇会进入全速状态。
5. 出现异常时恢复默认曲线并完全退出其他控制软件。

`Fn + ↑` 可在支持的机型上切换风扇全速，`Fn + F4` 可切换触摸板。固件上报方式不同，快捷键能力以实机为准。

## 8. 电池、灯效和应用行为

- 电池：查看健康、容量、循环和充放电状态，并在支持时设置充电上限。
- 灯效：兼容 SteelSeries 键盘可使用亮度、速度、区域或逐键能力；未支持设备会降级或隐藏。
- 设置：可配置开机启动、启动最小化、关闭到托盘等行为。

M-Control 不承诺随包提供第三方 SteelSeries 驱动。请优先使用设备现有的兼容驱动和 M-Control 能直接识别的 HID 通道，不要从不可信来源下载驱动文件。

## 9. 排查与反馈

遇到问题时：

1. 记录 M-Control 版本、机型、Windows、BIOS / EC 和相关驱动版本。
2. 记录清晰的复现步骤和期望结果。
3. 在需要时启用诊断日志或导出诊断包。
4. 上传前检查压缩包和日志，移除不希望公开的信息。
5. 前往 [GitHub Issues](https://github.com/Sakura-Lhy0409/M-Control-Releases/issues) 提交反馈。

更多信息：[FAQ](FAQ.md) · [兼容性说明](COMPATIBILITY.md) · [许可与免责声明](M-Control_许可协议.txt)
