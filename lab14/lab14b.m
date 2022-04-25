clear;
close all;
clc;

x=[1 2;2.5 4.5;2 2;4 1.5;4 2.5];
d=pdist(x);
z=linkage(d);
dendrogram(z);