	.text
	//.global _start
	// below is for testing only
	_start

_start:
	// create empty stack
	LDR R3,=ENDSTACK //test: R3: memory adr of ENDSTACK
	// load the start of the array into R2
	Ldr R2,=NUMBERS
	// store number of values into R1
	LDR R1,=N  // test: [R1]=4
	// load number of elements into the register R1
	LDR R1,[R1] // test: R1=4


// this loop adds all the numbers to the R1 as stack
LOOP:
	// Load first number into pre-index offset of R1
	LDR R4,[R2] //R4=4
	STR R4,[R3,#4]! // Push: first number 1 to to the stack
	//points to next number in array
	ADD R2,R2,#4	//test:[R2]= 2
	// decrement the counter R1
	SUBS R1,R1,#1  	//test: R1=3
	BEQ POPSTACK
	B LOOP

POPSTACK:
	// LDM: load and store multiple regsiters
	// DA; decrement address after each trasnfer
	// http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.dui0489g/Cihcadda.html
	LDMDA R3!, {R5-R7} // pop three values R0,R1,R2 sequentially 
	// Test: R5,R6,R7 should be 1,2,4 

END:	B END	

N:			.word 6 // length of the list
NUMBERS: 	.word 1,2,4,3,5,7
ENDSTACK:	.word 0