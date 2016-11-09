#OMBMAR001
.data
	initial: .word 2
	temp1: .word 5
	tempFloat: .word 5
	ans: .word 0
	remainderIs: .asciiz "Remainder is\n "
	P: .asciiz "It is prime\n"
	NP: .asciiz "It is not prime\n"
	cr: .asciiz "\n"
	entryMess: .asciiz "Enter a number:\n"

.text

main:
	#ENTRY MESSAGE
	la $a0,entryMess
	li $v0,4
	syscall
	
	#GET VALUE
	li $v0, 5
	syscall
	sw $v0,temp1
	
	#loading max
	lw $s1,temp1
	lw $s0, initial
	######################################LOOP BEGINS#################################
predicate:
	##DEFINE LOGIC
	beq $s0,$s1,prime # if s0>s1 end the loop
	
	##DEFINE WHAT HAPPENS WHEN LOGIC IS NOT YET TRUE
	move $a0,$s0 # if not yet: move the s0 into a0,
	#li $v0,1 # prepare value for printing
	#syscall # print to screen
	
	#la $a0,cr #Print out carriagereturn
	#li $v0,4 # prepare for printing
	#syscall #print
		
	##DEFINE PRIME LOGIC
	rem $s2,$s1,$s0 ## set to new s2, big number / i 
	
	##OUTPUT REMAINDER
	#move $a1,$s2
	#li $v0,1
	#syscall
	
	
	beqz $s2, notPrime
	
	##INCREMENTATION
	add $s0,$s0,1
	
	##GO BACK TO START WITH THE NEW VALUE
	j predicate
	
	prime:
	la $a0,P #Print out carriagereturn
	li $v0,4 # prepare for printing
	syscall #print
	j end
	
	notPrime:
	la $a0,NP #Print out carriagereturn
	li $v0,4 # prepare for printing
	syscall #print
	j end
	
	
	end:
	li $v0,10
	syscall #Exit
	
	
	
