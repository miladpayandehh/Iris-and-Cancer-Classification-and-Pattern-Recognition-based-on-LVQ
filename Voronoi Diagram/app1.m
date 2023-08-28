clc;
clear;
close all;

X=[0 0
   2 0
   1 2
   0.8 1
   1 -0.5];

voronoi(X(:,1),X(:,2));

xlim([-2 4]);
ylim([-2 4]);
grid on;
axis square;



