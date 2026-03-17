	.MACRO NC sym
		#jal x1, \sym
		call \sym
	.ENDM

	.MACRO FC sym
		call \sym
	.ENDM

	.MACRO NT sym
		#j \sym
		tail \sym
	.ENDM

	.MACRO FT sym
		tail \sym
	.ENDM

	.MACRO RPUSH reg
		addi x8, x8, -4
		sw \reg, 0(x8)
	.ENDM

	.MACRO RPOP reg
		lw \reg, 0(x8)
		addi x8, x8, 4
	.ENDM

	.MACRO PPUSH reg
		addi x9, x9, -4
		sw \reg, 0(x9)
	.ENDM

	.MACRO PPOP reg
		lw \reg, 0(x9)
		addi x9, x9, 4
	.ENDM

	.MACRO LIT val
		PPUSH x15
		li x15, \val
	.ENDM

	.MACRO LITA val
		PPUSH x15
		la x15, \val
	.ENDM

	.MACRO ZBRANCH sym
		mv x14, x15
		PPOP x15
		beqz x14, \sym
	.ENDM

	.SET W_LASTWORD, 0
	.MACRO DFW LABEL, NAME
		.section .text
		.P2ALIGN 1, 0
	NAME_\LABEL:
		.ASCII "\NAME"
		.SET NLEN_\LABEL, . - NAME_\LABEL
		.P2ALIGN 1, 0
		.BYTE NLEN_\LABEL
		.BYTE BLEN_\LABEL
		.SET PREV_\LABEL, W_LASTWORD
		.4BYTE PREV_\LABEL
	W_\LABEL:
		.SET W_LASTWORD, W_\LABEL
	.ENDM

	.MACRO IDFW LABEL, NAME
		.section .text
		.P2ALIGN 1, 0
	NAME_\LABEL:
		.ASCII "\NAME"
		.SET NLEN_\LABEL, . - NAME_\LABEL
		.P2ALIGN 1, 0
		.BYTE NLEN_\LABEL
		.BYTE BLEN_\LABEL
		.SET PREV_\LABEL, W_LASTWORD
		.4BYTE PREV_\LABEL + 1 # IMMEDIATE FLAG
	W_\LABEL:
		.SET W_LASTWORD, W_\LABEL
	.ENDM
	
	.MACRO ENDW LABEL
		.SET BLEN_\LABEL, (. - W_\LABEL) / 2
	.ENDM

	.MACRO DEFCONST LABEL, VALUE
		.SET \LABEL, \VALUE
		DFW \LABEL, "\LABEL"
			LIT \VALUE
			ret
		ENDW \LABEL
	.ENDM
