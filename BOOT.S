	.section .init
_start:
	.global _start
	.option norvc
	j reset
	.option rvc
reset:
	.option push
	.option norelax
	la x3, __global_pointer$
	.option pop

	li x1, 0
	li x2, 0
	li x4, 0
	li x5, 0
	li x6, 0
	li x7, 0
	li x8, 0
	li x9, 0
	li x10, 0
	li x11, 0
	li x12, 0
	li x13, 0
	li x14, 0
	li x15, 0

	tail main
