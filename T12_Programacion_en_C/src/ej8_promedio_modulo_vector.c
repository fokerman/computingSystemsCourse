#include <stdio.h>
#include <math.h>

struct vector {
    float x;
    float y;
};

float modulo2(float x, float y) {
    return sqrt( x * x + y * y);
}

float promedio(struct vector v[], int size) {
    float acumulador = 0;
    for(int i = 0; i < size; i++) {
        float x = v[i].x;
        float y = v[i].y;
        acumulador = acumulador + modulo2(x,y);
    }
    return acumulador / (float)(size);
}

int main() {

    struct vector v[3] = { {2.3,1.2}, {5.8,3.5}, {9.4,10.10}};

    float res = promedio(v, 3);

    printf("%f\n",res);

    return 0;
}

