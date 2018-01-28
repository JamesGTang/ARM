	.text
			.global _start

_start:
			// R4 holds result
			LDR R4, =RESULTMAX
			
			// R2 holds counter for loop to find max
			LDR R2, [R4, #4]
			// R3 stores the numbers
			ADD R3, R4, #8
			// putting numbers stored in R3 to RO
			LDR R0, [R3]

LOOPMAX:		// Counter decrement
			SUBS R2, R2, #1
			// if counter is zero
			BEQ DONEMAX
			// else go to next number
			ADD R3, R3, #4
			LDR R1, [R3]
			CMP R0, R1
			BGE LOOPMAX
			MOV R0, R1
			B LOOPMAX
			
DONEMAX:	STR R0, [R4]

STARTMIN:	LDR R5, =RESULTMIN
			// load N into R2
			LDR R2, [R5, #8]
			ADD R3, R5, #12
			LDR R6, [R3]

LOOPMIN:	// Counter decrement
			SUBS R2, R2, #1
			// if counter is zero
			BEQ DONEMIN
			// else go to next number
			ADD R3, R3, #4
			LDR R1, [R3]
			CMP R6, R1
			BLE LOOPMIN
			MOV R6, R1
			B LOOPMIN

DONEMIN:	STR R6, [R5]
			B STD

STD:		SUB R0, R0,R6
	//		LDR R0, [R0], #2
			LSR R0, R0, #2

END:		B END 

RESULTMIN:  .word 	0  // can they be 0 at same time?
RESULTMAX:	.word	0
N:			.word	7
NUMBERS:	.word	4, 5, 3, 6
			.word	1, 13, 2
