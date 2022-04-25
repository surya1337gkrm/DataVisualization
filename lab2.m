clear;
close all;
clc;
a=[1,2,3,4,5,6];
b=[6,5,4,3,2,1];
c=5:10;
count=0;
for i=1:6
    count=count+a(i);
end
disp(count);
plot(a,b);
% plot(a,b,a,c);
% 
% clear;
% close all;
% clc;
% x=0:pi/100:2*pi
% y1=sin(x)
% y2=cos(x)
% plot(x,y1,x,y2)