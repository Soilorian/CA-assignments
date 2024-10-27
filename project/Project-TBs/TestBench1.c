#include <stdio.h>

#define ARRAY_SIZE 5000

int main()
{
    int array[ARRAY_SIZE];
    int cumulative_sum[ARRAY_SIZE];

    for (int i = 0; i < ARRAY_SIZE; i++)
    {
        array[i] = i;
    }
    cumulative_sum[0] = array[0];

    for (int i = 1; i < ARRAY_SIZE; i++)
    {
        cumulative_sum[i] = cumulative_sum[i - 1] + array[i];
    }

    return 0;
}