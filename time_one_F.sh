#!/bin/bash

for i in {1..5};
do
bash cat_example_cycles_CPU.sh
done
for i in {1..3};
do
bash cat_example_cycles_GPU.sh
done 
