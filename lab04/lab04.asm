# Calculates gcd of 2 numbers
# lab04 of Computer Architecture course
#  at CSE.UoI.gr 

        .data
n1:
        .word  462
n2:
        .word  1071
result:
        .word 0

        .globl main

        .text
main:   
        
        la   $s0, n1       # Get address of n1
        lw   $a0, 0($s0)   # Get n1

        lw   $a1, 4($s0)   # Get n2

        jal  gcd

        la   $t0, result  # Address where the result should go to
        sw   $v0, 0($t0)

        # end the program
        li   $v0, 10
        syscall

		######################################
        # Write your code here for mod and gcd
mod:
	sub   $t0, $a0, $a1	# $t0 = n1 + n2
	slti  $t1, $t0, 0	# $t1 = 1 if $t0 < 0 else $t1 = 0
	beq   $t1, $0, else	# if n1 > n2 goto else
	sub   $a1, $a1, $a0	# n2 = n2 - n1
	jr    $ra		# return to main programm 
	
else:
	sub   $a0, $a0, $a1	# n1 = n1 - n2
	j     mod		# jump to mod 

gcd:

	addi  $sp, $sp, -4	# holding space in he stack for 1 data
	sw    $ra, 0($sp)	# push $ra in stack
	beq   $a0, $0, retn2	# if n1 = 0 return n2
	beq   $a1, $0, retn1	# if n2 = 0 return n1
	jal   mod
	beq   $a0, $0, retn2	# if n1 = 0 return n2
	beq   $a1, $0, retn1	# if n2 = 0 return n1
	j     gcd		# jump to gcd	
	
retn1:
	or    $v0, $a0, $0	# $v0 = $a0 | 0
	lw    $ra, 0($sp)	# reset $ra from stack
	addi  $sp, $sp, 4	# remove 1 element from stack
	jr    $ra  		# jump to main program
	
retn2:
	or    $v0, $a1, $0	# $v0 = $a1 | 0
	lw    $ra, 0($sp)	# reset $ra from stack
	addi  $sp, $sp, 4	# remove one element from stack
	jr    $ra 		# jump to main porogram
        
