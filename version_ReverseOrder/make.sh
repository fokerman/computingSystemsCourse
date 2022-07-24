#!/bin/bash

# find folders
folders=$(find T* -maxdepth 0 -type d)

# made results directory
mkdir -p published

# execute makefiles and copy
for x in $folders
do
    make -C $x
    eval "cp $x/*.pdf published/"
done