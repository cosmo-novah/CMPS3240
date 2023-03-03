//author: Jose Zamroa
//date: 02/24/22
//CMPS 3240 - Lab 4

.data
.global string1
string1:
        .ascii "The %dth fibonacci number is %d!\n\0"
string2:
        .ascii "Entering fib() with n=%d\n\0"

.text
.extern printf
.global main
.global fib

main:
        stp x29, x30, [sp, -16]!
        add x29, sp, 0

        mov x0, 13
        bl fib

        add x2, x0, 0
        mov x1, 13
        ldr x0, =string1
        bl printf

        ldp x29, x30, [sp], 16
        mov w0, 0
        ret

fib:
        stp x29, x30, [sp, -32]!
        add x29, sp, 0
        str x0, [sp, 16]

        //ldr x0, =string2
        //ldr x1, [sp, 16]
        //bl printf

        ldr x0, [sp, 16]
        cmp x0, 0
        beq base0

        cmp x0, 1
        beq base1

        // fib(n-2)
        sub x0, x0, 2
        bl fib
        str x0, [sp, 24]

        // fib(n-1)
        ldr x0, [sp, 16]
        sub x0, x0, 1
        bl fib
        
        // fib(n-2) + fib(n-1)
        ldr x9, [sp, 24]
        add x0, x0, x9

done:
        ldp x29, x30, [sp], 32
        ret

base0:
        mov x0, 0
        b done

base1:
        mov x0, 1
        b done

