close all;
clear;
clc;

data = zeros(64 * 64, 130);
for i= 1:130
im = imread(['./faces_pca/face' num2str(i) '.png']);
im= rgb2gray(im);
im= im2double(im);
im= imresize(im,[64,64]);
data(:,i) = im(:);
end


[PC, V] = pca(data);
PC = PC(:,1:2000);

im_test= imread(['./faces_pca/face' num2str(131) '.png']);
im_test= rgb2gray(im_test);
im_test= im2double(im_test);
im_test= imresize(im_test,[64,64]);
im_test= im_test(:)';

im_pca= im_test*PC;
im_recover= im_pca*PC';
im_recover= reshape(im_recover,[64 64]);
im_test= reshape(im_test,[64 64]);
figure,subplot(1,2,1);
imshow(im_test,[]);
subplot(1,2,2);
imshow(im_recover,[]);

figure,
for i= 1:10
subplot(1,10,i);
temp = reshape(PC(:,i),[64 64]);
imshow(temp,[]);
end

