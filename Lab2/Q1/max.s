	.text
	//.global _start
	// below is for testing only
	_start

_start:
	// R12= stack, R11: values, R10: counter, R9: temp value, R0-R4 values, R1
	// create empty stack
	LDR R12,=ENDSTACK //test: R12: memory adr of ENDSTACK
	// load the start of the array into R11
	LDR R11,=NUMBERS
	// load number of elements into the register R10
	LDR R10,=N // test:[R10]=4
	LDR R10,[R10] // test: R10=4
	// perform caller function by loading 4 values into R0-R3
	// the adr of first value starts after R11
	LDR R0,[R11,#0] 
	LDR R1,[R11,#4]
	LDR R2,[R11,#8]
	LDR R3,[R11,#12]
	// test: R0-R3=3,2,5,9
	BL PUSHSTACK

END:	B END
// PUSHSTACK is a subroutine to add all values into stack starting R12
PUSHSTACK:
		// use preindex mode to push values into stack
		STR R1,[R12,#-4]!
		STR R2,[R12,#-4]!
		STR R3,[R12,#-4]!
		
MAXLOOP:
		// decrement loop counter
		SUBS R10,R10,#1	// test: R10=3
		BEQ DONE
		// pop value from stack
		LDR R9,[R12],#4 // test R9: 
		CMP R0,R9
		BGE MAXLOOP
		MOV R0,R9
		B MAXLOOP

DONE:	BX LR

N:			.word 4 // length of the list
NUMBERS: 	.word 3,2,5,9
ENDSTACK:	.word 0
