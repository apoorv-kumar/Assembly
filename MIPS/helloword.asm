	.globl main
main:
	
	.data
str: .asciiz "HELLO WORLD"

	.text
	
	li $v0, 4
	la $a0, str
	syscall