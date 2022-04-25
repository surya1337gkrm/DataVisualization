close all;
clear; 
clc;

img = imread('tristatemap.jpg');
imgDims=size(img);

load q2Temp.mat;
% SouthBend: 182,96
% FortWayne : 252,157
% Indianapolis: 210,245
% Evansville: 160,387
% 
% Paducah: 68,540
% Louisville : 265,407
% Lexington : 368,383
% Jackson : 452,395
% 
% Dayton: 347,252
% Columbus :440,211 
% Manshield :423,183
% Akron :432,132
% Toledo :377,80
% Cleveland:476,69
% Youngstown :563,123

x_cordinates= [436 476 440 347 423 377 563 452 368 265 68 160 252 210 182 486 336 554];
y_cordinates=[135 69 211 252 183 80 123 395 383 407 540 387 157 245 96 302 303 73];

densityMap = zeros(imgDims(1),imgDims(2));

for i=1:12
    for j=1:18
       densityMap(y_cordinates(j),x_cordinates(j)) = meanTemp(j,i);   
       
    end
end

% Generate the density map
gaussian_kernel = fspecial('gaussian', [250 250], 20);
density = imfilter(densityMap, gaussian_kernel, 'replicate');
figure,imshow(density,[]);

% Generate the heat map
heatMap = heatmap_overlay(img, density, 'jet');
figure,imshow(heatMap,[]);

colormap(jet);
colorbar;

title('Heatmap of Mean Temperatures on Tri-State Map');

