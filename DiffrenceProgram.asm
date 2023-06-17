# This program was 100% made by Rohan Mankame 

# Author: Rohan Mankame 
# E-mail: rym5387@psu.edu and mbe5290@psu.edu
# Course: CMPSC 312
# Assignment: MIPS Programming Project 1
# Due date: 4/10/2023
# File: DiffrenceProgram.asm
# Purpose: This program prompts a user to enter three integers,
# computes the difference between the sum of the two largest
# integers and the smallest integer, then displays the result.
# Simulator: MARS 4.5
# Operating system: MS Windows 11 Home
# References: Class demo programs, 
# https://www.youtube.com/watch?v=g-bsP11mCz0&t=642s&ab_channel=SarahPham ,
# https://www.youtube.com/watch?v=cQ2sB_UfRnM&ab_channel=AmellPeralta ,
# https://www.youtube.com/watch?v=3AlgSOFAlEQ&ab_channel=FadiKhan


.data

	prompt1: .asciiz "\n Enter x value "
	Num1: .asciiz "\nx: "

	prompt2: .asciiz "\n Enter y value "
	Num2: .asciiz "\ny: "

	prompt3: .asciiz "\n Enter z value "
	Num3: .asciiz "\nz: "

	Diff: .asciiz "\n The diffrence is: "

.text

	mian:
	li $v0, 4 		#print string (envoke print comand)
	la $a0, prompt1 	# Enter x value: (prompt)
	syscall
	li $v0,4		#print string
	la $a0, Num1	# choose x:
	syscall
	li $v0, 5
	syscall
	move $t0, $v0  	# move x to $t0 form $v0 


	li $v0, 4 		#print string (envoke print comand)
	la $a0, prompt2 	# Enter y value: (prompt)	
	syscall
	li $v0,4		#print string
	la $a0, Num2	# choose y:
	syscall
	li $v0, 5
	syscall
	move $t1, $v0  	# move y to $t form $v0 


	li $v0, 4 		#print string (envoke print comand)
	la $a0, prompt3 	# Enter z value: (prompt)	
	syscall
	li $v0,4		#print string
	la $a0, Num3	# choose z:	
	syscall
	li $v0, 5
	syscall
	move $t2, $v0  	# move z to $t2 form $v0

##if x<y and x<z do case1

	ble $t0, $t1, TESTxYZ  #compare x <= y (Case 1 when x less thn y)
	ble $t1, $t0, TESTXyZ  #compare y <= x (Case 1 when y less thn x)
	ble $t0, $t2, TESTXyZ  #compare x <= z (Case 1 when x less thn z)
	#end program
	li $v0,10
	syscall
	
	TESTXyZ:
	ble $t1, $t2, XZminy # test y <= z
	ble $t2, $t1, XYminz  # test z <= y
	syscall
	
	
	

	TESTxyZ: 
	ble $t1, $t2, XYtest # test y <= z
	ble $t0, $t2, YZminx  # test x <= y # x<z and x<y
	syscall

	XYtest:
	ble $t0, $t1, YZminx # test x <= y
	ble $t1, $t0, XZminy # test y <= x




	TESTxYZ:
	ble $t2, $t0, XYminz # test z <= x
	ble $t0, $t2, YZminx  # test x <= z
	syscall
	
	#YorZhigher:
	#ble $t2, $t1, XYminz #test z <= y
	
	XYminz:   #x is least num so diff = (Y+Z) - X
	add $t4, $t0, $t1 # (X+Y) in $t4
	sub $t5, $t4, $t2 #$t4 - Z
	
	li $v0,4		#print string
	la $a0, Diff
	syscall
	li $v0, 1
	move $a0 , $t5
	syscall
	li $v0,10
	syscall
	
	YZminx:   #x is least num so diff = (Y+Z) - X
	add $t4, $t1, $t2 # (Y+Z) in $t4
	sub $t5, $t4, $t0 #$t4 - X
	
	li $v0,4		#print string
	la $a0, Diff
	syscall
	li $v0, 1
	move $a0 , $t5
	syscall
	li $v0,10
	syscall

	XZminy:   #x is least num so diff = (Y+Z) - X
	add $t4, $t0, $t2 # (X+Z) in $t4
	sub $t5, $t4, $t1 # $t4 - y
	
	li $v0,4		#print string
	la $a0, Diff
	syscall
	li $v0, 1
	move $a0 , $t5
	syscall
	li $v0,10
	syscall
	
