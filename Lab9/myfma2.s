# Author: Jose Zamora
# Date: 05.05.2023
# CMPS 3240 - Lab 9

# length -> w0
# *a -> x1
# *b -> x2
# *c -> x3

.text

.global myFMA

myFMA:
    stp     x29, x30, [sp, -16]!
    add     x29, sp, 0
    # Counter 'i'
    mov     w5, 0

_looptop:
    cmp     w5, w0
    beq     _loopquit

    # Loading arrays for Chunk 1:
    # a[]: NOTE - DON'T PUSH FORWARD POINTER HERE YET
    ld1     {v0.2s}, [x1]
    # b[]: 
    ld1     {v1.2s}, [x2], 8
    # c[]:
    ld1     {v2.2s}, [x3], 8

    fmul    v0.2s, v0.2s, v1.2s
    fadd    v0.2s, v0.2s, v2.2s
    
    # Store result into a[]: NOTE - NOW PUSH POINTER FORWARD
    st1     {v0.2s}, [x1], 8

    # Loading arrays for Chunk 2
    ld1     {v0.2s}, [x1]
    ld1     {v1.2s}, [x2], 8
    ld1     {v2.2s}, [x3], 8

    fmul    v0.2s, v0.2s, v1.2s
    fadd    v0.2s, v0.2s, v2.2s

    st1     {v0.2s}, [x1], 8

    # Multiple 'i' by 2 for 2-lane SIMD
    # Then multiply by 2 to 'i' for x2 unrolling
    add     w5, w5, 4

    b       _looptop

_loopquit:
    ldp     x29, x30, [sp], 16
    ret

