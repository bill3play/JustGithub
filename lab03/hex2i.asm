# Converts a (hex) ASCII string to a number
# lab03 of Computer Architecture course
#  at CSE.UoI.gr 

        .data
number:
        .word    0      # dummy initial value
inmsg:
        .asciiz "BADCAFE" 

        .globl main

        .text
main:   
        # Get address of input string
        la   $a0, inmsg
	lw   $s0, 0($a0) # load the string in $s0
	li   $t0, 4      # setting the loop counter


        #################################
        # Write your program here
     
loop:   # Main loop ---------
	 srl  $t1, $s0, 28
	 

	
        
     
        
        # The following assumes the result is in $s0
        #################################

        la   $a1, number # Address where the result should go to
		sw   $s0, 0($a1)

        # end the program
        li   $v0, 10
        syscall

