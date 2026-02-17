	DFW NOOP, "NOOP"
	ret
	ENDW NOOP

	DFW 0X0, "$0"
	LIT 0x0
	ret
	ENDW 0X0

	DFW 0X1, "$1"
	LIT 0x1
	ret
	ENDW 0X1

	DFW 0X2, "$2"
	LIT 0x2
	ret
	ENDW 0X2

	DFW 0X3, "$3"
	LIT 0x3
	ret
	ENDW 0X3

	DFW 0X4, "$4"
	LIT 0x4
	ret
	ENDW 0X4

	DFW 0X5, "$5"
	LIT 0x5
	ret
	ENDW 0X5

	DFW 0X6, "$6"
	LIT 0x6
	ret
	ENDW 0X6

	DFW 0X7, "$7"
	LIT 0x7
	ret
	ENDW 0X7

	DFW 0X8, "$8"
	LIT 0x8
	ret
	ENDW 0X8

	DFW 0X9, "$9"
	LIT 0x9
	ret
	ENDW 0X9

	DFW 0XA, "$A"
	LIT 0xA
	ret
	ENDW 0XA

	DFW 0XB, "$B"
	LIT 0xB
	ret
	ENDW 0XB

	DFW 0XC, "$C"
	LIT 0xC
	ret
	ENDW 0XC

	DFW 0XD, "$D"
	LIT 0xD
	ret
	ENDW 0XD

	DFW 0XE, "$E"
	LIT 0xE
	ret
	ENDW 0XE

	DFW 0XF, "$F"
	LIT 0xF
	ret
	ENDW 0XF

	DFW DROP, "DROP"
	PPOP x15
	ret
	ENDW DROP

	DFW DUP, "DUP"
	PPUSH x15
	ret
	ENDW DUP

	DFW SWAP, "SWAP"
	mv x14, x15
	lw x15, 0(x9)
	sw x14, 0(x9)
	ret
	ENDW SWAP

	DFW TOR, ">R"
	RPUSH x15
	PPOP x15
	ret
	ENDW TOR

	DFW FROMR, "R>"
	PPUSH x15
	RPOP x15
	ret
	ENDW FROMR

	DFW OVER, "OVER"
	PPUSH x15
	lw x15, 4(x9)
	ret
	ENDW OVER

	DFW NIP, "NIP"
	addi x9, x9, 4
	ret
	ENDW NIP

	DFW ROT, "ROT"
	lw x14, 0(x9)
	lw x13, 4(x9)
	sw x15, 0(x9)
	sw x14, 4(x9)
	mv x15, x13
	ret
	ENDW ROT

	DFW NROT, "-ROT"
	lw x14, 0(x9)
	lw x13, 4(x9)
	sw x15, 4(x9)
	sw x13, 0(x9)
	mv x15, x14
	ret
	ENDW NROT

	DFW PICK, "PICK"
	slli x15, x15, 2
	add x14, x9, x15
	lw x15, 0(x14)
	ret
	ENDW PICK

	DFW 2DROP, "2DROP"
	lw x15, 4(x9)
	addi x9, x9, 8
	ret	
	ENDW 2DROP

	DFW 2DUP, "2DUP"
	lw x14, 0(x9)
	addi x9, x9, -8
	sw x15, 4(x9)
	sw x14, 0(x9)
	ret
	ENDW 2DUP

	DFW 2SWAP, "2SWAP"
	lw x14, 0(x9)
	lw x13, 4(x9)
	lw x12, 8(x9)
	sw x14, 8(x9)
	sw x15, 4(x9)
	sw x12, 0(x9)
	mv x15, x13
	ret
	ENDW 2SWAP

	DFW 2OVER, "2OVER"
	lw x13, 4(x9)
	lw x12, 8(x9)
	addi x9, x9, -8
	sw x15, 4(x9)
	sw x12, 0(x9)
	mv x15, x13
	ret
	ENDW 2OVER

	DFW 2NIP, "2NIP"
	lw x14, 0(x9)
	addi x9, x9, 8
	sw x14, 0(x9)
	ret
	ENDW 2NIP

	DFW 3DROP, "3DROP"
	lw x15, 8(x9)
	addi x9, x9, 12
	ret	
	ENDW 3DROP

	DFW 3DUP, "3DUP"
	RPUSH x1
	NC W_DUP; NC W_2OVER; NC W_ROT;
	RPOP x1
	ret
	ENDW 3DUP

	DFW PLUS, "+"
	PPOP x14
	add x15, x14, x15
	ret
	ENDW PLUS
	
	DFW MINUS, "-"
	PPOP x14
	sub x15, x14, x15
	ret
	ENDW MINUS

	DFW 1PLUS, "1+"
	addi x15, x15, 1
	ret
	ENDW 1PLUS

	DFW 2PLUS, "2+"
	addi x15, x15, 2
	ret
	ENDW 2PLUS

	DFW 4PLUS, "4+"
	addi x15, x15, 4
	ret
	ENDW 4PLUS

	DFW 8PLUS, "8+"
	addi x15, x15, 8
	ret
	ENDW 8PLUS

	DFW 1MINUS, "1-"
	addi x15, x15, -1
	ret
	ENDW 1MINUS

	DFW 2MINUS, "2-"
	addi x15, x15, -2
	ret
	ENDW 2MINUS

	DFW 4MINUS, "4-"
	addi x15, x15, -4
	ret
	ENDW 4MINUS

	DFW 8MINUS, "8-"
	addi x15, x15, -8
	ret
	ENDW 8MINUS

	DFW LSHIFT, "LSHIFT"
	PPOP x14
	sll x15, x14, x15
	ret
	ENDW LSHIFT

	DFW RSHIFT, "RSHIFT"
	PPOP x14
	srl x15, x14, x15
	ret
	ENDW RSHIFT

	DFW 2MULTI, "2*"
	slli x15, x15, 1
	ret
	ENDW 2MULTI

	DFW 4MULTI, "4*"
	slli x15, x15, 2
	ret
	ENDW 4MULTI

	DFW 8MULTI, "8*"
	slli x15, x15, 3
	ret
	ENDW 8MULTI

	DFW 2DIVID, "2/"
	srli x15, x15, 1
	ret
	ENDW 2DIVID

	DFW 4DIVID, "4/"
	srli x15, x15, 2
	ret
	ENDW 4DIVID

	DFW 8DIVID, "8/"
	srli x15, x15, 3
	ret
	ENDW 8DIVID

	DFW XOR, "XOR"
	PPOP x14
	xor x15, x14, x15
	ret
	ENDW XOR

	DFW INVERT, "INVERT"
	xori x15, x15, -1
	ret
	ENDW INVERT

	DFW NEGATE, "NEGATE"
	xori x15, x15, -1
	addi x15, x15, 1
	ret
	ENDW NEGATE

	DFW ABS, "ABS"
	srai x14, x15, 0x1F
	xor x15, x15, x14
	sub x15, x15, x14
	ret
	ENDW ABS

	DFW AND, "AND"
	PPOP x14
	and x15, x14, x15
	ret
	ENDW AND

	DFW OR, "OR"
	PPOP x14
	or x15, x14, x15
	ret
	ENDW OR

	DFW EQ, "="
	mv x14, x15
	PPOP x13
	li x15, TRUE
	beq x13, x14, 1f
	li x15, FALSE
1:
	ret
	ENDW EQ

	DFW EQZ, "0="
	mv x14, x15
	li x15, TRUE
	beqz x14, 1f
	li x15, FALSE
1:
	ret
	ENDW EQZ

	DFW NE, "<>"
	mv x14, x15
	PPOP x13
	li x15, TRUE
	bne x13, x14, 1f
	li x15, FALSE
1:
	ret
	ENDW NE

	DFW NEZ, "0<>"
	mv x14, x15
	li x15, TRUE
	bnez x14, 1f
	li x15, FALSE
1:
	ret
	ENDW NEZ

	DFW LT, "<"
	mv x14, x15
	PPOP x13
	li x15, TRUE
	blt x13, x14, 1f
	li x15, FALSE
1:
	ret
	ENDW LT

	DFW LTZ, "0<"
	mv x14, x15
	li x15, TRUE
	bltz x14, 1f
	li x15, FALSE
1:
	ret
	ENDW LTZ

	DFW ULT, "U<"
	mv x14, x15
	PPOP x13
	li x15, TRUE
	bltu x13, x14, 1f
	li x15, FALSE
1:
	ret
	ENDW ULT


	DFW GT, ">"
	mv x14, x15
	PPOP x13
	li x15, TRUE
	bgt x13, x14, 1f
	li x15, FALSE
1:
	ret
	ENDW GT

	DFW GTZ, "0>"
	mv x14, x15
	li x15, TRUE
	bgtz x14, 1f
	li x15, FALSE
1:
	ret
	ENDW GTZ

	DFW UGT, "U>"
	mv x14, x15
	PPOP x13
	li x15, TRUE
	bgtu x13, x14, 1f
	li x15, FALSE
1:
	ret
	ENDW UGT

	DFW CLOAD, "C@"
	lbu x15, 0(x15)
	ret
	ENDW CLOAD

	DFW WLOAD, "W@"
	andi x14, x15, 0x1
	beqz x14, 1f
	lbu x14, 0(x15)
	lbu x13, 1(x15)
	slli x13, x13, 8
	or x15, x14, x13
	ret
1:
	lhu x15, 0(x15)
	ret
	ENDW WLOAD

	DFW LLOAD, "L@"
	andi x14, x15, 0x3
	beqz x14, 2f
	andi x14, x15, 0x1
	beqz x14, 1f
	lbu x14, 0(x15)
	lbu x13, 1(x15)
	slli x13, x13, 8
	or x14, x14, x13
	lbu x13, 2(x15)
	slli x13, x13, 16
	or x14, x14, x13
	lbu x13, 3(x15)
	slli x13, x13, 24
	or x15, x14, x13
	ret
1:
	lhu x14, 0(x15)
	lhu x13, 2(x15)
	slli x13, x13, 16
	or x15, x13, x14
	ret
2:
	lw x15, 0(x15)
	ret
	ENDW LLOAD

	.section .bss
	.P2ALIGN 2, 0
FORTH_DP:
	.4BYTE 0X0

	DFW DP, "DP"
	LITA FORTH_DP
	ret
	ENDW DP

	DFW HERE, "HERE"
	RPUSH x1
	NC W_DP; NC W_LLOAD;
	RPOP x1
	ret
	ENDW HERE;

	DFW PAD, "PAD"
	RPUSH x1
	NC W_HERE; addi x15, x15, 128
	RPOP x1
	ret
	ENDW PAD

	DFW CSTORE, "C!"
	lbu x14, 0(x9)
	sb x14, 0(x15)
	lw x15, 4(x9)
	addi x9, x9, 8
	ret
	ENDW CSTORE

	DFW WSTORE, "W!"
	lhu x13, 0(x9)
	mv x14, x15
	lw x15, 4(x9)
	addi x9, x9, 8
	andi x12, x14, 0x1
	beqz x12, 1f
	sb x13, 0(x14)
	srli x13, x13, 8
	sb x13, 1(x14)
	ret
1:
	sh x13, 0(x14)
	ret
	ENDW WSTORE

	DFW LSTORE, "L!"
	lw x13, 0(x9)
	mv x14, x15
	lw x15, 4(x9)
	addi x9, x9, 8
	andi x12, x14, 0x3
	beqz x12, 2f
	andi x12, x14, 0x1
	beqz x12, 1f
	sb x13, 0(x14)
	srli x13, x13, 8
	sb x13, 1(x14)
	srli x13, x13, 8
	sb x13, 2(x14)
	srli x13, x13, 8
	sb x13, 3(x14)
	ret
1:
	sh x13, 0(x14)
	srli x13, x13, 16
	sh x13, 2(x14)
	ret
2:
	sw x13, 0(x14)
	ret
	ENDW LSTORE

	DFW ALLOT, "ALLOT"
	RPUSH x1
	NC W_DP; NC W_LLOAD; NC W_PLUS; NC W_DP; NC W_LSTORE
	RPOP x1
	ret
	ENDW ALLOT

	DFW WALIGNED, "WALIGNED"
	addi x15, x15, 1
	andi x15, x15, -2
	ret
	ENDW WALIGNED

	DFW LALIGNED, "LALIGNED"
	addi x15, x15, 3
	andi x15, x15, -4
	ret
	ENDW LALIGNED

	DFW WALIGN, "WALIGN"
	RPUSH x1
	NC W_DP; NC W_LLOAD; NC W_WALIGNED; NC W_DP; NC W_LSTORE
	RPOP x1
	ret
	ENDW WALIGN

	DFW LALIGN, "LALIGN"
	RPUSH x1
	NC W_DP; NC W_LLOAD; NC W_LALIGNED; NC W_DP; NC W_LSTORE
	RPOP x1
	ret
	ENDW LALIGN

	DFW CCOMMA, "C,"
	RPUSH x1
	NC W_HERE; NC W_0X1; NC W_ALLOT; NC W_CSTORE;
	RPOP x1
	ret
	ENDW CCOMMA

	DFW WCOMMA, "W,"
	RPUSH x1
	NC W_HERE; NC W_0X2; NC W_ALLOT; NC W_WSTORE;
	RPOP x1
	ret
	ENDW WCOMMA

	DFW LCOMMA, "L,"
	RPUSH x1
	NC W_HERE; NC W_0X4; NC W_ALLOT; NC W_LSTORE;
	RPOP x1
	ret
	ENDW LCOMMA

	DFW UPLOAD, "UP@"
	PPUSH x15
	mv x15, x4
	ret
	ENDW UPLOAD

	DFW PAUSE, "PAUSE"
	sw x1, USER_RAP(x4)
	sw x8, USER_RSP(x4)
	sw x9, USER_PSP(x4)
	sw x15, USER_TOS(x4)
	lw x4, USER_NXT(x4)
	lw x1, USER_RAP(x4)
	lw x8, USER_RSP(x4)
	lw x9, USER_PSP(x4)
	lw x15, USER_TOS(x4)
	ret
	ENDW PAUSE

	DFW EXECUTE, "EXECUTE"
	mv x14, x15
	PPOP x15
	jr x14
	ENDW EXECUTE

	DFW PERFORM, "PERFORM"
	RPUSH x1
	NC W_LLOAD; NC W_EXECUTE
	RPOP x1
	ret
	ENDW PERFORM
