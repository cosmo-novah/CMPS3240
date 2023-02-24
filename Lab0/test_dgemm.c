// Jose Zamora
// 01 / 27 / 2023
// CMPS 3240 - Lab 0

#include <stdio.h>
#include <stdlib.h>

void dgemm (int n, double* A, double* B, double* C)
{	
	for (int i = 0; i < n; ++i)
		for (int j = 0; j < n; ++j)
		{
			double cij = C[i+j*n]; /* cij = C[i][j] */
			//double cij = 0; /* cij = C[i][j] */
			for( int k = 0; k < n; k++ )
				cij += A[i+k*n] * B[k+j*n]; /* cij += A[i][k]*B[k][j] */
			C[i+j*n] = cij; /* C[i][j] = cij */
		}
}

/*void dgemm(int n, double *A , double *B, double *C)
{
	for (int i = 0; i < n; ++i)
	{
		for (int j = 0; j < n; ++j)
		{
			double cij = C[ i + j * n ];
			for( int k = 0; k < n; k++)
			{
				cij += A[ i + k * n] * B[ i + j * k ];
			}
			
			C[ i + j * n ] = cij;
		}
	}
}*/

int main(void)
{

	// Prep
	const int N = 1024; 
	double *A = ( double * ) malloc( N * N * sizeof(double) );
	double *B = ( double * ) malloc( N * N * sizeof(double) );
	double *C = ( double * ) malloc( N * N * sizeof(double) );

	//Call
	dgemm( N, A, B, C );

	//Free memory 
	free( A );
	free( B );
	free( C );

	return 0;
}

