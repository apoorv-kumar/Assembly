#;			MIPS assembly program to merge sort given array
#;				Author: Apoorv Kumar
#;					MadeInYear: 2011
#;						For: CS223 

	.globl main
	
main:
	
	.data

input_array	: .space 400 # 100 integers input
sorted_array : .space 400 # 100 integers sorted
str_prompt_size : .asciiz "PLEASE ENTER THE SIZE OF LIST: "
str_prompt_number : .asciiz "ENTER THE TERM "
str_print_sorted : .asciiz "SORTED ARRAY IS"
str_hyphen : .asciiz " : "


	.text
	
#prompt for size
	li $v0 , 4
	la $a0 , str_prompt_size
	syscall
	
#get size
	li $v0 , 5 			
	syscall
	move $s0 , $v0 					# s0 = size of array 

	
#start getting array
	li $t0 , 0						#t0 has temp index
	la $t1 , input_array			#t1 has temp address
	
INPUT_LOOP:

#prompt the index
	
	li $v0 , 4
	la $a0 , str_prompt_number
	syscall
	li $v0 , 1
	move $a0 , $t0
	syscall
	li $v0 , 4
	la $a0 , str_hyphen
	syscall
	
#take input
	li $v0 , 5
	syscall
	
#save input and update index
	sw $v0 , 0($t1)
	addi $t0 , 1
	addi $t1 , 4
	
#check loop condition
	blt $t0 , $s0 , INPUT_LOOP
	

# ---------------------------------------------------------------------
# input complete , merge sort starts
# ---------------------------------------------------------------------

#
#	recursion algo:
#	sort( positions a to b )
#		if(a == b) return
#		else sort( a to mid) and sort( mid+1 to b) and merge(a , mid , b)
#
#	merge algo:
#	merge(a , mid , b)
#		t1 = a , t2 = mid+1 , i = 0
#		while(1) 
#			if(input_array[t1] > input_array[t2]) 
#				sorted_array[a+i] = input_array[t2]
#				t2++ , i++
#			else
#				sorted_array[a+i] =	input_array[t1]
#				t1++ , i++
#
#		check:
#		if(t1 == mid) fill rest with t2
#		if(t2 == b) fill rest with t1 
#
#		writeback:
#		to the input array.


#####################################################################
#                           MERGE SORT                              
#	a0 - start position , a1 - end position , s0 - stack position   	
#####################################################################

## SORTING ROUTINE
#frame: - reverse in stack
#	1. $ra
#	2. $a0 - start
#	3. $a1 - end 

###############################
merge_sort:
# if a0 = a1 return
beq $a0 , $a1 , sort_return
#else

#save prev context
#update stack pointer
subi $sp , 12
#push onto stack
sw $ra , 0($sp)
sw $a0 , 4($sp)
sw $a1 , 8($sp)

add $t0 , $a0 , $a1 		# t0 = start + end
srl $t0 , $t0 , 1 			# t0 = t0/2 = mid

addi $s0 , $t0 , 1 			#save mid+1
#set env for sort(start , mid)
#move $a0 , $a0
move $a1 , $t0
jal merge_sort

#set env for sort(mid+1 , end)
move $a0 , $s0
#
###############################


################################
sort_return:
#pop the stack
lw $ra , 0($sp)
lw $a0 , 4($sp)
lw $a1 , 8($sp)
#update stack pointer
addi $sp , 12 
jr $ra
################################


## MERGE ROUTINE
#frame:
#	1. $ra
#	2. $a0 - start
#	3. $a1 - mid
#	4. $a2 - end


merge:



merge_return:


