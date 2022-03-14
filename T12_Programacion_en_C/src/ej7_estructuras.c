#include <stdio.h>

struct persona {
    char*  nombre;
    int    dni;
    float  altura;
};

struct vector {
    double x;
    double y;
    double z;
};

int main() {

    struct persona p;
    struct vector v;

    p.nombre = "Pepe Lujan";
    p.dni = 32038084;
    p.altura = 1.68;

    v.x = 8.99;
    v.y = 2.5;
    v.z = 12.31;

    printf("%s, %i, %f\n", p.nombre, p.dni, p.altura);
    printf("%f, %f, %f\n", v.x, v.y, v.z);

    return 0;
}
