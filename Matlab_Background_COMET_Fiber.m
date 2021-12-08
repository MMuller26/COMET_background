%% COMET background measurement 1 Hz bended vs. straight fiber
clear all
close all
clc

%% Reading in files:
folder = fileparts(which(mfilename)); 
addpath(genpath(folder));

[~, fiber_straight] = xlsread('Fiber_RECHT_100x_measurements_02-12-2021_16;27;15.xlsx');
[~, fiber_bent] = xlsread('Fiber_KROM_100x_measurements_02-12-2021_16;19;22.xlsx'); 

%% Data processing for straight fiber measeruments 
% selecting the parameter column
Parameters = fiber_straight(:,1);

% selecting the columns and rows of the raw data for 100 good measurements (sampled at 1 Hz)
fiber_straight_1Hz = fiber_straight(:,10:109);
fiber_straight_raw_1Hz = fiber_straight_1Hz(35:size(fiber_straight_1Hz, 1), :);
    % cell array to double
    fiber_straight_raw_1Hz = cellfun(@str2num, fiber_straight_raw_1Hz);

% defining amount of samples
samples = [1:1:length(fiber_straight_raw_1Hz)];

% plotting data straight fiber
for i =1:size(fiber_straight_raw_1Hz,2)
    figure(1)
plot(samples,fiber_straight_raw_1Hz(:,i))
title('raw data of straight fiber measurements at 1Hz')
hold on
end

% plotting mean of fiber_straight_raw_1Hz
mean_fiber_straight_raw_1Hz = mean(fiber_straight_raw_1Hz, 2);
plot(samples, mean_fiber_straight_raw_1Hz, '-g', 'LineWidth', 2)
hold off
    %fprintf('%d\n',round(mean_fiber_straight_raw_1Hz(:,1)));

%% Data processing for bent fiber measeruments 
% selecting the columns and rows of the raw data for 100 good measurements (sampled at 1 Hz)
fiber_bent_1Hz = fiber_bent(:,2:100);
fiber_bent_raw_1Hz = fiber_bent_1Hz(35:size(fiber_bent_1Hz, 1), :);
    % removing column 2 and 62 of fiber_bent_raw_1Hz because of missing data
    fiber_bent_raw_1Hz(:,2) = [];
    fiber_bent_raw_1Hz(:,62) = [];
    % cell array to double
    fiber_bent_raw_1Hz = cellfun(@str2num, fiber_bent_raw_1Hz);

% defining amount of samples
samples = [1:1:length(fiber_bent_raw_1Hz)];

% plotting data bent fiber
for i =1:size(fiber_bent_raw_1Hz,2)
    figure(2)
plot(samples,fiber_bent_raw_1Hz(:,i))
title('raw data of bent fiber measurements at 1Hz')
hold on
end

% plotting mean of fiber_bent_raw_1Hz
mean_fiber_bent_raw_1Hz = mean(fiber_bent_raw_1Hz, 2);
plot(samples, mean_fiber_bent_raw_1Hz, '-g', 'LineWidth', 2)
hold off
    %fprintf('%d\n',round(mean_fiber_bent_raw_1Hz(:,1)));

    
 %% Comparing mean of straight and bent fiber at 1Hz

figure(3)
plot(samples, mean_fiber_straight_raw_1Hz, samples, mean_fiber_bent_raw_1Hz)
legend('straight fiber','bent fiber')
title('straight vs. bent fiber sampled at 1Hz')