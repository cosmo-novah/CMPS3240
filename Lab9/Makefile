all: test_fmaOG.out test_fmaNEW.out #test_fma.o #myfma.s

#test_fma.o:
#	gcc -Wall -O0 -c -o test_fma.o test_fma.c

#myfma.s:
#	gcc -Wall -O0 -S -o myfma.s myfma.c

test_fmaOG.out:
	gcc -Wall -O0 -c -o myfma.o myfma.s
	gcc -Wall -O0 -o test_fmaOG.out test_fma.o myfma.o

test_fmaNEW.out:
	gcc -Wall -O0 -c -o myfma2.o myfma2.s
	gcc -Wall -O0 -o test_fmaNEW.out test_fma.o myfma2.o

clean:
	rm test_fmaOG.out test_fmaNEW.out
