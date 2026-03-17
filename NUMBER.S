	DFW ISNUMBER, "NUMBER?"
	mv x14, x15
	lw x13, 0(x9)
	addi x9, x9, 4
	li x15, FALSE
	li x12, 2
	blt x14, x12, 8f
	lbu x12, 0(x13)
	li x11, '$'
	bne x11, x12, 8f
	addi x14, x14, -1
	addi x13, x13, 1
1:
	lbu x12, 0(x13)
	li x11, '0'
	blt x12, x11, 8f
	li x11, 'F'
	bgt x12, x11, 8f
	li x11, '9'
	ble x12, x11, 2f
	li x11, 'A'
	bge x12, x11, 2f
	j 8f
2:
	addi x14, x14, -1
	addi x13, x13, 1
	bnez x14, 1b
	li x15, TRUE
8:
	ret
	ENDW ISNUMBER

	DFW TONUMBER, ">NUMBER"
	mv x14, x15
	lw x13, 0(x9)
	addi x9, x9, 4
	li x15, 0x0
	lbu x12, 0(x13)
	li x11, '$'
	bne x11, x12, 1f
	# skip '$'
	addi x13, x13, 1
	addi x14, x14, -1
1:
	blez x14, 8f
2:
	lbu x12, 0(x13)
	li x11, '9'
	ble x12, x11, 3f
	addi x12, x12, -7
3:
	addi x12, x12, -48
	addi x11, x14, -1
	slli x11, x11, 2
	sll x12, x12, x11
	or x15, x15, x12
	addi x13, x13, 1
	addi x14, x14, -1
	bnez x14, 2b
8:
	ret
	ENDW TONUMBER
