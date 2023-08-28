clc;
clear;
close all;

%% Load Data

X = [ -3 -2 -2  0  0  0  0  2  2  3
       0  1 -1  2  1 -1 -2  1 -1  0];
   
C = [  1  1  1  2  2  2  2  1  1  1];

T = ind2vec(C);

%% Create and Train Network

net = lvqnet(4);

net = train(net, X, T);

%% Plot Results

figure;
plot(X(1,C==1),X(2,C==1),'o');
hold on;
plot(X(1,C==2),X(2,C==2),'s');
grid on;
axis equal;
xlim([-4 4]);
ylim([-3 3]);

%% Test Network

Xmin = min(X, [], 2)-1;
Xmax = max(X, [], 2)+1;

N = 100000;
X2 = [unifrnd(Xmin(1),Xmax(1),[1 N])
      unifrnd(Xmin(2),Xmax(2),[1 N])];
  
Y2 = net(X2);
C2 = vec2ind(Y2);

figure;
plot(X2(1,C2==1),X2(2,C2==1),'.');
hold on;
plot(X2(1,C2==2),X2(2,C2==2),'.');
grid on;
axis equal;
xlim([-4 4]);
ylim([-3 3]);


