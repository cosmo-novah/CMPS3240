	.arch armv8-a
	.file	"main.c"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	str	w0, [x29, 28]
	str	x1, [x29, 16]
	mov	w0, 49664
	movk	w0, 0xbeb, lsl 16
	str	w0, [x29, 44]
	ldrsw	x0, [x29, 44]
	lsl	x0, x0, 2
	bl	malloc
	str	x0, [x29, 48]
	ldrsw	x0, [x29, 44]
	lsl	x0, x0, 2
	bl	malloc
	str	x0, [x29, 56]
	str	wzr, [x29, 40]
	b	.L2
.L3:
	ldrsw	x0, [x29, 40]
	lsl	x0, x0, 2
	ldr	x1, [x29, 56]
	add	x0, x1, x0
	ldr	w2, [x0]            
    ldr w9, [x0, 4]         
	ldrsw	x0, [x29, 40]
	lsl	x0, x0, 2
	ldr	x1, [x29, 56]
	add	x0, x1, x0
	ldr	w1, [x0]
	ldrsw	x0, [x29, 40]
	lsl	x0, x0, 2
	ldr	x3, [x29, 48]
	add	x0, x3, x0
	mul	w1, w2, w2          
	str	w1, [x0]
    mul w10, w9, w9         
    str w10, [x0]           
	ldr	w0, [x29, 40]
	add	w0, w0, 2
	str	w0, [x29, 40]
.L2:
	ldr	w1, [x29, 40]
	ldr	w0, [x29, 44]
	cmp	w1, w0
	blt	.L3
	ldr	x0, [x29, 48]
	bl	free
	ldr	x0, [x29, 56]
	bl	free
	mov	w0, 0
	ldp	x29, x30, [sp], 64
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
