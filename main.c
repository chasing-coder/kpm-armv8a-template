#include <compiler.h>
#include <kpmodule.h>
#include <linux/printk.h>
#include <linux/kernel.h>
#include <linux/module.h>

KPM_NAME("demo");
KPM_VERSION("1.0.0");
KPM_LICENSE("MIT");
KPM_AUTHOR("fw-QWQ");
KPM_DESCRIPTION("一个 KPM 模块示例");

static long demo_init(const char *args, const char *event, void *__user reserved)
{
    // 模块加载时调用的初始化函数
    pr_info("demo: 模块已加载\n");
    return 0;
}

static long demo_control0(const char *args, char *__user out_msg, int outlen)
{
    // 控制命令 0 的处理函数
    pr_info("demo: 收到控制命令 0\n");

    // 向用户空间传递消息
    const char *msg = "Hello from demo!";
    compat_copy_to_user(out_msg, msg, strlen(msg) + 1);
    
    return 0;
}

static long demo_control1(void *a1, void *a2, void *a3)
{
    // 控制命令 1 的处理函数
    pr_info("demo: 收到控制命令 1\n");
    return 0;
}

static long demo_exit(void *__user reserved)
{
    // 模块卸载时调用的退出函数
    pr_info("demo: 模块已卸载\n");
    return 0;
}

// 定义 KPM 接口
KPM_INIT(demo_init);      // 模块初始化时调用 demo_init 函数
KPM_CTL0(demo_control0);  // 收到控制命令 0 时调用 demo_control0 函数
KPM_CTL1(demo_control1);  // 收到控制命令 1 时调用 demo_control1 函数
KPM_EXIT(demo_exit);      // 模块卸载时调用 demo_exit 函数