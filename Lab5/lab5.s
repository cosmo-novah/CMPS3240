#author: Jose Zamora
#date: 02/24/2023
#CMPS 3240 - Lab4

.data
        .global string1
        string1: .ascii "Iteration %d\n"

        //.global string2
        //string2: .ascii "Result: %d\n"

        .global arrX
        .comm arrX, 8000, 4

        .global arrY
        .comm arrY, 8000, 4

        .global result
        .comm result, 8000, 4

        .global alpha
        alpha: .word 13

.text
        .extern printf
        .global main

main:
        mov w24, #0
        // i
        mov x19, #0
        // byte incrementer
        mov x25, #4

looptop:
        cmp x19, #2000
        beq exit
       
        ldr x0, =string1
        mov x1, x19
        bl printf

        ldr x20, =arrX
        ldr x21, =arrY
        ldr x22, =result
        ldr x0,  =alpha
        ldr w23, [x0]

        //============
        
        //str x19, [x20]
        //str x19, [x21]

        //============

        ldr w9,  [x20], 4
        ldr w10, [x21], 4

        mul w9, w23, w9
        add w9, w9, w10
        str w9, [x22]

        //============
        
        //add x11, x11, #4
        add x19, x19, #1
        //add x22, x22, #4

        b looptop

exit:
        # Exit is 'svc' with code 93. Return 0 through x0
        mov x8, #93
        mov x0, #0
        svc #0




