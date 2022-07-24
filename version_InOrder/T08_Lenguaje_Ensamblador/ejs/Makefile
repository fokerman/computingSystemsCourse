NASM=nasm
NASMFLAGS=-f elf64 -g -F DWARF

SOURCES := $(shell find `pwd` -name '*.asm')
OUTPUT := $(SOURCES:%.asm=%.out)

all: $(OUTPUT)

%.o: %.asm
	$(NASM) $(NASMFLAGS) $< -o $@

%.out: %.o
	$(LD) $< -o $@

.PHONY: clean
clean:
	rm -f *.o *.out
