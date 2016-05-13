#;			MIPS assembly program to invert a string
#;				Author: Apoorv Kumar
#;					MadeInYear: 2011
#;						For: CS223 


	.globl main
main:
	
	.data
str_ask: .asciiz "PLEASE ENTER THE STRING TO BE REVERSED :"
str_result:	.asciiz "THE REVERSE STRING IS :"
input_string: .space 64 			#63 chars buffer 
output_string: .space 64 
	
	
	.text
	
	li 		$v0, 4					#ask
	la 		$a0, str_ask
	syscall
	
	li 		$v0, 8					#take input
	la 		$a0, input_string
	addi 	$a1, $zero , 63
	syscall
	
	add		$s0, $zero , $zero		#initialize - it keeps count of chars - excluding null char
	
push_loop:
	lb		$t0 , input_string($s0)
	beq		$t0 , $zero, end_push_loop #break loop if null char
	subu	$sp , $sp , 4
	sw		$t0 , ($sp)	#push on the stack
	addi	$s0 , $s0 , 1
	bne		$t0, $zero, push_loop 	#keep looping
	
end_push_loop:
	add		$t0 , $zero , $zero 	#initialize the popping count
	
pop_loop:
	beq		$t0 , $s0 , print_output
	lw		$t1 , ($sp) 
	addu	$sp , $sp , 4			#pop the stack into t1
	sb		$t1 , output_string($t0)	#save into output string
	addi	$t0 , $t0 , 1
	j 		pop_loop


print_output:
	sb		$zero , output_string($s0)	#terminating null char
	
	li $v0 , 4
	la $a0 , str_result
	syscall
	
	li $v0 , 4
	la $a0 , output_string
	syscall
	
	