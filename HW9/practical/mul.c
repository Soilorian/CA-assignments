#include <stdio.h>
#include <time.h>
#include <stdlib.h>

#define MIN(a,b) ((a) < (b) ? (a) : (b))
#define MAX(a,b) ((a) > (b) ? (a) : (b))

typedef  int** matrix;

matrix matrix_rand_init(int m, int n)
{
    matrix mat = (matrix)malloc(sizeof(int *) * m);
    for (int i = 0; i < m; i++)
    {
        mat[i] = malloc(sizeof(int) * n);
        for (int j = 0; j < n; j++)
        {
            mat[i][j] = rand() % 64 - 32;
        }
    }
    return mat;
}

matrix matrix_zero_init(int m, int n)
{
    matrix mat = (matrix)malloc(sizeof(int *) * m);
    for (int i = 0; i < m; i++)
    {
        mat[i] = malloc(sizeof(int) * n);
        for (int j = 0; j < n; j++)
        {
            mat[i][j] = 0;
        }
    }
    return mat;
}

void matrix_print(matrix mat, int m, int n)
{
    printf("[");
    for (int i = 0; i < m; i++)
    {
        printf("[");
        for (int j = 0; j < n; j++)
        {
            printf("%d", mat[i][j]);
            if(j!=n-1){
                printf(", ");
            }
        }
        printf("]");
        if(i!=m-1){
            printf("\n");
        }
    }
    printf("]\n");
}

matrix unoptimized_matrix_mul(matrix a, matrix b, int l, int m, int n)
{
    matrix c = matrix_zero_init(l, n);
    for (int i = 0; i < l; i++){
        for (int j = 0; j < n; j++){
            for (int k = 0; k < m; k++){
                c[i][j] += a[i][k]*b[k][j];
            }
        }
    }
    return c;
}
