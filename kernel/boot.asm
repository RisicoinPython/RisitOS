.set ALIGN_MODULES, 1 << 0
.set MEMORY_INFO,   1 << 1
.set VIDEO_INFO,    1 << 2
.set FLAGS,         ALIGN_MODULES | MEMORY_INFO
.set MAGIC,         0x1BADB002
.set CHECKSUM,      -(MAGIC + FLAGS)

// L'en-tête multiboot, nécéssaire pour être reconnu par GRUB
.section .multiboot
.align 4
.long MAGIC
.long FLAGS
.long CHECKSUM

// La pile (qui sera de 16ko pour le moment)
.section .bss
.align 16
stack_bottom:
   .skip 16384         /* 16 Kio */
stack_top:

// Le code
.section .text
.global _start
.type _start, @function

_start: mov $stack_top, %esp
        call main

        cli
loop:   hlt
        jmp loop

.size _start, . - _start
