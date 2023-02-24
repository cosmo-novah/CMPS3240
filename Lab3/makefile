ASM=gcc
ASMFLAGS=-c
LINK=gcc

all: fib10.out

fib10.out: fib10.o
	${LINK} $< -o $@
fib10.o: fib10.s
	${ASM} ${ASMFLAGS} $< -o $@

clean:
	rm -r -f *.o *.out
