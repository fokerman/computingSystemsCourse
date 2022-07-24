#include <stdio.h>

int esPar(int x) {
    return !(x % 2);
}

int collatz(int x) {
    int res;
    if( esPar(x) ) {
        res = x / 2;
    } else {
        res = 3 * x + 1;
    }
    return res;
}

int main() {

    int n = 100;

    printf("%i\n", n);

    n = collatz(n);
    printf("%i\n", n);

    n = collatz(n);
    printf("%i\n", n);

    n = collatz(n);
    printf("%i\n", n);

    n = collatz(n);
    printf("%i\n", n);

    n = collatz(n);
    printf("%i\n", n);

    return 0;
}


