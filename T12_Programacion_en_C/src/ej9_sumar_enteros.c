#include <stdio.h>

void suma(int* a, int* b, int* c) {
    *c = *a + *b;
}

int sumaEnteros(int n) {
    int sumatoria = 0;
    for(int i = 0; i < n; i++) {
        suma(&sumatoria, &i, &sumatoria);
    }
    return sumatoria;
}

int main() {
    printf("%i\n",sumaEnteros(100));
    return 0;
}
