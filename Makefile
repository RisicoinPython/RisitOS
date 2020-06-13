ASM=nasm
ASMFLAGS=-f bin -O0

TARGET=i686-elf

CC=$(TARGET)-gcc
CFLAGS=-c -ffreestanding -g -Wall -Wextra

AS=$(TARGET)-as
ASFLAGS=

LD=$(TARGET)-gcc
LDFLAGS=-nostdlib -g -lgcc -ffreestanding -shared

.PHONY: clean build

clean:
	rm -fv kernel/*.o
	rm -fv kheynel.bin

build: kheynel.bin

kheynel.bin: kernel/boot.o kernel/kernel.o
	$(LD) $(LDFLAGS) -T kernel/linker.ld $^ -o $@

kernel/boot.o: kernel/boot.asm
	$(AS) $(ASFLAGS) $< -o $@

kernel/%.o: kernel/%.c
	$(CC) $(CFLAGS) $< -o $@

