	# UP x4
	# RSP x8
	# PSP x9
	# TOS x15

	.INCLUDE "MACRO.S"
	.INCLUDE "CONST.S"
	.INCLUDE "BOOT.S"
	.INCLUDE "EARLY.S"
	.INCLUDE "CORE.S"
	.INCLUDE "IO.S"
	.INCLUDE "DEBUG.S"
	.INCLUDE "NUMBER.S"
	.INCLUDE "STRING.S"
	.INCLUDE "ASSEMBLER.S"
	.INCLUDE "INTERPRET.S"

	.INCLUDE "TEST.S"

	.section .bss
	.P2ALIGN 2, 0
PSTK_ROOT:
	.fill STACK_DEPTH, 4, 0
PSTK_ROOT_TOP:
RSTK_ROOT:
	.fill STACK_DEPTH, 4, 0
RSTK_ROOT_TOP:
USER_ROOT:
	.fill USER_SIZE, 1, 0
TIB_ROOT:
	.fill TIB_MASK + 1, 1, 0

	.section .text
main:
	la x4, USER_ROOT
	la x15, TOS_INIT
	la x8, RSTK_ROOT_TOP
	la x9, PSTK_ROOT_TOP
	sw x8, USER_RS0(x4)
	sw x9, USER_PS0(x4)
	sw x0, USER_STA(x4)
	sw x4, USER_NXT(x4)

	la x10, _ebss
	la x11, FORTH_DP
	sw x10, 0(x11)

	la x10, W_EARLY_EMITAVA
	sw x10, USER_EMITAVA(x4)
	la x10, W_EARLY_EMIT
	sw x10, USER_EMIT(x4)

	la x10, W_EARLY_KEYAVA
	sw x10, USER_KEYAVA(x4)
	la x10, W_EARLY_KEY
	sw x10, USER_KEY(x4)

	la x10, W_HEXDOT
	sw x10, USER_DOT(x4)

	la x10, W_LASTWORD
	la x11, FORTH_LATEST
	sw x10, 0(x11)

	la x10, USER_LATEST
	sw zero, 0(x10)

	la x10, FORTH_CONTEXT
	la x11, CONTEXT_MAX
1:
	sw zero, 0(x10)
	addi x10, x10, 4
	addi x11, x11, -1
	bnez x11, 1b

	la x10, FORTH_CONTEXT

	la x11, W_USER_LATEST
	sw x11, 0(x10)
	la x11, W_FORTH_LATEST
	sw x11, 4(x10)

	la x10, TIB_ROOT
	sw x10, USER_TIB(x4)

	sw zero, USER_TIN(x4)

	NT CODE_ROOT

	.section .text
CODE_ROOT:
	NC W_EARLY_INIT
	NC FORTH_SELFTEST
	NT W_REPL
1:	j 1b
