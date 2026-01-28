# Makefile for Kernel Patch Module (KPM) - Native ARM64 Build

# 定义 KernelPatch 目录和仓库地址
ifndef KP_DIR
    KP_DIR = ./KernelPatch
endif
KP_URL = https://github.com/bmax121/KernelPatch.git

# --- 工具链配置  ---
CC      = clang
LD      = ld.lld
OBJCOPY = llvm-objcopy
STRIP   = llvm-strip

# --- 包含路径 ---
INCLUDE_DIRS := . include patch/include linux/include linux/arch/arm64/include linux/tools/arch/arm64/include
INCLUDE_FLAGS := $(foreach dir,$(INCLUDE_DIRS),-I$(KP_DIR)/kernel/$(dir))

# --- 编译参数 ---
CFLAGS  = -I$(AP_INCLUDE_PATH) $(INCLUDE_FLAGS) \
          -Wall -O2 \
          -fno-PIC \
          -fno-asynchronous-unwind-tables \
          -fno-stack-protector \
          -fno-unwind-tables \
          -fno-semantic-interposition \
          -U_FORTIFY_SOURCE \
          -fno-common \
          -fvisibility=hidden

# --- 链接参数 ---
LDFLAGS += -s

# 目标对象
objs := main.o

# --- 构建规则 ---

all: main.kpm

# 链接 (Link)
main.kpm: ${objs}
	${CC} $(LDFLAGS) -T exclude.lds -r -o $@ $^
	${STRIP} -g --strip-unneeded --strip-debug --remove-section=.comment --remove-section=.note.GNU-stack $@

# 编译 (Compile)
%.o: %.c
	${CC} $(CFLAGS) -c -o $@ $<

# --- 更新 KernelPatch 源码 ---
update:
	@echo "Cleaning old KernelPatch directory..."
	rm -rf $(KP_DIR)
	@echo "Cloning fresh KernelPatch from $(KP_URL)..."
	git clone $(KP_URL) $(KP_DIR)
	@echo "Done."

# --- 清理 ---
.PHONY: clean update
clean:
	rm -rf *.o *.kpm *.bak
