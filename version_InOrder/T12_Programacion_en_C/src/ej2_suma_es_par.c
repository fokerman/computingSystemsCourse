#include <stdio.h>

int suma(int a, int b) {
    int s = a + b;
    return s;
}

int esPar(int numero) {
    return !(numero & 1);
}

int main() {
    int t;
    t = suma(2,4);
    printf("%i\n",esPar(t));
    return 0;
}