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

# REFERENCES
* Example: https://www.blender.org/download/demo-files/
* Blender: https://www.blender.org/download/
* Blender Manual: https://docs.blender.org/manual/en/latest/
* Bash Code: HPCC getexample






