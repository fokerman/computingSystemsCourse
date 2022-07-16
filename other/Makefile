.PHONY: all clean cleanall

SOURCES := $(shell find `pwd` -name '*.tex')
OUTPUT := $(SOURCES:%.tex=%.pdf)
NAME := $(shell pwd | grep -o '[^/]*$$')

all: $(OUTPUT)

%.pdf: %.tex
ifneq (,$(wildcard ./img/Makefile))
	make -C img
endif
	pdflatex $^ #> /dev/null
	pdflatex $^ #> /dev/null
	rm -f *.aux *.log *.nav *.out *.snm *.toc *.vrb *.synctex.gz

clean:
	rm -f *.aux *.log *.nav *.out *.snm *.toc *.vrb *.synctex.gz

cleanall:
	rm -f $(OUTPUT)
	rm -f *.aux *.log *.nav *.out *.snm *.toc *.vrb *.synctex.gz
