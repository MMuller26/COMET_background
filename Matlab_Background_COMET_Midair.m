%% COMET background measurement 1 Hz mid-air
clear all
close all
clc

%% Reading in files:
folder = fileparts(which(mfilename)); 
addpath(genpath(folder));

[~, mid_air] = xlsread('COMET_BG_30xluchtledige_measurements_02-12-2021_09;59;50.xlsx');

%% Data processing mid-air measurement
% selecting the parameter column
Parameters = mid_air(:,1);

% selecting the columns and rows of the raw data for the 30 good measurements (sampled at 1 Hz)
mid_air_1Hz = mid_air(:,5:34);
mid_air_raw_1Hz = mid_air_1Hz(35:size(mid_air_1Hz, 1), :);
    % removing column 7 of mid_air_raw_1Hz because of missing data
    mid_air_raw_1Hz(:,7) = [];
    % cell array to double
    mid_air_raw_1Hz = cellfun(@str2num, mid_air_raw_1Hz);

% defining amount of samples
samples = [1:1:length(mid_air_raw_1Hz)];

% plotting data mid-air measurement
for i =1:size(mid_air_raw_1Hz,2)
    figure(1)
plot(samples,mid_air_raw_1Hz(:,i))
title('raw data of mid-air measurement at 1Hz')
hold on
end

% plotting mean of mid_air_raw_1Hz
mean_mid_air_raw_1Hz = mean(mid_air_raw_1Hz, 2);
plot(samples, mean_mid_air_raw_1Hz, '-g', 'LineWidth', 2)
hold off
    %fprintf('%d\n',round(mean_mid_air_raw_1Hz(:,1)));

