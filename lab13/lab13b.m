close all;
clear;
clc;

load fisheriris
[idx,C]=kmeans(meas,3,'dist','sqeuclidean');
figure;
ptsymb={'bs','r^','md','go','c+'};
for i=1:3
  
    clust=find(idx==i);
    plot3(meas(clust,1),meas(clust,2),meas(clust,3),ptsymb{i});
    hold on;
end

plot3(C(:,1),C(:,2),C(:,3),'rx','MarkerSize',15,'LineWidth',3);

title 'Fisher''s Iris Data'
xlabel('Sepal Lengths (cm)')
ylabel('sepal width (cm)')
zlabel('Petal Length')
hold off