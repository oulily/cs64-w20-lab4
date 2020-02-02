# Factorial.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#

# Assembly (NON-RECURSIVE) version of:
#   int n, fn=1;
#   cout << "Enter a number:\n";
#   cin >> n;
#   for (int x = 2; x <= n; x++) {
#       fn = fn * x;
#   }
#   cout << "Factorial of " << x << " is:\n" << fn << "\n";
#
.data

	# TODO: Write your initializations here

#Text Area (i.e. instructions)
.text
main:

	# TODO: Write your code here
  li $v0, 4
  la $a0, userprompt
  syscall

  li $v0, 5
  syscall

  move $t0, $v0
  addi $t3, $t0, 1
  #running product
  li $t1, 1
  #starting at 2
  li $t2, 2

loop:
  beq $t2, $t3, exit
  mult $t1, $t2
  mflo $t1
  addi $t2, $t2, 1
  j loop

exit:
	# TODO: Write code to properly exit a SPIM simulation
  li $v0, 4
  la $a0, factorialof
  syscall

  li $v0, 1
  move $a0, $t0
  syscall

  li $v0, 4
  la $a0, is
  syscall

  li $v0, 1
  move $a0, $t1
  syscall

  li $v0, 4
  la $a0, newline
  syscall

  li $v0, 10
  syscall
