clc;
close all;
clear;

img=imread('owl.png');
figure,imshow(img);
gaussian_kernel=fspecial('gaussian',[50,50],5);
img2=imfilter(img,gaussian_kernel,'replicate');
figure,imshow(img2);
figure,imshow(gaussian_kernel,[]);