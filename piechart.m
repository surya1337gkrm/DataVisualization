close all;
clear;
clc;
 
Weightage = [15 15 25 45];
exams = {'Mid-term 1';'Mid-term 2';'Final exam';'Programming Assignments'};
p = pie(Weightage);
pText = findobj(p,'Type','text');

percentValues = get(pText,'String');
txt = exams;
combinedtxt = strcat(exams,": ",percentValues);
combinedtxt2 = strcat(combinedtxt,percentValues);
for i=1:length(Weightage)
    pText(i).String = combinedtxt(i);
end
legend('Mid-term 1','Mid-term 2','Final exam','Programming Assignments');
set(legend,'Location','northeastoutside');
title( " Weightages of CPS 563-Data Visualization course");
