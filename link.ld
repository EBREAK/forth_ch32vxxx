ENTRY(_start)

MEMORY {
	FLASH (rx) : ORIGIN = 0x00000000, LENGTH = 32K
	SRAM (rwx) : ORIGIN = 0x20000000, LENGTH = 2K
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
