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
	rm -fv boot/boot.o

build: kheynel.bin

kheynel.bin: boot/boot.o kernel/kernel.o
	$(LD) $(LDFLAGS) -T kernel/linker.ld $^ -o $@

boot/boot.o: boot/boot.asm
	$(AS) $(ASFLAGS) $< -o $@

kernel/%.o: kernel/%.c
	$(CC) $(CFLAGS) $< -o $@

