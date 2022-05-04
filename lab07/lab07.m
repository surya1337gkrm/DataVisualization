close all;
clear;
clc;

n=15;
data=rand(1,n);
colors=(jet(n)+1)/2;
labels={};
for i=1:n
    labels{i}=sprintf('%2.1f%%',100*data(i)/sum(data));
end


rectangles=treemap(data);
plotRectangles(rectangles,labels,colors);
outline(rectangles);

