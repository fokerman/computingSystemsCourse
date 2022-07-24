#include <stdio.h>

int sumNoMul5(int n) {
    int acum = 0;
    for(int i = 1; i <= n; i++) {
        if(!(i % 5)) {
            acum = acum + i;
        }
    }
    return acum;
}

int main() {
    printf("%i\n",sumNoMul5(1000));
    return 0;
}