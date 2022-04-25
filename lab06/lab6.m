clc;
close all;
clear;

img=imread('owl.png');

subplot(1,3,1)
imshow(img);
gaussian_kernel=fspecial('gaussian',[50,50],5);
img2=imfilter(img,gaussian_kernel,'replicate');
subplot(1,3,2)
imshow(img2);
subplot(1,3,3)
imshow(gaussian_kernel,[]);