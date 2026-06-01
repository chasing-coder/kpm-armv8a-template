# KPM ARMv8a 模板

这是一个 KPM 模板仓库，旨在为 ARM v8a 架构的设备编译可用的 KernelPatch 内核模块。项目中包含了一个示意性的 `main.c` 文件，展示了如何编写和编译内核模块。

## 功能
- 提供了一个适用于 ARM v8a 设备的内核模块开发模板。
- 通过 `make update` 拉取 KernelPatch 源码，并可以直接在 `main.c` 中编写代码。
- 使用 `make` 命令来构建和编译内核模块。

## 使用说明
1. 克隆仓库：
```bash
git clone https://github.com/chasing-coder/kpm-armv8a-template.git
```

或者

```bash
git clone git@github.com:chasing-coder/kpm-armv8a-template.git
```
3. 更新 KernelPatch 源码：
```bash
make update
```

3. 编写自定义内核模块代码： 修改 main.c 文件，添加你的内核模块代码。

4. 编译内核模块：
```bash
make
```

5. 将编译好的内核模块加载到设备中进行测试。


许可证

本项目采用 Creative Commons Attribution 4.0 International (CC BY 4.0) 许可证。你可以自由地复制、修改、分发和表演该作品，甚至用于商业目的，但需要遵循以下条款：

署名：你必须给予适当的信用，提供许可证链接，并说明是否进行了更改。你可以以合理的方式进行，但不得以任何方式暗示许可方对你或你的使用表示认可。


[完整许可证信息](https://creativecommons.org/licenses/by/4.0/)
