close all;
clear;
clc;
Precision=[0.797009 0.815369 0.832162 0.820447 0.865443 0.86361 0.822107 0.818487 0.884089 0.786283 0.856924 ];
Recall = [0.846184 0.765644 0.818961 0.773621 0.821652 0.78193 0.828532 0.773323 0.74201 0.655659 0.817653 ];


fMeasure=2*(Precision.*Recall)./(Precision+Recall);
methods={'Principal Component Analysis', 'Hierarchical Saliency ', 'Saliency Filter', 'Frequency Tune', 'Region-based Fully Convolutional Networks', 'Attention via Information Maximization', 'IT', 'Graph based Visual Saliency', 'Boolean Map', 'Discriminative Regional Feature Integration', 'Multi-task Deep Saliency'};

b=barChart([Precision;Recall;fMeasure]',methods,{'Precision','Recall','FMeasure'},'Precision and Recall');
b(3).LineWidth=2;
b(3).EdgeColor='Red';

b(1).FaceColor='cyan';