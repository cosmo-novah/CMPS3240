#include <stdio.h>

int x[2000];
int y[2000];
int result[2000];
int alpha = 13;

int main() {
	for( int i = 0; i <= 2000; i++ ) {
		printf( "Iteration %d\n", i );

                //====
                //x[i] = i; y[i] = i;
                //====

		result[i] = alpha * x[i] + y[i];
	}

        //printf("Total%d\n", result[1999]);
	return 0;
}
