clc;
clear;
close all;

%% Load Data

[Inputs, Targets] = cancer_dataset();

pTrain = 0.7;
pTest = 0.2;
pVal = 1 - pTrain - pTest;

%% Create and Train Network

% Create LVQ Network
net = lvqnet(12);

% Set Max Epochs
net.trainParam.epochs = 30;

% Set Max Fail
net.trainParam.max_fail = 5;

% Divide Data
net.divideFcn = 'dividerand';
net.divideParam.trainRatio = pTrain;
net.divideParam.valRatio = pVal;
net.divideParam.testRatio = pTest;

% Train Network using LVQ1
[net, tr] = train(net, Inputs, Targets);

% Apply Network
Outputs = net(Inputs);

%% Data Division

% Train Data
TrainInputs = Inputs(:, tr.trainInd);
TrainTargets = Targets(:, tr.trainInd);
TrainOutputs = Outputs(:, tr.trainInd);

% Validation Data
ValInputs = Inputs(:, tr.valInd);
ValTargets = Targets(:, tr.valInd);
ValOutputs = Outputs(:, tr.valInd);

% Test Data
TestInputs = Inputs(:, tr.testInd);
TestTargets = Targets(:, tr.testInd);
TestOutputs = Outputs(:, tr.testInd);

%% Plot Results

figure;
plotconfusion(TrainTargets, TrainOutputs, 'Train', ...
              ValTargets, ValOutputs, 'Validation', ...
              TestTargets, TestOutputs, 'Test', ...
              Targets, Outputs, 'All');

