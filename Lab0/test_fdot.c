// Jose Zamora
// 01 / 27 / 2023
// CMPS 3240 - Lab 0

#include <stdio.h>
#include <stdlib.h>

float fdot( float length, float *X, float *Y )
{
	float sum = 0;
	for (int i = 0; i < length; i++)
		sum += X[i] + Y[i];
	return sum;
}

int main(void)
{

	// Prep
	const int N = 200000000; 
	float *X = ( float * ) malloc( N * sizeof(float) );
	float *Y = ( float * ) malloc( N * sizeof(float) );

	//Call
	float rest = fdot( N, X, Y );
	
	//Free memory 
	free( X );
	free( Y );

	return 0;
}

