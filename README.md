# Processing-of-tumor-multiresolution-blocked-images

A software project for processing of multiresolution images derived from tumor specimens

This software repository contains code that can be applied to set up and verify the spatial referencing information of a blockedImage object derived from a Whole Slide Image (WSI) of tumor specimens. 
Blocked images work with multiresolution images. In multiresolution images, image data is stored as a set of images at different resolution levels. Blocked images assume that the spatial extents of each level are the same. When working with multiresolution images, the first step is to validate this assumption.
The code is written in Matlab programming language and it is commented. It can be used and adapted to the user context. 
The files contain scripts that can be used to create blockedimage objects, to  explore the spatial referencing of the tumor multiresolution blocked image and to verify the aspect ratio. The blocks derived from the multiresolution blocked image can be used to train a Convolutional Neural Network (CNN). 

MIT Licence
Copyright © 2025 Roberto Loi and Monica Pibiri

