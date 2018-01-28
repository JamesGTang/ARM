			.text
			.global _start

_start:
			LDR R0, =N			//R0 points to the result location
			//ADD R0, R0 ,#4
			LDR R9, [R0]
			MOV R1, #0			//R1 holds "sorted" variable; init to false
			MOV R6, #1			//Holds #1

COND:	
			// if array is sorted
			CMP R1, R6			// does not go into loop
			// got to end after sort
			BGE END				// ends at last loop
			MOV R1, #1			//R1=1
			// postion counter from 1
			MOV R4, #1			//R4=1
			// reset R2 to starting postion
			ADD R2, R0, #0		//R2=70
			// reset R3 to second postion
			ADD R3, R0, #4		//R3=74

SORT:		// if position counter reaches end of array
			CMP R4, R9			// should go into loop at the last execution
			// return to condition loop
			BGE COND
			// increment position counter
			ADD R4, R4, #1		//R4=2
			ADD R2, #4			//R2=74
			ADD R3, #4			//R3=78
			LDR R7, [R2]		//R7=4
			LDR R8, [R3]		//R8=3			
			CMP R7, R8			//compare R7,R8, if R7>R8 then swap
			BLE	SORT	 		//begin the loop again
			// swap R5=R7
			// R7=R8
			// R8=R5
			MOV R5, R7			
			MOV R7, R8			
			MOV R8, R5			//R7=3,R8=4
			// put back in memories
			STR R7, [R2]		
			STR R8, [R3]
			// put sorted to false	
			MOV R1, #0
			// resurse again		
			B SORT				//Return to for loop			

END:		B END 				//end program
			
N:			.word	6
			// reversed order array with O(n^2) sort time
NUMBERS:	.word	4, 3, 2, 6
			.word 	1, 8 