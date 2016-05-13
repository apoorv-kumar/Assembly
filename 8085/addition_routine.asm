
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

;push args for addition arg1 + arg2
;arg2
MVI H , 20H
MVI L , 10H
PUSH H
;arg1
MVI H , 10H
MVI L , 10H
PUSH H

CALL ADDITION

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
; A + B
;expects
;PUSH B
;PUSH A

;returns 16 bit number on stack

ADDITION: nop
;pop the return address
POP H
SHLD 0100H
;get arguments (numbers)
POP D
POP H

;addition routine

DAD D

;put answer on stack
     PUSH H
;push the return address back
     LHLD 0100H
     PUSH H
RET

