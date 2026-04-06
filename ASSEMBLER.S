	DFW ASM_J_TYPE, "J-TYPE"
	# ( OFFSET RD OPCODE -- INST32 )
	lw x14, 0(x9)
	lw x13, 4(x9)
	addi x9, x9, 8
	slli x14, x14, 7
	or x15, x15, x14
	li x11, 0xFF000
	and x12, x13, x11
	or x15, x15, x12
	li x11, 0x800
	and x12, x13, x11
	slli x12, x12, 9
	or x15, x15, x12
	li x11, 0x7FE
	and x12, x13, x11
	slli x12, x12, 20
	or x15, x15, x12
	li x11, 0x100000
	and x12, x13, x11
	slli x12, x12, 11
	or x15, x15, x12
	ret
	ENDW ASM_J_TYPE

	DFW ASM_DIS_J_TYPE, "DIS-J-TYPE"
	# ( INST32 -- OFFSET RD OPCODE )
	srli x14, x15, 7
	andi x14, x14, 0x1F
	li x11, 0xFF000
	and x13, x15, x11
	li x11, 0x100000
	and x12, x15, x11
	srli x12, x12, 9
	or x13, x13, x12
	li x11, 0x7FE00000
	and x12, x15, x11
	srli x12, x12, 20
	or x13, x13, x12
	li x11, 0x80000000
	and x12, x15, x11
	srli x12, x12, 11
	beqz x12, 1f
	li x11, 0xFFE00000
	or x12, x12, x11
1:
	or x13, x13, x12
	addi x9, x9, -8
	sw x14, 0(x9)
	sw x13, 4(x9)
	andi x15, x15, 0x7F
	ret
	ENDW ASM_DIS_J_TYPE

	DFW ASM_U_TYPE, "U-TYPE"
	# ( HI20 RD OPCODE -- INST32 )
	lw x14, 0(x9)
	lw x13, 4(x9)
	addi x9, x9, 8
	slli x14, x14, 7
	or x15, x15, x14
	slli x13, x13, 12
	or x15, x15, x13
	ret
	ENDW ASM_U_TYPE

	DFW ASM_DIS_U_TYPE, "DIS-U-TYPE"
	# ( INST32 -- HI20 RD OPCODE )
	srli x14, x15, 7
	andi x14, x14, 0x1F
	srli x13, x15, 12
	addi x9, x9, -8
	sw x14, 0(x9)
	sw x13, 4(x9)
	andi x15, x15, 0x7F
	ret
	ENDW ASM_DIS_U_TYPE

	DFW ASM_I_TYPE, "I-TYPE"
	# ( IMM RS1 RD FUNCT3+OPCODE -- INST32 )
	lw x14, 0(x9)
	lw x13, 4(x9)
	lw x12, 8(x9)
	addi x9, x9, 12
	slli x14, x14, 7
	or x15, x15, x14
	slli x13, x13, 15
	or x15, x15, x13
	slli x12, x12, 20
	or x15, x15, x12
	ret
	ENDW ASM_I_TYPE

	DFW ASM_DIS_I_TYPE, "DIS-I-TYPE"
	# ( INST32 -- IMM RS1 RD FUNCT3+OPCODE )
	srli x14, x15, 7
	andi x14, x14, 0x1F
	srli x13, x15, 15
	andi x13, x13, 0x1F
	srai x12, x15, 20
	addi x9, x9, -12
	sw x14, 0(x9)
	sw x13, 4(x9)
	sw x12, 8(x9)
	li x11, 0x707F
	and x15, x15, x11
	ret
	ENDW ASM_DIS_I_TYPE

	DFW ASM_S_TYPE, "S-TYPE"
	# ( OFFSET RS2 RS1 FUNCT3+OPCODE -- INST32 )
	lw x14, 0(x9)
	lw x13, 4(x9)
	lw x12, 8(x9)
	addi x9, x9, 12
	slli x14, x14, 15
	or x15, x15, x14
	slli x13, x13, 20
	or x15, x15, x13
	andi x11, x12, 0x1F
	slli x11, x11, 7
	or x15, x15, x11
	srli x11, x12, 5
	andi x11, x11, 0x7F
	slli x11, x11, 25
	or x15, x15, x11
	ret
	ENDW ASM_S_TYPE

	DFW ASM_DIS_S_TYPE, "DIS-S-TYPE"
	# ( INST32 -- OFFSET RS2 RS1 FUNCT3+OPCODE )
	srli x14, x15, 15
	andi x14, x14, 0x1F
	srli x13, x15, 20
	andi x13, x13, 0x1F
	srli x12, x15, 7
	andi x12, x12, 0x1F
	li x10, 0xFE000000
	and x11, x15, x10
	srai x11, x11, 20
	or x12, x12, x11
	addi x9, x9, -12
	sw x14, 0(x9)
	sw x13, 4(x9)
	sw x12, 8(x9)
	li x11, 0x707F
	and x15, x15, x11
	ret
	ENDW ASM_DIS_S_TYPE

	DFW ASM_B_TYPE, "B-TYPE"
	# ( OFFSET RS2 RS1 FUNCT3+OPCODE -- INST32 )
	lw x14, 0(x9)
	lw x13, 4(x9)
	lw x12, 8(x9)
	addi x9, x9, 12
	slli x14, x14, 15
	or x15, x15, x14
	slli x13, x13, 20
	or x15, x15, x13
	li x11, 0x800
	and x10, x12, x11
	srli x10, x10, 4
	or x15, x15, x10
	andi x10, x12, 0x1E
	slli x10, x10, 7
	or x15, x15, x10
	li x11, 0x7E0
	and x10, x12, x11
	slli x10, x10, 20
	or x15, x15, x10
	li x11, 0x1000
	and x10, x12, x11
	slli x10, x10, 19
	or x15, x15, x10
	ret
	ENDW ASM_B_TYPE

	DFW ASM_DIS_B_TYPE, "DIS-B-TYPE"
	# ( INST32 -- OFFSET RS2 RS1 FUNCT3+OPCODE )
	srli x14, x15, 15
	andi x14, x14, 0x1F
	srli x13, x15, 20
	andi x13, x13, 0x1F
	srli x12, x15, 7
	andi x12, x12, 0x1E
	andi x11, x15, 0x80
	slli x11, x11, 4
	or x12, x12, x11
	srli x11, x15, 20
	li x10, 0x7E0
	and x11, x11, x10
	or x12, x12, x11
	li x10, 0x80000000
	and x11, x15, x10
	srai x11, x11, 19
	or x12, x12, x11
	addi x9, x9, -12
	sw x14, 0(x9)
	sw x13, 4(x9)
	sw x12, 8(x9)
	li x11, 0x707F
	and x15, x15, x11
	ret
	ENDW ASM_DIS_B_TYPE

	DFW ASM_R_TYPE, "R-TYPE"
	# ( RS2 RS1 RD FUNCT7+FUNCT3+OPCODE -- INST32 )
	lw x14, 0(x9)
	lw x13, 4(x9)
	lw x12, 8(x9)
	addi x9, x9, 12
	slli x14, x14, 7
	or x15, x15, x14
	slli x13, x13, 15
	or x15, x15, x13
	slli x12, x12, 20
	or x15, x15, x12
	ret
	ENDW ASM_R_TYPE

	DFW ASM_DIS_R_TYPE, "DIS-R-TYPE"
	# ( INST32 -- RS2 RS1 RD FUNCT7+FUNCT3+OPCODE )
	srli x14, x15, 7
	andi x14, x14, 0x1F
	srli x13, x15, 15
	andi x13, x13, 0x1F
	srli x12, x15, 20
	andi x12, x12, 0x1F
	addi x9, x9, -12
	sw x14, 0(x9)
	sw x13, 4(x9)
	sw x12, 8(x9)
	li x11, 0xfe00707f
	and x15, x15, x11
	ret
	ENDW ASM_DIS_R_TYPE

	DFW ASM_CJ_TYPE, "CJ-TYPE"
	# ( OFFSET FUNCT3+OPCODE -- INST16 )
	lw x14, 0(x9)
	addi x9, x9, 4
	andi x13, x14, 0x20
	srli x13, x13, 3
	or x15, x15, x13
	andi x13, x14, 0xE
	slli x13, x13, 2
	or x15, x15, x13
	andi x13, x14, 0x80
	srli x13, x13, 1
	or x15, x15, x13
	andi x13, x14, 0x40
	slli x13, x13, 1
	or x15, x15, x13
	andi x13, x14, 0x400
	srli x13, x13, 2
	or x15, x15, x13
	andi x13, x14, 0x300
	slli x13, x13, 1
	or x15, x15, x13
	andi x13, x14, 0x10
	slli x13, x13, 7
	or x15, x15, x13
	li x12, 0x800
	and x13, x14, x12
	slli x13, x13, 1
	or x15, x15, x13
	ret
	ENDW ASM_CJ_TYPE

	DFW ASM_DIS_CJ_TYPE, "DIS-CJ-TYPE"
	# ( INST16 -- OFFSET FUNCT3+OPCODE )
	andi x14, x15, 0x4
	slli x14, x14, 3
	andi x13, x15, 0b111000
	srli x13, x13, 2
	or x14, x14, x13
	andi x13, x15, 0x40
	slli x13, x13, 1
	or x14, x14, x13
	andi x13, x15, 0x80
	srli x13, x13, 1
	or x14, x14, x13
	andi x13, x15, 0x100
	slli x13, x13, 2
	or x14, x14, x13
	andi x13, x15, 0x600
	srli x13, x13, 1
	or x14, x14, x13
	srli x13, x15, 7
	andi x13, x13, 0x10
	or x14, x14, x13
	srli x13, x15, 1
	li x12, 0b100000000000
	and x13, x13, x12
	beqz x13, 1f
	li x13, 0xFFFFF800
1:
	or x14, x14, x13
	li x13, 0xE003;
	and x15, x15, x13;
	addi x9, x9, -4
	sw x14, 0(x9)
	ret
	ENDW ASM_DIS_CJ_TYPE

	DFW ASM_CI_TYPE, "CI-TYPE"
	# ( IMM RS1/RD FUNCT3+OPCODE -- INST16 )
	lw x14, 0(x9)
	lw x13, 4(x9)
	addi x9, x9, 8
	slli x14, x14, 7
	or x15, x15, x14
	andi x12, x13, 0x1F
	slli x12, x12, 2
	or x15, x15, x12
	andi x12, x13, 0x20
	slli x12, x12, 7
	or x15, x15, x12
	ret
	ENDW ASM_CI_TYPE

	DFW ASM_DIS_CI_TYPE, "DIS-CI-TYPE"
	# ( INST16 -- IMM RS1/RD FUNCT3+OPCODE )
	srli x14, x15, 7
	andi x14, x14, 0x1F
	srli x13, x15, 2
	andi x13, x13, 0x1F
	srli x12, x15, 7
	andi x12, x12, (1 << 5)
	beqz x12, 1f
	li x12, 0xFFFFFFE0
1:
	or x13, x13, x12
	li x12, 0xE003
	and x15, x15, x12
	addi x9, x9, -8
	sw x14, 0(x9)
	sw x13, 4(x9)
	ret
	ENDW ASM_DIS_CI_TYPE

	DFW ASM_CB_TYPE, "CB-TYPE"
	# ( OFFSET RS1 FUNCT3+OPCODE -- INST16 )
	lw x14, 0(x9)
	lw x13, 4(x9)
	addi x9, x9, 8
	addi x14, x14, -8
	slli x14, x14, 7
	or x15, x15, x14
	srli x12, x13, 3
	andi x12, x12, 0x4
	or x15, x15, x12
	andi x12, x13, 0x6
	slli x12, x12, 2
	or x15, x15, x12
	andi x12, x13, (3 << 6)
	srli x12, x12, 1
	or x15, x15, x12
	andi x12, x13, (3 << 3)
	slli x12, x12, 7
	or x15, x15, x12
	andi x12, x13, (1 << 8)
	slli x12, x12, 4
	or x15, x15, x12
	ret
	ENDW ASM_CB_TYPE

	DFW ASM_DIS_CB_TYPE, "DIS-CB-TYPE"
	# ( INST16 -- OFFSET RS1 FUNCT3+OPCODE )
	srli x14, x15, 7
	andi x14, x14, 0x7
	addi x14, x14, 0x8
	andi x13, x15, 0x4
	slli x13, x13, 3
	andi x12, x15, (3 << 3)
	srli x12, x12, 2
	or x13, x13, x12
	andi x12, x15, (3 << 5)
	slli x12, x12, 1
	or x13, x13, x12
	srli x12, x15, 7
	andi x12, x12, (3 << 3)
	or x13, x13, x12
	srli x12, x15, 4
	andi x12, x12, (1 << 8)
	beqz x12, 1f
	li x12, 0xFFFFFF00
1:
	or x13, x13, x12
	li x12, 0xE003
	and x15, x15, x12
	addi x9, x9, -8
	sw x14, 0(x9)
	sw x13, 4(x9)
	ret
	ENDW ASM_DIS_CB_TYPE

	DFW ASM_CR_TYPE, "CR-TYPE"
	# ( RD/RS1 RS2 FUNCT4+OPCODE -- INST16 )
	lw x14, 0(x9)
	lw x13, 4(x9)
	addi x9, x9, 8
	slli x14, x14, 2
	or x15, x15, x14
	slli x13, x13, 7
	or x15, x15, x13
	ret
	ENDW ASM_CR_TYPE

	DFW ASM_DIS_CR_TYPE, "DIS-CR-TYPE"
	# ( INST16 -- RS/RS1 RS2 FUNCT4+OPCODE )
	srli x14, x15, 2
	andi x14, x14, 0x1F
	srli x13, x15, 7
	andi x13, x13, 0x1F
	li x12, 0xF003;
	and x15, x15, x12
	addi x9, x9, -8
	sw x14, 0(x9)
	sw x13, 4(x9)
	ret
	ENDW ASM_DIS_CR_TYPE

	DFW ASM_CLSW_TYPE, "CLSW-TYPE"
	# ( UOFFSET RS1 RS2/RD FUNCT3+OPCODE -- INST16 )
	lw x14, 0(x9)
	lw x13, 4(x9)
	lw x12, 8(x9)
	addi x9, x9, 12
	addi x14, x14, -8
	slli x14, x14, 2
	or x15, x15, x14
	addi x13, x13, -8
	slli x13, x13, 7
	or x15, x15, x13
	andi x11, x12, (1 << 2)
	slli x11, x11, 4
	or x15, x15, x11
	andi x11, x12, (1 << 6)
	srli x11, x11, 1
	or x15, x15, x11
	andi x11, x12, (0b111 << 3)
	slli x11, x11, 7
	or x15, x15, x11
	ret
	ENDW ASM_CLSW_TYPE

	DFW ASM_DIS_CLSW_TYPE, "DIS-CLSW-TYPE"
	# ( INST16 -- UOFFSET RS1 RS2/RD FUNCT3+OPCODE )
	srli x14, x15, 2
	andi x14, x14, 0x7
	addi x14, x14, 0x8
	srli x13, x15, 7
	andi x13, x13, 0x7
	addi x13, x13, 0x8
	srli x12, x15, 4
	andi x12, x12, (1 << 2)
	slli x11, x15, 1
	andi x11, x11, (1 << 6)
	or x12, x12, x11
	srli x11, x15, 7
	andi x11, x11, (7 << 3)
	or x12, x12, x11
	li x11, (0x7 << 13) | 0x3
	and x15, x15, x11
	addi x9, x9, -12
	sw x14, 0(x9)
	sw x13, 4(x9)
	sw x12, 8(x9)
	ret
	ENDW ASM_DIS_CLSW_TYPE

	DFW ASM_CJ, "C.J,"
	# ( OFFSET -- )
	RPUSH x1
	LIT (0b101 << 13) | (0b01); NC W_ASM_CJ_TYPE; NC W_WCOMMA;
	RPOP x1
	ret
	ENDW ASM_CJ

	DFW ASM_CJAL, "C.JAL,"
	# ( OFFSET -- )
	RPUSH x1
	LIT (0b001 << 13) | (0b01); NC W_ASM_CJ_TYPE; NC W_WCOMMA;
	RPOP x1
	ret
	ENDW ASM_CJAL

	DFW ISCREG, "CREG?"
	mv x14, x15
	li x15, FALSE
	li x13, 0x7
	bgt x14, x13, 1f
	ret
1:
	li x13, 0x10
	blt x14, x13, 1f
	ret
1:
	li x15, TRUE
	ret
	ENDW ISCREG

	DFW ASM_JAL, "JAL,"
	# ( OFFSET RD -- )
	RPUSH x1
	NC W_2DUP; NC W_0X1; NC W_EQ;
	NC W_SWAP; NC W_ABS; LIT 0X7FF; NC W_LT;
	NC W_AND; ZBRANCH 1f
	NC W_DROP; NC W_ASM_CJAL
	j 2f
1:
	LIT 0x6F; NC W_ASM_J_TYPE; NC W_LCOMMA;
2:
	RPOP x1
	ret
	ENDW ASM_JAL

	DFW ASM_NEAR_CALL, "NEAR-CALL,"
	# ( ADDR -- )
	RPUSH x1
	NC W_HERE; NC W_MINUS; NC W_0X1; NC W_ASM_JAL;
	RPOP x1
	ret
	ENDW ASM_NEAR_CALL

	DFW ASM_J, "J,"
	# ( OFFSET -- )
	RPUSH x1
	NC W_DUP; NC W_ABS; LIT 0x7FF; NC W_LT; ZBRANCH 1f
	NC W_ASM_CJ; j 2f
1:
	NC W_0X0; NC W_ASM_JAL;
2:
	RPOP x1
	ret
	ENDW ASM_J

	DFW ASM_LUI, "LUI,"
	# ( VAL RD -- )
	RPUSH x1
	NC W_SWAP; srli x15, x15, 12; NC W_SWAP;
	LIT 0x37; NC W_ASM_U_TYPE; NC W_LCOMMA;
	RPOP x1
	ret
	ENDW ASM_LUI

	DFW ASM_CJALR, "C.JALR,"
	# ( RS1 -- )
	RPUSH x1
	NC W_0X0; LIT 0b1001000000000010; NC W_ASM_CR_TYPE; NC W_WCOMMA;
	RPOP x1
	ret
	ENDW ASM_CJALR

	DFW ASM_CJR, "C.JR,"
	# ( RS1 -- )
	RPUSH x1
	NC W_0X0; LIT 0b1000000000000010; NC W_ASM_CR_TYPE; NC W_WCOMMA;
	RPOP x1
	ret
	ENDW ASM_CJR

	DFW ASM_JALR, "JALR,"
	# ( OFFSET RS1 RD  -- )
	RPUSH x1
	LIT 0x67; NC W_ASM_I_TYPE; NC W_LCOMMA;
	RPOP x1
	ret
	ENDW ASM_JALR

	DFW ASM_ZABS_CALL, "ZABS-CALL,"
	# ( ADDR -- )
	RPUSH x1
	NC W_0X0; NC W_0X1; NC W_ASM_JALR;
	RPOP x1
	ret
	ENDW ASM_ZABS_CALL

	DFW ASM_FAR_CALL, "FAR-CALL,"
	# ( ADDR -- )
	RPUSH x1
	LIT (0x1 << 11); FC W_OVER; FC W_AND; ZBRANCH 1f
	FC W_DUP; LIT (0x1 << 12); FC W_PLUS; FC W_0X1; FC W_ASM_LUI;
	FC W_0X1; FC W_0X1; FC W_ASM_JALR;
	j 2f
1:
	FC W_DUP; FC W_0X1; FC W_ASM_LUI;
	FC W_0X1; FC W_0X1; FC W_ASM_JALR;
2:
	RPOP x1
	ret
	ENDW ASM_FAR_CALL

	DFW ASM_CALL, "CALL,"
	# ( OFFSET -- )
	RPUSH x1
	NC W_DUP; LIT 0X7FF; NC W_ULT; ZBRANCH 1f
	NC W_ASM_ZABS_CALL; j 3f
1:
	NC W_DUP; NC W_HERE; NC W_MINUS; NC W_ABS; LIT 0xfffff; NC W_LT; ZBRANCH 2f
	NC W_ASM_NEAR_CALL; j 3f
2:
	NC W_ASM_FAR_CALL;
3:
	RPOP x1
	ret
	ENDW ASM_CALL

	DFW ASM_RET, "RET,"
	# ( -- )
	RPUSH x1
	NC W_0X1; NC W_ASM_CJR;
	RPOP x1
	ret
	ENDW ASM_RET

	DFW ASM_CADDI, "C.ADDI,"
	# ( IMM RS1/RD -- )
	RPUSH x1
	LIT 0b01; NC W_ASM_CI_TYPE; NC W_WCOMMA;
	RPOP x1
	ret
	ENDW ASM_CADDI

	DFW ASM_ADDI, "ADDI,"
	# ( VAL RS1 RD -- )
	RPUSH x1
	NC W_2DUP; NC W_EQ; ZBRANCH 1f
	NC W_TOR; NC W_OVER; NC W_FROMR; NC W_SWAP; NC W_ABS;
	LIT 0x20; NC W_LT; ZBRANCH 1f
	NC W_DROP; NC W_ASM_CADDI; j 2f
1:
	LIT 0x13; NC W_ASM_I_TYPE; NC W_LCOMMA;
2:
	RPOP x1
	ret
	ENDW ASM_ADDI

	DFW ASM_NOP, "NOP,"
	# ( -- )
	RPUSH x1
	NC W_0X0; NC W_0X0; NC W_0X0; NC W_ASM_ADDI;
	RPOP x1
	ret
	ENDW ASM_NOP

	DFW ASM_CSLLI, "C.SLLI,"
	# ( IMM RS1/RD -- )
	RPUSH x1
	LIT 0b10; NC W_ASM_CI_TYPE; NC W_WCOMMA;
	RPOP x1
	ret
	ENDW ASM_CSLLI

	DFW ASM_SLLI, "SLLI,"
	# ( VAL RS1 RD -- )
	RPUSH x1
	NC W_2DUP; NC W_EQ; ZBRANCH 1f
	NC W_DROP; NC W_ASM_CSLLI; j 2f
1:
	LIT 0x1013; NC W_ASM_I_TYPE; NC W_LCOMMA;
2:
	RPOP x1
	ret
	ENDW ASM_SLLI

	DFW ASM_LIS12, "LIS12,"
	# ( VAL RD -- )
	RPUSH x1
	NC W_0X0; NC W_SWAP; NC W_ASM_ADDI;
	RPOP x1
	ret
	ENDW ASM_LIS12

	DFW ASM_LIU32, "LIU32,"
	# ( VAL RD -- )
	RPUSH x1
	FC W_OVER; LIT (0x1 << 11); FC W_AND; ZBRANCH 1f;
	FC W_2DUP; FC W_SWAP; LIT (1 << 12); FC W_PLUS;
	FC W_SWAP; FC W_ASM_LUI;
	FC W_DUP; FC W_ASM_ADDI;
	j 2f
1:
	FC W_2DUP; FC W_ASM_LUI;
	FC W_DUP; FC W_ASM_ADDI;
2:
	RPOP x1
	ret
	ENDW ASM_LIU32

	DFW ASM_LI, "LI,"
	# ( VAL RD -- )
	RPUSH x1
	NC W_OVER; NC W_ABS; LIT 0x7FF; NC W_LT; ZBRANCH 1f
	NC W_ASM_LIS12; j 2f
1:
	NC W_ASM_LIU32;
2:
	RPOP x1
	ret
	ENDW ASM_LI

	DFW ASM_MV, "MV,"
	# ( RS RD -- )
	RPUSH x1
	NC W_SWAP; LIT (0b1000 << 12) | (0b10); NC W_ASM_CR_TYPE; NC W_WCOMMA;
	RPOP x1
	ret
	ENDW ASM_MV

	DFW ASM_CSW, "C.SW,"
	# ( UOFFSET SRC BASE -- )
	RPUSH x1
	NC W_SWAP; LIT (0b110 << 13) | (0b00);
	NC W_ASM_CLSW_TYPE; NC W_WCOMMA;
	RPOP x1
	ret
	ENDW ASM_CSW

	DFW ASM_SW, "SW,"
	# ( OFFSET SRC BASE -- )
	RPUSH x1
	NC W_3DUP; NC W_ISCREG; NC W_SWAP; NC W_ISCREG; NC W_AND; NC W_SWAP;
	LIT 0x80; NC W_ULT; NC W_AND; ZBRANCH 1f;
	NC W_ASM_CSW; j 2f
1:
	LIT 0x2023; NC W_ASM_S_TYPE; NC W_LCOMMA;
2:
	RPOP x1
	ret
	ENDW ASM_SW

	DFW ASM_CLW, "C.LW,"
	# ( UOFFSET BASE RD -- )
	RPUSH x1
	LIT (0b010 << 13) | (0b00);
	NC W_ASM_CLSW_TYPE; NC W_WCOMMA;
	RPOP x1
	ret
	ENDW ASM_CLW

	DFW ASM_LW, "LW,"
	# ( OFFSET BASE DEST -- )
	RPUSH x1
	NC W_3DUP; NC W_ISCREG; NC W_SWAP; NC W_ISCREG; NC W_AND; NC W_SWAP;
	LIT 0X80; NC W_ULT; NC W_AND; ZBRANCH 1f;
	NC W_ASM_CLW; j 2f
1:
	LIT 0x2003; NC W_ASM_I_TYPE; NC W_LCOMMA;
2:
	RPOP x1
	ret
	ENDW ASM_LW

	DFW ASM_CBEQZ, "C.BEQZ,"
	# ( OFFSET RS1 -- )
	RPUSH x1
	LIT (0b110 << 13) | (0b01);
	NC W_ASM_CB_TYPE; NC W_WCOMMA;
	RPOP x1
	ret
	ENDW ASM_CBEQZ

	DFW ASM_BEQ, "BEQ,"
	# ( OFFSET RS2 RS1 -- )
	RPUSH x1
	NC W_3DUP; NC W_EQZ; NC W_SWAP; NC W_EQZ; NC W_OR; NC W_SWAP;
	NC W_ABS; LIT 0XFF; NC W_LT; NC W_AND; ZBRANCH 1f
	NC W_2DUP; NC W_MAX; NC W_ISCREG; ZBRANCH 1f
	NC W_MAX; NC W_ASM_CBEQZ; j 2f
1:
	LIT 0X63; NC W_ASM_B_TYPE; NC W_LCOMMA;
2:
	RPOP x1
	ret
	ENDW ASM_BEQ

	DFW ASM_BEQZ, "BEQZ,"
	# ( OFFSET RS -- )
	RPUSH x1
	NC W_0X0; NC W_ASM_BEQ;
	RPOP x1
	ret
	ENDW ASM_BEQZ

	DFW ASM_RPUSH, "RPUSH,"
	# ( REG -- )
	RPUSH x1
	LIT -4; NC W_0X8; NC W_DUP; NC W_ASM_ADDI;
	NC W_0X0; NC W_SWAP; NC W_0X8; NC W_ASM_SW;
	RPOP x1
	ret
	ENDW ASM_RPUSH

	DFW ASM_RPOP, "RPOP,"
	# ( REG -- )
	RPUSH x1
	NC W_0X0; NC W_0X8; NC W_ROT; NC W_ASM_LW;
	NC W_0X4; NC W_0X8; NC W_DUP; NC W_ASM_ADDI;
	RPOP x1
	ret
	ENDW ASM_RPOP

	DFW ASM_PPUSH, "PPUSH,"
	# ( REG -- )
	RPUSH x1
	LIT -4; NC W_0X9; NC W_DUP; NC W_ASM_ADDI;
	NC W_0X0; NC W_SWAP; NC W_0X9; NC W_ASM_SW;
	RPOP x1
	ret
	ENDW ASM_PPUSH

	DFW ASM_PPOP, "PPOP,"
	# ( REG -- )
	RPUSH x1
	NC W_0X0; NC W_0X9; NC W_ROT; NC W_ASM_LW;
	NC W_0X4; NC W_0X9; NC W_DUP; NC W_ASM_ADDI;
	RPOP x1
	ret
	ENDW ASM_PPOP

	DFW ASM_ZBRANCH, "ZBRANCH,"
	# ( ADDR -- )
	RPUSH x1
	NC W_0XF; NC W_0XE; NC W_ASM_MV;
	NC W_0XF; NC W_ASM_PPOP;
	NC W_HERE; NC W_MINUS; NC W_0XE; NC W_ASM_BEQZ;
	RPOP x1
	ret
	ENDW ASM_ZBRANCH
