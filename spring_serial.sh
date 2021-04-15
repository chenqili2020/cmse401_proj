#!/bin/bash

# set up a name variable
file=spring

# setup  blender enviornment variables
module purge
ml icc/2019.1.144-GCC-8.2.0-2.31.1  impi/2018.4.274
ml ifort/2019.1.144-GCC-8.2.0-2.31.1  impi/2018.4.274
ml GCCcore/8.2.0 
module load Python/3.7.2
module load Blender/2.80-Python-3.7.2

module load CUDA
# module list
# change to the working directory
# cd ${SLURM_SUBMIT_DIR}

# make a subdirectory with the same name as the blend file
if [ -d $file ]
then
    rm -R $file
fi
mkdir $file

# run blender
time blender -b $file.blend -o //${file}/render_ -F PNG -s 0 -e 10 -E CYCLES -t 48 -- --cycles-device GPU

# show job stats
# scontrol show job $SLURM_JOBID

# this sb file copied from HPCC getexample blender_farm
