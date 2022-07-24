#include <stdio.h>
#include <stdlib.h>

void initZero(float* a, int size) {
    for(int i=0; i<size; i++) {
        a[i] = 0.0;
    }
}

void diffusionStep(float* data, int size) {
    for(int i=1; i<size-1; i++) {
        data[i] = (data[i-1]+data[i]+data[i+1])/3.0;
    }
}

void print(float* a, int size) {
    for(int i=0; i<size; i++) {
        printf("%.2f\t", a[i]);
    }
    printf("\n");
}

int main() {

    int size = 10;
    float* data = (float*)malloc(sizeof(float)*size);
    initZero(data,size);
    
    data[0] = 200.0;
    data[size-1] = 25.0;

    for(int step=0;step<300;step++) {
        diffusionStep(data, size);
        print(data,size);
    }

    free(data);

    return 0;
}
