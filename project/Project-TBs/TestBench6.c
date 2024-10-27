#include <stdio.h>

#define ARRAY_SIZE 5000

void access_pattern(int array[], int size)
{
    for (int i = 0; i < size; i++)
    {
        int value = array[i];
    }
}

int main()
{
    int array[ARRAY_SIZE];

    for (int i = 0; i < ARRAY_SIZE; i++)
    {
        array[i] = i;
    }

    for (int size = 50; size <= ARRAY_SIZE; size *= 10)
    {
        access_pattern(array, size);
    }

    return 0;
}
