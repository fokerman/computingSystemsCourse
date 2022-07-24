#include <stdio.h>
#include <stdlib.h>

struct node {
    int data;
    struct node *next;
};

struct node* addFirst(struct node *p, int data) {
    struct node *newNode = (struct node*) malloc(sizeof(struct node));
    newNode->data = data;
    newNode->next = p;
    return newNode;
}

struct node* removeLast(struct node *p) {
    struct node *prev = 0;
    struct node *current = p;
    // Un solo nodo
    if(current->next == 0) {
        free(current);
        return 0;
    }
    prev = current;
    current = current->next;
    // busco el ultimo
    while(current->next != 0) {
        prev = current;
     current = current->next;
    }
    free(current);
    prev->next = 0;
    return p;
}

int main() {

    struct node *n = NULL;

    n = addFirst(n, 10);
    n = addFirst(n, 20);
    n = addFirst(n, 30);

    n = removeLast(n);
    n = removeLast(n);
    n = removeLast(n);

    return 0;
}
