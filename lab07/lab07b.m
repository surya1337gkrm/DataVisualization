clc;
close all;
clear;

data={'Alaska',571951;
    'Texas',261797;
    'California',155959;
    'Montana',145552;
    'New Mexico',121356;
    'Arizona',113635;
    'Nevada',109826;
    'Colorado',103718;
    'Oregon',95997};
    
colors=rand(9,3);
% disp(colors)
rectangles=treemap([data{:,2}]);
labels=data(:,1);

plotRectangles(rectangles,labels,colors);
outline(rectangles);
title('The 9 Biggest U.S states')