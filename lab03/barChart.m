function b= barChart(data,methods,legends,chart_title)
%BARCHART Summary of this function goes here
%   Detailed explanation goes here
b=bar(data);
legend(legends);
set(gca,'xTickLabel',methods);
title(chart_title)
h=gca;
h.XTickLabelRotation=60;

end