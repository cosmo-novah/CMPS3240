ASM=gcc
ASMFLAGS=-c
LINK=gcc

all: lab5.out

lab5.out: lab5.o
	${LINK} $< -o $@
lab5.o: lab5.s
	${ASM} ${ASMFLAGS} $< -o $@

clean:
	rm -r -f *.o *.out
