clear;
close all;
clc;

load fisheriris;
d=pdist(meas);
z=linkage(d);
figure,dendrogram(z)

z2=linkage(meas,'single',{'minkowski',2});
figure,dendrogram(z2);