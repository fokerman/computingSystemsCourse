#!/bin/bash

# find folders
folders=$(find T* -maxdepth 0 -type d)

# remove results
rm -fr published

# remove all
for x in $folders
do
    make -C $x cleanall
done