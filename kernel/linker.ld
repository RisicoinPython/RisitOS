ENTRY(_start)
OUTPUT_FORMAT(elf32-i386)

SECTIONS {
    /* Le noyau sera chargé vers 1 Mib */
    . = 1M;

    /* Il est nécéssaire de mettre l'en-tête au début du noyau
        ou il ne sera pas reconnu par le bootloader. */
    .text BLOCK(4K) : ALIGN(4K) {
        *(.multiboot)
        *(.text)
    }

    /* Données en lecture seule */
    .rodata BLOCK(4K) : ALIGN(4K) {
        *(.rodata)
    }

    /* Données */
    .data BLOCK(4K) : ALIGN(4K) {
        *(.data)
    }

    /* Données non initialisées (comme la pile) */
    .bss BLOCK(4K) : ALIGN(4K) {
		*(COMMON)
		*(.bss)
	}
}