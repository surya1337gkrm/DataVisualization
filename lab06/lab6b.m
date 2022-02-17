clc;
close all;
clear;
img=imread('21.jpg');
figure,imshow(img);
load("fixations.mat");
figure,imshow(fixations,[]);
length(fixations(fixations>0))
gaussian_kernel=fspecial('gaussian',[100,100],20);
density=imfilter(fixations,gaussian_kernel,'replicate');
figure,imshow(density,[]);
omask=heatmap_overlay(img,density,'jet');
figure,imshow(omask);

colormap('jet');
colorbar;
