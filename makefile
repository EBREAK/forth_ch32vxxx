elf-gas:
	riscv64-unknown-elf-gcc -T link.ld -static -march=rv32ec_zicsr -mabi=ilp32e -nostdlib -nostartfiles -ggdb FORTH.S -o FORTH.elf
	riscv64-unknown-elf-objdump -d FORTH.elf > FORTH.dis
	riscv64-unknown-elf-objcopy -O ihex FORTH.elf FORTH.hex
	riscv64-unknown-elf-size FORTH.elf

ocd:
	openocd-wch -f wch-riscv.cfg

db:
	riscv-none-elf-gdb

flash: swd-flash

swd-flash:
	wlink flash FORTH.elf

usb-flash:
	wchisp flash FORTH.elf

clean:
	rm -vf *.elf *.bin *.out *.dis *.map *.hex *.o
