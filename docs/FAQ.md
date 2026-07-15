# M-Control 常见问题

## 安装和启动

### Q1：从哪里下载？

只从 [M-Control Releases](https://github.com/Sakura-Lhy0409/M-Control-Releases/releases) 或维护者明确公布的可信镜像下载。优先使用同一 Release 中的 SHA256 校验值核对文件。

### Q2：程序打不开或界面空白怎么办？

1. 确认系统为 Windows 10 / 11 x64。
2. 确认 .NET Framework 4.6.2 可用。
3. 确认 Microsoft Edge WebView2 Runtime 已安装。
4. 检查安全软件拦截记录。
5. 重新完整解压便携包，不要在 ZIP 内直接运行。
6. 仍无法启动时，到 Issues 提交错误日志和系统信息。

若系统被精简掉 WebView2，或 Evergreen Runtime 无法安装、无法加载，可运行补丁位为 `0` 的基线版本所提供的 `MControl_v<版本号>_Setup_WebView2_Fixed.exe`。该安装包内嵌微软官方 x64 Fixed Version Runtime，不需要另装系统 WebView2。补丁位不为 `0` 的版本属于 hotfix，不提供 Fixed 安装包。

### Q3：提示权限不足怎么办？

退出程序后，右键 M-Control 并选择“以管理员身份运行”。EC、MSI WMI、风扇、电池和部分硬件状态访问需要较高权限。

## 功能和兼容性

### Q4：某个功能灰色或不显示？

常见原因包括机型不支持、BIOS / EC 差异、MSI 平台驱动缺失、硬件通道不可用或权限不足。M-Control 会尽量隐藏无能力的项目，而不是伪造可用状态。请查看 [兼容性说明](COMPATIBILITY.md)。

### Q5：可以和 MSI Center 同时运行吗？

不建议让两个程序同时控制同一项风扇、情景模式、GPU 模式、电池或灯效。设置可能互相覆盖，读回状态也可能变化。需要 MSI Center 的其他模块时，应避免同时操作重叠控制项。

### Q6：风扇曲线如何调整？

- 从当前默认曲线开始小幅修改。
- 不直接使用其他机型的数值。
- 不要在高温区设置过低转速。
- 应用后进行符合自己使用场景的温度和稳定性验证。
- 异常时恢复默认，并排查其他控制软件是否正在写入风扇。

通用温度示例不能代替具体 CPU、GPU、散热系统和固件的限制值。

### Q7：GPU 功能会超频或锁频吗？

不会。正式版仅保留 GPU 只读遥测和受支持机型的 GPU 模式切换，不提供 GPU 超频、VF 曲线、GPU 锁频或功耗调校入口。

### Q8：是否支持游戏 FPS 和硬件叠加层？

正式版不包含游戏 FPS 检测和硬件实时监控叠加层。Issues 中请以正式 Release 的实际界面和功能为准。

### Q9：灯效是否要求附带驱动？

灯效取决于键盘型号、PID、固件、现有驱动和 HID 通道。M-Control 不承诺在发布包中附带 `ssdevfactory`、`ssps2`、`msihid` 等第三方驱动。不要从不可信来源下载驱动；未支持时请提交设备信息和诊断结果。

## 升级、卸载和数据

### Q10：新版本可以覆盖安装吗？

`v1.1.0` 是覆盖升级支持的起始版本。早于 `v1.1.0` 的版本建议先卸载旧版，再安装 `v1.1.0`；从 `v1.1.0` 升级到后续版本时，可以直接运行新安装包覆盖安装。安装器会复用安装位置，并只处理 M-Control 自己管理的文件。

### Q11：卸载后配置在哪里？

用户配置和日志通常位于 `%LocalAppData%\M-Control\`。卸载前可先备份需要保留的配置；若要彻底清理，可在卸载并确认程序完全退出后手动删除该目录。

不要使用来源不明的驱动卸载命令。系统驱动应通过 Windows、设备厂商或对应驱动的官方卸载方式管理。

## 隐私和反馈

### Q12：M-Control 会上传硬件信息吗？

不会自动上传。M-Control 不做遥测，核心控制在本机执行。版本检查会访问 GitHub Releases，驱动支持入口会打开 MSI 官网。只有用户主动提交 Issue、Discussion 或诊断附件时，相关内容才会上传。

### Q13：如何报告问题？

前往 [GitHub Issues](https://github.com/Sakura-Lhy0409/M-Control-Releases/issues)，提供：

- 完整机型和 M-Control 版本。
- Windows、BIOS 和 EC 版本。
- MSI 平台驱动、芯片组和显卡驱动版本。
- 复现步骤、截图和实际结果。
- 必要的日志或诊断包。

上传前请检查附件并移除不希望公开的信息。

[快速开始](QUICKSTART.md) · [兼容性说明](COMPATIBILITY.md) · [仓库首页](../README.md)
