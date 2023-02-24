CC=gcc
FLAGS=-Wall -O0

all: fib13.out

fib13.out: fib13.o
	$(CC) $(FLAGS) $< -o $@
fib13.o: fib13.s
	$(CC) $(FLAGS) -c $< -o $@
clean:
	rm -r -f *.o *.out
