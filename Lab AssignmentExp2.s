	PRESERVE8
	THUMB
	
	AREA RESET, DATA, READONLY 
	EXPORT __Vectors

__Vectors
    DCD 0x20001000
	DCD Reset_Handler

	ALIGN


	
		
	AREA MYCODE, CODE, READONLY
    ENTRY 
	EXPORT Reset_Handler
		
Reset_Handler

    ;C = 5 * (F - 32) / 9 
	;Convert 70F to C
	MOV R0, #70 ;70 F
	MOV R4, #5
	MOV R5, #9
	SUB R1,R0,#32 ;R1 = F - 32
    MUL R1,R1,R4 ;R1 = 5 * (F - 32)
	UDIV R1,R1,R5 ;R1 = 5 * (F - 32) / 9 
	              ;which is the 70 F in C
				  ;Theoretically -> 70F = 21.1C
				  ;
	
	;F = (9 * C / 5) + 32
	;Convert 20C to F
	MOV R2, #20 ;20 C
	MUL R3,R2,R5 ;R3 = 9 * C
    UDIV R3,R3,R4 ;R3 = 9 * C / 5
	ADD R3,R3,#32 ;R3 = (9 * C / 5) + 32
	              ;which is the 20 C in F
				  ;Theoretically -> 20C = 68F
				  ;44H
	ALIGN 
STOP 
	B STOP 
 	END
		