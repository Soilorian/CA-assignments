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


matrix optimized_matrix_add(matrix a, matrix b, int m, int n)
{
    matrix c = matrix_rand_init(m, n);
    for (int i = 0; i < m; i++)
    {
        for (int j = 0; j < n; j++)
        {
            c[i][j] = a[i][j] + b[i][j];
        }
    }
    return c;
}

void free_matrix(matrix mat, int m) {
    for (int i = 0; i < m; i++) {
        free(mat[i]);
    }
    free(mat);
}

int main() {
    srand(time(NULL));
    int m = 100;
    int n = 200;
    matrix mat1 = matrix_rand_init(m, n);
    matrix mat2 = matrix_rand_init(m, n);
    printf("Matrix 1:\n");
    // matrix_print(mat1, m, n);
    printf("\nMatrix 2:\n");
    // matrix_print(mat2, m, n);
    matrix result = optimized_matrix_add(mat1, mat2, m, n);
    printf("\nResulting Matrix after Addition:\n");
    // matrix_print(result, m, n);
    free_matrix(mat1, m);
    free_matrix(mat2, m);
    free_matrix(result, m);
    return 0;
}
