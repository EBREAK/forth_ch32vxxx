elf-gas:
	riscv-none-elf-gcc -T link.ld -static -march=rv32ec_zicsr -mabi=ilp32e -nostdlib -nostartfiles -ggdb FORTH.S -o FORTH.elf
	riscv-none-elf-objdump -d FORTH.elf > FORTH.dis
	riscv-none-elf-size FORTH.elf

ocd:
	openocd-wch -f wch-riscv.cfg

db: elf
	gdb

flash: swd-flash

swd-flash:
	wlink flash FORTH.elf

usb-flash:
	wchisp flash FORTH.elf

clean:
	rm -vf *.elf *.bin *.out *.dis *.map *.hex *.o
