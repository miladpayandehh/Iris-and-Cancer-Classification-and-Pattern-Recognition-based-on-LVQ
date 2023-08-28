clc;
clear;
close all;

xmin = -4;
xmax = 4;

n = 10;

X=unifrnd(xmin,xmax,[n 2]);

[vx, vy]=voronoi(X(:,1),X(:,2));

plot(vx,vy,'b','LineWidth',2);
hold on;
plot(X(:,1),X(:,2),'r+');
xlim([xmin-1 xmax+1]);
ylim([xmin-1 xmax+1]);
grid on;
axis square;


