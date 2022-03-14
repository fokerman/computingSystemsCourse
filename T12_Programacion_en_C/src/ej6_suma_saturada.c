#include <stdio.h>

char sumaSaturada(int a, int b, int c) {
    int suma =  a + b + c;
    if(suma > 127) { // 127d = 0x7F
        suma = 127;
    }
    if(suma < -128) { // -128d = 0x80
        suma = -128;
    }
    return suma;
}

int main() {

    char x1 = sumaSaturada(20,32,4);
    printf("%i\n",x1);

    char x2 = sumaSaturada(20,32,-433);
    printf("%i\n",x2);

    char x3 = sumaSaturada(20,32,433);
    printf("%i\n",x3);

    return 0;
}


