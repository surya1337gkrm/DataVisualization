close all;
clear;
clc;
sum_image= zeros(300,400);


for i= 1:120
    im= imread(['./density_maps/d' num2str(i) '.jpg']);
    im= imresize(im,[300,400]);
    sum_image= sum_image+ double(im);
end

sum_image= sum_image/120;
figure,imshow(sum_image,[]);