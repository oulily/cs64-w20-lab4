# MedianNumbers.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#

.data

	# TODO: Complete these declarations / initializations

	numrequest: .asciiz "Enter the next number:\n"

	median: .asciiz "Median: "



#Text Area (i.e. instructions)
.text

main:

	# TODO: Write your code here
  li $v0, 4
  la $a0, numrequest
  syscall

  li $v0,5
  syscall
  move $t0, $v0

  li $v0, 4
  la $a0, numrequest

  syscall
  li $v0,5
  syscall
  move $t1, $v0

  li $v0, 4
  la $a0, numrequest
  syscall

  li $v0, 5
  syscall
  move $t2, $v0

  slt $t3, $t0, $t1
  slt $t4, $t1, $t2
  beq $t3, $t4, num2

  slt $t3, $t1, $t0
  slt $t4, $t0, $t2
  beq $t3, $t4, num1

  slt $t3, $t0, $t2
  slt $t4, $t2, $t1
  beq $t3, $t4, num3

num1:
  move $t5, $t0
  j exit

num2:
  move $t5, $t1
  j exit

num3:
  move $t5, $t2
  j exit

exit:
	# TODO: Write code to properly exit a SPIM simulation
  li $v0, 4
  la $a0, median
  syscall

  li $v0, 1
  move $a0, $t5
  syscall

  li $v0, 10
  syscall
