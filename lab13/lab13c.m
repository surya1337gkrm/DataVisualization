close all;
clear;
clc;
load fisheriris
[idx,C]=kmeans(meas,3,'dist','sqeuclidean');
labels={'Sepal Length','Sepal Width','Petal Length','Petal Width'};
figure,h=parallelcoords(meas,Group=idx,Labels=labels);
figure,h=parallelcoords(meas,Group=species,Labels=labels);