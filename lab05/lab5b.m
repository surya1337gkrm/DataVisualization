close all;
clear;
clc;
load fisheriris;

labels = {'Sepal Length','SepalWidth','PetalLength','PetalWidth'};
h = parallelcoords(meas,'Group',species,'Labels',labels);
h(1).LineWidth= 3;