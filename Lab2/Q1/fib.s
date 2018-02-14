	.text
	.global _start
	// for testing only
	// _start

_start:		
		// -----------------------//
		// LR: stores the result of each recursion
		// r10: reference ptr
		// r9:	n value
		// r8 = 1
		// r7 = 2
		// r2: temp variable for loading into lr
		// r1: the fib(n) in resursion
		// r0: the fib(n-1) in recusion

		// Load reference adr	
		LDR R10, = REF 			// test: r10=[REF]
		// Load n number to R9
		LDR R9, [R10, #4] 		// test: r9=8
		// offset R9 to fit the sequence
		SUB R9,R9,#1			// test: r9=7
		// load n=1 into r8, post index  
		LDR R8, [R10, #12] 		// test: r8=1
		// load n=2 into r7, post index
		LDR R7, [R10, #8] 		// test: r7=2
		// r0: the fib(n-1) in recusion
		LDR R0, [R10, #12] 		// test: r0=1
		// give lr=1 to start
		LDR LR, = PTR
		STR R0, [LR] 			// test lr=1
		// points to next location
		SUB LR, LR, #4
		// r1: fib(n) in recursion
		LDR R1, [R10, #12]  	// r1=2
		STR R1, [LR]
	
IF:		
		// if(n<2) return 
		CMP R7, R9 
		BLE ELSE
		// else: terminate
		B DONE

ELSE: 	
		// compare gate value
		CMP R8, R9
		BEQ DONE
		// Decrement n
		SUBS R9, R9, #1
		// test if n is finished
		CMP R9, R8
		// if r9 is greated than 1, recurse  		
		BGT ELSE
		// else the 2nd part of recursion  
		LDR R0, [LR, #4]
		LDR R1, [LR]
		ADD R2, R0, R1
		// points to next location
		SUB LR, LR, #4
		// stores the result of fib(n) 		
		STR R2, [LR]
		// reset fib(n) loop count
		LDR R9, [R10,#4]
		SUB R9,R9,#1
		ADD R8, R8, #1
		B ELSE

DONE:  
		// store return value in link register for function call
		LDR LR, [LR] 

END: 	// this ends all loop
		B END

PTR:				.word 0
REF: 				.word 0
N:					.word 8
FIB3:				.word 2
FIB2: 				.word 1