CC=c99
CFLAGS=-Wall -Wextra -pedantic -O0 -ggdb
LIBS=-lm

SOURCES := $(shell find `pwd` -name '*.c')
OUTPUT := $(SOURCES:%.c=%.out)

all: $(OUTPUT)

%.out: %.c
	$(CC) $(CFLAGS) $< -o $@ $(LIBS)

.PHONY: clean
clean:
	rm -f *.o *.out
