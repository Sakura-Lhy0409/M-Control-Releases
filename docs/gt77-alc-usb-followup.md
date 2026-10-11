# GT77HX 1.4.6 后置灯接口继续排查（2026-10-11）

1.4.6 的三份新诊断及两张截图确认：恢复工具确实重启了当前键盘接口并重新应用灯效，但龙盾/尾灯所需的后置 ALC 仍未出现在已知灯控 USB/PnP 节点中。本次没有将这一结果登记为已恢复，也没有根据接口缺失推断硬件已损坏。

## 新证据

两条新反馈 `MCF-0d5fade733bf035928a5a865b0d850eb` / `MCF-593187d8539bcd7073178c3ed4814af3` 及五附件的大小、SHA256 已逐项核验。

| 诊断 | 采样时间（北京时间） | KLC | 后置 ALC | 已知 USB/PnP |
| --- | --- | --- | --- | --- |
| `GT77HX诊断包.zip` | 08:51:35 | 物理113A/有效2054 | 0 | 5个113A节点，全部Code0 |
| `MControl_Diagnostic_20261011_085310_05356056.zip` | 08:53:10 | 同上 | 0 | 同上 |
| `MControl_Diagnostic_20261011_085934_3f065f1c.zip` | 08:59:34 | 同上 | 0 | 同上 |

三包中 EXE `1.4.6.0` / SHA256 `F6A1190FB1FC952219E0C2BBC326215D4B841D7113C30E9BAA989B8075B72F97` 与正式发布目录一致，排除本次没有升级或运行旧 EXE。旧日志中较早的1.4.4记录没有当作新版结果。

近期恢复记录共有三次，均为 `lighting-mi00=restarted=2/2`、`known-lighting=restored`、`KLC=ready`、`GT77-ALC=missing`；截图与记录一致。恢复的是实际存在的键盘接口，缺失的后置 ALC 没有目标可启用或发送。

当前受限诊断未找到 `VID_1038/PID_1146/114F` 或 Boot `1147/1150`，没有 Code22 被禁用的 ALC，也没有这些 PID 的 Boot 节点。**这只说明这次已知灯控族枚举中没有它们，仍缺异常 USB、历史非当前连接节点及父端口信息。** 不能由这一快照确定最初的触发主体，更不能把没有查到某个 PID 当作硬件损坏证明。

## 补齐 USB 底层证据

下载以下两个文件到同一个文件夹，确认扩展名保持 `.ps1` 和 `.cmd`，双击运行 CMD：

- [只读采集脚本](https://raw.githubusercontent.com/Sakura-Lhy0409/M-Control-Releases/main/support/gt77-usb/Collect-MControlLightingUsbDiagnostics.ps1)
- [双击运行入口](https://raw.githubusercontent.com/Sakura-Lhy0409/M-Control-Releases/main/support/gt77-usb/Run-MControlLightingUsbDiagnostics.cmd)

工具只读取 SteelSeries 当前/历史 USB 和 HID 设备、异常 USB 节点及最多三层父端口，输出新的 `MControl_Lighting_USB_*.zip` 到桌面的 `M-Control-Diagnostics` 文件夹。不修改设备、驱动、注册表或灯效，不启动 M-Control，也不自动上传。设备实例的序列后缀按每包随机标识替换，仅用于同包内关联；不采集电脑名、用户名或序列号字段。

先查看 ZIP 内的 JSON，再通过 M-Control 的原反馈追加提交 ZIP。备注采集时 GG/MSI Center/M-Control 是否运行，以及在完全退出这些软件后龙盾和尾灯是否能被官方软件识别；如需对比，分别采集并标明状态。**不需要再反复点击恢复或提交相同的应用诊断。**

如果脚本未能完整读取，请保留窗口错误和输出；报告会明确记录失败/截断，读取失败不能作为接口不存在的依据。可由 CMD 启动，或在此文件夹使用 Windows PowerShell：

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\Collect-MControlLightingUsbDiagnostics.ps1
```

## 验证边界

采集工具已在 Windows PowerShell5.1实际只读运行验证，并用模拟当前键盘、历史ALC Code45、异常USB Code43和父端口验证完整ZIP、匿名关联与读取失败保持未知。尚未获得原GT77运行此工具的结果。

本次仅补支持工具及证据记录，桌面正式版本仍为1.4.6，未修改产品硬件写入协议。待USB历史与异常端口证据到齐，再决定对应修复路径。
