	.text
	.global MAX_2
	// below is for testing only
	//_start

MAX_2:
	CMP R0,R1
	//if RO greater than, terminate
	BXGE LR
	// else move R1 into R0
	MOV R0,R1
	// terminate
	BX LR
	.end
