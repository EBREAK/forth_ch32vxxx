	DFW MEPCLOAD, "MEPC@"
	# ( -- VAL )
	PPUSH x15
	csrr x15, mepc
	ret
	ENDW MEPCLOAD

	DFW MTVECLOAD, "MTVEC@"
	# ( -- VAL )
	PPUSH x15
	csrr x15, mtvec
	ret
	ENDW MTVECLOAD

	DFW FENCE_IORW_IORW, "FENCE-IORW-IORW"
	# ( -- )
	fence iorw, iorw
	ret
	ENDW FENCE_IORW_IORW
