
;<Program title>

jmp start

;data


;code
; MULTIPLY TWO 16 BIT NUMBERS 
start:     LHLD 2000H 
           SPHL 
LHLD 3000H 
XCHG 
LXI H,0000H 
LXI B,0000H 
NEXT:	 DAD SP 
JNC AHEAD 
INX B 
AHEAD:      DCX D 
MOV A,E 
ORA D 
JNZ NEXT 
SHLD 0000H
HLT 