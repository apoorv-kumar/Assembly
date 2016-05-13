
;<Program title>

JMP START

;data


;code
START: NOP


;store current state
PUSH PSW
PUSH B
PUSH D
PUSH H

;push args for subtraction arg1 - arg2
;arg2
MVI H , 00H
MVI L , 05H
PUSH H
;arg1
MVI H , 00H
MVI L , 10H
PUSH H

CALL SUBTRACT

;get result
POP H
;store result in mem
SHLD 00H

;restore state
POP H
POP D
POP B
POP PSW


HLT


; Subtraction routine ---------
; A - B
;expects
;PUSH B
;PUSH A

;returns 16 bit number on stack

SUBTRACT: nop
;pop the return address
POP H
SHLD 0100H
;get arguments (numbers)
POP D
POP H

;save contents onto stack


;subtraction routine

     MOV A,E
     SUB L
     MOV L,A
     MOV A,D
     SBB H
     MOV H,A  

;put answer on stack
     PUSH H
;push the return address back
     LHLD 0100H
     PUSH H
RET

