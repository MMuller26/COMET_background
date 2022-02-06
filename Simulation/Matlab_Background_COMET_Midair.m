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

%% plotting as mono exponent and fitting curve

% Normalizing 
max_mean_mid_air_raw_1Hz = max(mean_mid_air_raw_1Hz)
mean_mid_air_raw_1Hz_norm = mean_mid_air_raw_1Hz / max_mean_mid_air_raw_1Hz;

% Defining x and y
x = (samples(20:size(samples, 2))-20)';
y_mid_air = mean_mid_air_raw_1Hz_norm(20:size(mean_mid_air_raw_1Hz_norm, 1));

% fitting 
fitType=fittype('exp(-c*x)+d') ;
fitCurve= fit(x,y_mid_air,fitType,'StartPoint',[1/15;0.32]);

% manual fit
y_manual_mid_air = exp(-0.01*x) + 0.34;

% determining lifetime
lifetime_mid_air = coeffvalues(fitCurve)
lifetime_mid_air = 1/lifetime_mid_air(1)

figure(2)
plot(fitCurve, x, y_mid_air)
hold on
plot(x, y_manual_mid_air)
legend('data', 'fitted curve', 'manual curve')
title(sprintf('Normalized mean of mid air, lifetime = %.2f', lifetime_mid_air))
hold off
