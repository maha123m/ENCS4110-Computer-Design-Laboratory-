;The semicolon is used to lead an inline documentation.
;This is the first ARM Assembly language program you see in the lab.
;This program skeleton was from Dave Duguid and Trevor Douglas in summer 2013.
;When you write your program, you could have your info at the top document block.
;For Example: Your Name, Student Number, what the program is for, and what it does 

;;; Directives
		PRESERVE8
		THUMB 
; Vector Table Mapped to Address 0 at Reset
; Linker requires __Vectors to be exported
		AREA RESET, DATA, READONLY
		EXPORT __Vectors
__Vectors 
	DCD 0x20001000 ; stack pointer value when stack is empty
;The processor uses a full descending stack. 
;This means the stack pointer holds the address of the last 
;stacked item in memory. When the processor pushes a new item 
;onto the stack, it decrements the stack pointer and then 
;writes the item to the new memory location.
		DCD Reset_Handler ; reset vector
 
		ALIGN
; The program
; Linker requires Reset_Handler
		AREA MYCODE, CODE, READONLY
		ENTRY
		EXPORT Reset_Handler

Reset_Handler
;;;;;;;;;;User Code Start from the next line;;;;;;;;;;;;
	
		MOV R0, #7 ; x = 7
		MUL R1, R0, R0 ; R1 = x^2
		MOV R4, #5
		MUL R1, R1, R4
		MOV R5, #6
		MUL R2, R0, R5 ; R2 = 6x
		SUB R3, R1, R2 ; R3 = 5x^2 - 6x
		ADD R3, R3, #8 ; R3 = 5x^2 - 6x + 8
		ALIGN

STOP
		B STOP

		END ; End of the program
