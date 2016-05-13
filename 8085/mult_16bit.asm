
;<16 bit multiplier>
;expects data on mem locations 0-1 and 2-3
;0 and 2 being MSBs

jmp start

;data



;code
start: nop

;reset HL
mvi H , 00H
mvi L , 00H

;read data from mem
lda 00H
mov B , A
lda 01H
mov C , A

lda 02H
mov D , A
lda 03H
mov E , A


;in each iteration 
;add BC to HL and decrement DE
;assuming no overflows
add_and_dec: dad B
dcx D
jp add_and_dec

;now acc contains result
;store it in mem location 0-1
shld 00H

hlt