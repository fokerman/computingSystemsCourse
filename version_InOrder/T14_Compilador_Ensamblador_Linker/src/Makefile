CC=c99
CFLAGS=-Wall -Wextra -pedantic -O0 -ggdb
LIBS=-lm

SOURCES := $(shell find `pwd` -name '*.c')
OUTPUT := $(SOURCES:%.c=%.out)

all: listaDebugStatic listaOptimize

listaDebugStatic: lista.c
	gcc -S -o lista.s lista.c
	gcc -c -o lista.o lista.c
	gcc    -o lista.out lista.c
	gcc -S -g -o listaDebug.s lista.c
	gcc -c -g -o listaDebug.o lista.c
	gcc    -g -o listaDebug.out lista.c
	gcc --static -S -o listaStatic.s lista.c
	gcc --static -c -o listaStatic.o lista.c
	gcc --static    -o listaStatic.out lista.c
	gcc --static -S -g -o listaStaticDebug.s lista.c
	gcc --static -c -g -o listaStaticDebug.o lista.c
	gcc --static    -g -o listaStaticDebug.out lista.c

listaOptimize: lista.c
	gcc -O0 -S -o listaO0.s lista.c
	gcc -O0 -c -o listaO0.o lista.c
	gcc -O0    -o listaO0.out lista.c
	gcc -O1 -S -o listaO1.s lista.c
	gcc -O1 -c -o listaO1.o lista.c
	gcc -O1    -o listaO1.out lista.c
	gcc -O2 -S -o listaO2.s lista.c
	gcc -O2 -c -o listaO2.o lista.c
	gcc -O2    -o listaO2.out lista.c
	gcc -O3 -S -o listaO3.s lista.c
	gcc -O3 -c -o listaO3.o lista.c
	gcc -O3    -o listaO3.out lista.c
	gcc -Os -S -o listaO4.s lista.c
	gcc -Os -c -o listaO4.o lista.c
	gcc -Os    -o listaO4.out lista.c

%.out: %.c
	$(CC) $(CFLAGS) $< -o $@ $(LIBS)

.PHONY: clean
clean:
	rm -f *.s *.o *.out
