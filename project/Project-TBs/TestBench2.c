#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define ARRAY_SIZE 5000

int main()
{
    int array[ARRAY_SIZE];
    srand(time(NULL));

    for (int i = 0; i < ARRAY_SIZE; i++)
    {
        array[i] = i;
    }

    for (int i = 0; i < ARRAY_SIZE; i++)
    {
        int index = rand() % ARRAY_SIZE;
        int value = array[index];
    }

    return 0;
}