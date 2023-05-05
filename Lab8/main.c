#include <stdlib.h> 
#include <stdio.h>
int main( int argc, char** argv ) { 
    // Create two large arrays 
    const int length = 200000000; 
    int* a = (int*) malloc( sizeof(int) * length ); 
    int* b = (int*) malloc( sizeof(int) * length );
    // Do some arbitrarily hard amount of work. 
    for( int i = 0; i < length; i++ ) {
        a[i] = b[i] * b[i];
    }
    free(a); 
    free(b);
    return 0;
} 
