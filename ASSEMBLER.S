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

	DFW ASM_JAL, "JAL,"
	# ( OFFSET RD -- )
	RPUSH x1
	LIT 0x6F; NC W_ASM_J_TYPE; NC W_LCOMMA;
	RPOP x1
	ret
	ENDW ASM_JAL

	DFW ASM_LUI, "LUI,"
	# ( VAL RD -- )
	RPUSH x1
	NC W_SWAP; srli x15, x15, 12; NC W_SWAP;
	LIT 0x37; NC W_ASM_U_TYPE; NC W_LCOMMA;
	RPOP x1
	ret
	ENDW ASM_LUI

	DFW ASM_JALR, "JALR,"
	# ( OFFSET RS1 RD  -- )
	RPUSH x1
	LIT 0x67; NC W_ASM_I_TYPE; NC W_LCOMMA;
	RPOP x1
	ret
	ENDW ASM_JALR

	DFW ASM_ADDI, "ADDI,"
	# ( VAL RS1 RD -- )
	RPUSH x1
	LIT 0x13; NC W_ASM_I_TYPE; NC W_LCOMMA;
	RPOP x1
	ret
	ENDW ASM_ADDI

	DFW ASM_SW, "SW,"
	# ( OFFSET SRC BASE -- )
	RPUSH x1
	LIT 0x2023; NC W_ASM_S_TYPE; NC W_LCOMMA;
	RPOP x1
	ret
	ENDW ASM_SW

	DFW ASM_LW, "LW,"
	# ( OFFSET BASE DEST -- )
	RPUSH x1
	LIT 0x2003; NC W_ASM_I_TYPE; NC W_LCOMMA;
	RPOP x1
	ret
	ENDW ASM_LW

	DFW ASM_BEQ, "BEQ,"
	# ( OFFSET RS2 RS1 -- )
	RPUSH x1
	LIT 0X63; NC W_ASM_B_TYPE; NC W_LCOMMA;
	RPOP x1
	ret
	ENDW ASM_BEQ
