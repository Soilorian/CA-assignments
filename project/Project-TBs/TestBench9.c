#include <stdio.h>
#include <stdlib.h>

typedef struct Node
{
    int data;
    struct Node *left;
    struct Node *right;
} Node;

Node *newNode(int data)
{
    Node *node = (Node *)malloc(sizeof(Node));
    node->data = data;
    node->left = NULL;
    node->right = NULL;
    return node;
}

Node *insertLevelOrder(int arr[], Node *root, int i, int n)
{
    if (i < n)
    {
        Node *temp = newNode(arr[i]);
        root = temp;

        root->left = insertLevelOrder(arr, root->left, 2 * i + 1, n);
        root->right = insertLevelOrder(arr, root->right, 2 * i + 2, n);
    }
    return root;
}

void inorder(Node *root)
{
    if (root != NULL)
    {
        inorder(root->left);
        int value = root->data;
        inorder(root->right);
    }
}

void freeTree(Node *root)
{
    if (root != NULL)
    {
        freeTree(root->left);
        freeTree(root->right);
        free(root);
    }
}

int main()
{
    int numNodes = 5000;
    int *arr = (int *)malloc(numNodes * sizeof(int));
    for (int i = 0; i < numNodes; i++)
    {
        arr[i] = i + 1;
    }

    Node *root = insertLevelOrder(arr, root, 0, numNodes);

    inorder(root);

    freeTree(root);
    free(arr);
    return 0;
}
