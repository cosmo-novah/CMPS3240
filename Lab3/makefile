LINKER=gcc
ASSEMBLER=as

fib10.out: fib10.o
        ${LINKER} $< -o $@

fib10.o: fib10.s
        as $< -o $@

clean:
        rm -r -f *.out *.o
