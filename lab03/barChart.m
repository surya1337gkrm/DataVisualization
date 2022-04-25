function b= barChart(data,methods,legends,chart_title)
%BARCHART Summary of this function goes here
%   Detailed explanation goes here
b=bar(data);
legend(legends,Location='bestoutside');
set(gca,'xTickLabel',methods,'XTickLabelRotation',60);
title(chart_title)


end