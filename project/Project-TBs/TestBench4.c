#include <stdio.h>

#define ARRAY_SIZE 5000
#define STRIDE 4

int main()
{
    int array[ARRAY_SIZE];

    for (int i = 0; i < ARRAY_SIZE; i++)
    {
        array[i] = i;
    }

    for (int i = 0; i < ARRAY_SIZE; i += STRIDE)
    {
        int value = array[i];
    }

    return 0;
}
