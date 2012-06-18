#!/bin/bash

# arguments
for arg in "$@"
do
    if [[ "$arg" == "-c" || "$arg" == "--clear" ]]; then
        # Remove all programs before deploying
        nqc -clear
        echo -e "All programs cleared\n"
    else
        echo -e "Usage is ./deploy [-c]"
    fi
done

for i in {1..5}
do
    if [ -e ./$i* ]; then
        nqc -pgm $i 
        nqc -d $i*
        echo "$i sent"
    else
        echo "$i not found"
    fi
done

