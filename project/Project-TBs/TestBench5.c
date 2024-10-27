#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define ARRAY_SIZE 5000
#define MAX_STRIDE 7

int main()
{
    int array[ARRAY_SIZE];
    srand(time(NULL));

    for (int i = 0; i < ARRAY_SIZE; i++)
    {
        array[i] = i;
    }

    int random_stride = 1;

    for (int i = 0; i < ARRAY_SIZE; i += random_stride)
    {
        int value = array[i];
        random_stride = (rand() % MAX_STRIDE) + 1;
    }

    return 0;
}