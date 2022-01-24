clear;
close all;
clc;
Precision=[0.797009 0.815369 0.832162 0.820447 0.865443 0.86361 0.822107 0.818487 0.884089 0.786283 0.856924 ];
Recall = [0.846184 0.765644 0.818961 0.773621 0.821652 0.78193 0.828532 0.773323 0.74201 0.655659 0.817653 ];


fMeasure=2*(Precision.*Recall)./(Precision+Recall);
bar([Precision;Recall;fMeasure]');
legend('Precision','Recall','FMeasure')
set(gca,'XTickLabel',{'PCA','HS','SF','FT','RFCN','AIM','IT','GBVS','BM','DRFI','MDTS'})
title('Precision and Recall')