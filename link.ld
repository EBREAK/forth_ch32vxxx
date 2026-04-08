ENTRY(_start)

MEMORY {
	FLASH (rx) : ORIGIN = 0x00000000, LENGTH = 64K
	SRAM (rwx) : ORIGIN = 0x20000200, LENGTH = 1536 # REVERSE SOME SPACE FOR IRQ VECTOR
}

SECTIONS {
	.init :
	{
		*(.init)
		*(.init*)
	} > FLASH

	.text :
	{
		*(.text)
		*(.text*)
	} > FLASH

	.rodata :
	{
		*(.rodata)
		*(.rodata*)
	} > FLASH

	.bss (NOLOAD) :
	{
		*(.bss)
		*(.bss*)
		. = ALIGN(4);
		PROVIDE(_ebss = .);
	} > SRAM

	PROVIDE(__global_pointer$ = ORIGIN(SRAM) + 0x800);
}
