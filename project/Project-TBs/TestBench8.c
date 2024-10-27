#include <stdio.h>

#define N 100

void matrix_multiplication(int mat1[N][N], int mat2[N][N], int result[N][N])
{
    for (int i = 0; i < N; i++)
    {
        for (int j = 0; j < N; j++)
        {
            result[i][j] = 0;
            for (int k = 0; k < N; k++)
            {
                result[i][j] += mat1[i][k] * mat2[k][j];
            }
        }
    }
}

int main()
{
    int matrix1[N][N], matrix2[N][N], result[N][N];

    for (int i = 0; i < N; i++)
    {
        for (int j = 0; j < N; j++)
        {
            matrix1[i][j] = i + j;
            matrix2[i][j] = i - j;
        }
    }

    matrix_multiplication(matrix1, matrix2, result);

    return 0;
}
