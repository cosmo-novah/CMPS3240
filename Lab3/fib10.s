#author: Jose Zamora
#date: 02/17/2023
#CMPS 3240 - Lab3

.data
        .global string1
        string1: .ascii "%d\n"

.text
        .extern printf
        .global main

main:
        # Intializes temp, a, b, and i
        mov x18, #0     
        mov x19, #0     
        mov x20, #1     
        mov x21, #0     
        
        # Prints the first term in Fibonacci sequence
        ldr x0, =string1
        mov x1, x19
        bl printf

        # Prints the second term in Fibonacci sequence
        ldr x0, =string1
        mov x1, x20
        bl printf

looptop:
        # checks to see if i = 10
        cmp x21, #10
        beq exit

        # add a and b; store result in temp
        # shadow b into a
        # shadow temp into b
        # increment i
        add x18, x19, x20       
        mov x19, x20            
        mov x20, x18            
        add x21, x21, #1        

        # use printf() to display what is held in b
        ldr x0, =string1
        mov x1, x20
        bl printf

        b looptop

exit:
        # Exit is 'svc' with code 93. Return 0 through x0
        mov x8, #93
        mov x0, #0
        svc #0


