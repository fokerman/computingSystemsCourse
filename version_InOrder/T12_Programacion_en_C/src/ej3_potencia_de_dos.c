#include <stdio.h>

int potenciaDe2_for(int n) {
    int t = 1;
    for(int i=0; i<n; i++) {
          t = t * 2;
    }
    return t;
}

int potenciaDe2_while(int n) {
    int t = 1;
    int i = 0;
    while( i != n ) {
        t = t * 2;
        i++;
    }
    return t;
}


int main() {
    int a = potenciaDe2_for(5);
    printf("5^2 = %i\n",a);
    int b = potenciaDe2_while(5);
    printf("5^2 = %i\n",b);
    return 0;
}

