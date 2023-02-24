.text
.global _start
_start:
	mov x1, #7
	add x2, x1, x1

	mov x8, #64	# Operation 84 is sys_write
	mov x0, #1	# sys_write takes 1 argument, which file descriptor to print to 1 is screen
	ldr x1, =msg	# Pointer to string
	ldr x2, =len	# Length of string
	svc #0		# Syscall

	mov x8, #93	# Operation 93 is sys_exit
	mov x0, #0	# Obligatory, because, by convention, return value of process is placed in register 0
	svc #0		# Syscall

.data
.global msg
msg:
	.ascii "hello word\n"
len = . -msg
