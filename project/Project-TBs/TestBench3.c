#include <stdio.h>

#define ARRAY_SIZE 5000
#define LOCALITY_SIZE 50

int main()
{
    int array[ARRAY_SIZE];

    for (int i = 0; i < ARRAY_SIZE; i++)
    {
        array[i] = i;
    }

    for (int start = 0; start < LOCALITY_SIZE; start++)
    {
        for (int i = start; i < ARRAY_SIZE; i += LOCALITY_SIZE)
        {
            int value = array[i];
        }
    }

    return 0;
}
