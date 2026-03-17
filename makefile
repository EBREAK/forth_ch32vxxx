CROSS_COMPILE ?= riscv32-qingkev2a-elf-
CC = $(CROSS_COMPILE)gcc
OD = $(CROSS_COMPILE)objdump
OC = $(CROSS_COMPILE)objcopy
SZ = $(CROSS_COMPILE)size

elf-gas:
	$(CC) -T link.ld -static -march=rv32ec_zicsr_zifencei -mabi=ilp32e -nostdlib -nostartfiles -ggdb FORTH.S -o FORTH.elf
	$(OD) -d FORTH.elf > FORTH.dis
	$(OC) -O ihex FORTH.elf FORTH.hex
	$(SZ) FORTH.elf

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
