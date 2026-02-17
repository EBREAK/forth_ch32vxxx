	DFW COMPARE, "COMPARE"
	mv x14, x15
	lw x13, 0(x9)
	lw x12, 4(x9)
	lw x11, 8(x9)
	addi x9, x9, 12
	li x15, 0

	bne x11, x13, 1f
	bne x12, x14, 1f
	ret
1:
	bnez x14, 2f
	bnez x12, 2f
	ret
2:
	beq x12, x14, 4f
	li x15, -1
	blt x12, x14, 3f
	li x15, 1
3:
	ret
4:
	lbu x10, 0(x11)
	lbu x12, 0(x13)
	sub x10, x10, x12
	beqz x10, 5f
	li x15, -1
	bltz x10, 6f
	li x15, 1
	ret
5:
	addi x11, x11, 1
	addi x13, x13, 1
	addi x14, x14, -1
	bnez x14, 4b
6:
	ret
	ENDW COMPARE

	DFW CMOVE, "CMOVE"
	mv x14, x15
	lw x13, 0(x9)
	lw x12, 4(x9)
	lw x15, 8(x9)
	addi x9, x9, 12
	beqz x14, 2f
1:
	lbu x11, 0(x12)
	sb x11, 0(x13)
	addi x12, x12, 1
	addi x13, x13, 1
	addi x14, x14, -1
	bnez x14, 1b
2:
	ret
	ENDW CMOVE
