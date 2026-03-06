        .section .rodata
NUM2HEX_LUT:
        .ASCII "0123456789ABCDEF"
        .section .text

        DFW NUM2HEX, "NUM>HEX"
        andi x15, x15, 0xF
        la x14, NUM2HEX_LUT
        add x13, x14, x15
        lbu x15, 0(x13)
        ret
        ENDW NUM2HEX

        DFW NHEXDOT, "NHEX."
        RPUSH x1
        NC W_DUP; ZBRANCH 2f
1:
        NC W_2DUP; addi x15, x15, -1; slli x15, x15, 2;
        NC W_RSHIFT; NC W_NUM2HEX; NC W_EMIT;
        NC W_1MINUS; NC W_DUP; NC W_EQZ
        ZBRANCH 1b
2:
        NC W_2DROP;
        RPOP x1
        ret
        ENDW NHEXDOT

	DFW HEXDOT, "HEX."
	RPUSH x1
	LIT '$'; NC W_EMIT;
	NC W_0X8; NC W_NHEXDOT;
	RPOP x1
	ret
	ENDW HEXDOT

	DFW DOT, "."
	RPUSH x1
	NC W_UPLOAD; NC W_USER_DOT; NC W_PLUS; NC W_PERFORM;
	RPOP x1
	ret
	ENDW DOT

	DFW DEPTH, "DEPTH"
	lw x14, USER_PS0(x4)
	sub x13, x14, x9
	PPUSH x15
	srli x15, x13, 2
	ret
	ENDW DEPTH


	DFW DOTS, ".S"
	RPUSH x1
	NC W_DEPTH;
	LIT '<'; NC W_EMIT;
	NC W_DUP; NC W_DOT;
	LIT '>'; NC W_EMIT;
	NC W_SPACE;
	NC W_DUP; ZBRANCH 2f
1:
	NC W_DUP; NC W_PICK; NC W_DOT; NC W_SPACE;
	addi x15, x15, -1; NC W_DUP; NC W_EQZ;
	ZBRANCH 1b
2:
	NC W_DROP; NC W_CR;
	RPOP x1
	ret
	ENDW DOTS

	DFW CQUEST, "C?"
	RPUSH x1
	LIT '$'; NC W_EMIT; lbu x15, 0(x15); NC W_0X2; NC W_NHEXDOT;
	RPOP x1
	ret
	ENDW CQUEST

	DFW WQUEST, "W?"
	RPUSH x1
	LIT '$'; NC W_EMIT; NC W_WLOAD; NC W_0X4; NC W_NHEXDOT;
	RPOP x1
	ret
	ENDW WQUEST

	DFW LQUEST, "L?"
	RPUSH x1
	LIT '$'; NC W_EMIT; NC W_LLOAD; NC W_0X8; NC W_NHEXDOT;
	RPOP x1
	ret
	ENDW LQUEST
