#!/bin/bash

# set up a name variable
file=fishy_cat

# setup  blender enviornment variables
module purge
ml icc/2017.1.132-GCC-6.3.0-2.27  impi/2017.1.132
ml ifort/2017.1.132-GCC-6.3.0-2.27  impi/2017.1.132
module load Python/3.6.1
module load Blender
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
time blender -b -Y $file.blend -o //${file}/render_ -F PNG -f 0 -E CYCLES -t 48 -- --cycles-device GPU

# show job stats
# scontrol show job $SLURM_JOBID

# this sb file copied from HPCC getexample blender_farm
