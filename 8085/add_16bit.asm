
;<16 bit adder>
;Assumes first number in ports 00H-01H
;second number in ports 02H-03H
; 00H and 02H have MSBs
;output on port 04H-05H

jmp start

;data


;code
start: nop ; -----------------------

;get the first 16 bit number
;assuming 00 contains MS8Bits
;and 01 contains LS8Bits 
in 00H
mov B , A
in 01H
mov C , A

;get the second 16 bit number
;assuming 02 contains MS8Bits
;and 03 contains LS8Bits 
in 02H
mov D , A
in 03H
mov E , A

;now BC has the first num
;and DE has the second

;start addition

; -- The lower Bits --
;reset A to 0
mvi A , 00H
;add C and E (LSBs)
add C
add E
;store the result in L
mov L , A

; -- The higher Bits --
;reset A to 0
mvi A , 00H
;add B and D (MSBs)
;but with carries
adc B
adc D
;store the result in H
mov H , A

;output to the ports
out 04H
mov A , L
out 05H

;program ends -------------------

hlt