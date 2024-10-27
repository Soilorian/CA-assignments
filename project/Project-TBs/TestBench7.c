#include <stdio.h>

#define ARRAY_SIZE 50

int fib(int n, int memory[])
{
    if (n == 0 || n == 1)
        return 1;

    int x, y;
    if (memory[n - 1] != -1)
        x = memory[n - 1];
    else
    {
        x = fib(n - 1, memory);
        memory[n - 1] = x;
    }

    if (memory[n - 2] != -1)
        y = memory[n - 2];
    else
    {
        y = fib(n - 2, memory);
        memory[n - 2] = y;
    }

    return x + y;
}

int main()
{
    int fibMemory[ARRAY_SIZE];

    for (int i = 0; i < ARRAY_SIZE; i++)
    {
        fibMemory[i] = -1;
    }

    fibMemory[0] = 1;
    fibMemory[1] = 1;

    fib(48, fibMemory);
}