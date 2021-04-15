# cmse401_proj
by SamuelChen
# Software Abstract
This is for cmse401 project.

In this project we will using the Software Blender to render some example blend files, and our final goal is trying to speed up the rendering process.

The process of rendering is basically turning a 3D scenes, whether single frame for a static picture or many frames for a video in 2D pictures. 

> "What the render looks like is defined by cameras, lights and materials. These are shared between Eevee and Cycles, however some features are only supported in one or the other."
>
>	From https://docs.blender.org/manual/en/latest/render/introduction.html

In order to make blender work on HPCC, we have to use those commands first. Commands may vary depends on which version of blender we want to use.

# Commands required:
```bash
ml icc/2017.1.132-GCC-6.3.0-2.27  impi/2017.1.132
ml ifort/2017.1.132-GCC-6.3.0-2.27  impi/2017.1.132
module load Python/3.6.1
module load Blender
```

# INSTALLATION

Blender is already installed on HPCC, but if we want a different version of Blender, we can go do the following


1. Go to Blender website and download the file

https://www.blender.org/download/

2. Then unzip the tar file (name may varie depends on the version) and run blender May need to load certain module

```bash
tar -xvzf blender-2.91.2-linux64.tar
cd blender-2.91.2-linux64
blender
```
Now, Blender is 'installed' on the HPCC

# RUN A EXAMPLE RENDER
In this folder, we have an example file from Blender website, file name fishy_cat.blend Simply run the following commmand:

```bash
blender -b fishy_cat.blend -f 0 -F PNG 
```

We will get a defualt name 0000.png, in the /tmp directory. Look that cute cat, awwww~, but I am a dog person. 

# RUN THE FOLLOWING FILE IF YOU ARE LAZY LIKE ME 
This bash filed copied and modified from HPCC getexample blender_farm

```bash
bash too_lazy_example.sb
```

For for the real rendering and timing study.
Run
```bash
bash fishy_cat.blend
```
or 
```bash
time blender -b fishy_cat.blend -f 0 -F PNG 
```
to get the result.


I merged those two script into one file `time_one_F.sh`:

`cat_example_cycles_CPU.sh` and `cat_example_cycles_GPU.sh` to check out the effect of device in rendering.

```bash
cat_example_cycles_CPU.sh
```

`-t `: using number of  threads  
`-E `: Choose render Engine  
`-- --cycles-device `: Choose using GPU or CPU  

change the number after `-t` to change the threads number

# Video rendering

We will be using the Blender demo `spring.blend`

Since git lab has file size limitation as 100Mb, we will have to download from:

https://cloud.blender.org/p/gallery/5d2607ee6b3001d49bab798a


Since thie blend file is made from Blender/2.8, we will be changing the modules a little bit:  

```bash
ml icc/2019.1.144-GCC-8.2.0-2.31.1  impi/2018.4.274
ml ifort/2019.1.144-GCC-8.2.0-2.31.1  impi/2018.4.274
ml GCCcore/8.2.0
module load Python/3.7.2
module load Blender/2.80-Python-3.7.2
module load CUDA
```

# Note

For some reasons, the flag for bender `-s`&`-e` will cause blender to quit before it can start the rendering (which it should not be),

I wrote a script to run the serial code witg `-a`, which means to render all the frames, and yes, we have to use `ctrl`+`c` to force kill 
the process when we want, (The Node woll also kill the job for you since it reqires a lot memories, it was around frame 7, when it got kill for me on the Node).

Run the command to obtain serial rendering speed/time, quit whenever we have enough data.

``` 
bash spring_serial.sh
```
Run the command to obtain rendering speed/time using 48 threads, quit whenever we have enough data.
``` 
bash spring_threads.sh
```

Those two scripts will render the first 5 frames of this blend file. 

# Run the rendering in a job array

Run the command to subbmit job to slurm:
```
sbatch spring_array.sb
```
This code will render the first 10 frames in the file.

```
sbatch spring_array_100.sb
```
This code will render the first 50 frames in the file.

```
sbatch test_array.sb
```
This code will render the first 100 frames in the file.



# REFERENCES
* Example: https://www.blender.org/download/demo-files/
* Blender: https://www.blender.org/download/
* Blender Manual: https://docs.blender.org/manual/en/latest/
* Bash Code: HPCC getexample






