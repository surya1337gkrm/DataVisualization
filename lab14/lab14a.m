close all;
clear;
clc;

x=[1 2;2.5 4.5;2 2;4 1.5;4 2.5];
d=pdist(x);

s=squareform(d);
z=linkage(s,'complete'); 
% mxn : m clusters | n levels z dimension
dendrogram(z);