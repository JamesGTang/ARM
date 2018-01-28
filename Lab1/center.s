			.text
			.global _start

_start:
			// R4 holds result
			LDR R4, =AVG
			// init R0 to 0
			LDR R0,[R4]	//R0=0
			// R2 holds counter for loop to find max
			LDR R2, [R4, #4] // R2=8
			// R3 stores the numbers
			ADD R3, R4, #8  // R3=3C

SUM:		LDR R1, [R3]  //R1=4
			ADD R0,R0,R1 // R0=4
			// Counter decrement
			SUBS R2, R2, #1 //R2=6
			// if counter is zero
			BEQ DONESUM
			// else go to next number
			ADD R3, R3, #4 //R3=address+4			
			 // R0=9
			B SUM
			
			// load number of entries to  R2 again
DONESUM:	LDR R2, [R4, #4] // R2=8

			// divide sum recursively to find average
AVERAGE:	// divide by 2 everytime until reaches one
			ASRS R2,R2,#1 //R2=4
			BEQ INIT
			// divide the sum by shifing right 
			ASR R0,R0,#1 //R0=14
			B AVERAGE

INIT:		// reload counter into R2
			LDR R2, [R4, #4] // R2=8			
			ADD R3, R4, #8  // R3=3C

BALANCE:  	// R0 is average R0=5
			// loop through array again
			LDR R1, [R3]  //R1=4
			SUB R1,R1,R0 // R1=-1 R1=FFFFFFFF in two's complement
			STR R1, [R3]
			// Counter decrement
			SUBS R2, R2, #1 //R2=6
			// if counter is zero
			BEQ END
			// else go to next number
			ADD R3, R3, #4 //R3=address+4			
			 // R0=9
			B BALANCE

END:		B END 

AVG: 		.word 	0 
N:			.word	8
NUMBERS:	.word	4, 5, 3,8
			.word	1, 13, 2,4

