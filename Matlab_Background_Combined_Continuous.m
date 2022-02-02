%% plots of Continuous measurements skin (MM+MS), mid-air and aluminium, 65 minutes, sampled at once per minute or once per half minute
clear all
close all
clc

%% RMSE
load('RMSE_continu_MM_total.mat');
RMSE_MM = RMSE_continu_MM_total;
load('RMSE_continu_MM_PO2_total.mat');
RMSE_MM_PO2= RMSE_continu_MM_PO2_total;

load('RMSE_continu_MS_total.mat');
RMSE_MS = RMSE_continu_MS_total;
load('RMSE_continu_MS_PO2_total.mat');
RMSE_MS_PO2 = RMSE_continu_MS_PO2_total;

load('RMSE_continu_mid_air_total.mat');
RMSE_mid_air= RMSE_continu_mid_air_total;
load('RMSE_continu_mid_air_PO2_total.mat');
RMSE_mid_air_PO2 = RMSE_continu_mid_air_PO2_total;

load('RMSE_continu_alum_total.mat');
RMSE_alum = RMSE_continu_alum_total;
load('RMSE_continu_alum_PO2_total.mat'); 
RMSE_alum_PO2 = RMSE_continu_alum_PO2_total;

%% plotting
figure(1)
time = linspace(0, 65, 13);
plot(time, RMSE_continu_MS_total)
hold on
plot(time, RMSE_continu_MM_total)
plot(time, RMSE_continu_mid_air_total)
plot(time, RMSE_continu_alum_total)
legend('skin MS', 'skin MM', 'mid-air', 'aluminium')
ylabel('RMSE')
xlabel('time passed in minutes')
title('RMSE for prediction vs. input lifetime over time 90% background')

figure(2)
plot(time, RMSE_continu_MS_PO2_total)
hold on
plot(time, RMSE_continu_MM_PO2_total)
plot(time, RMSE_continu_mid_air_PO2_total)
plot(time, RMSE_continu_alum_PO2_total)
legend('skin MS', 'skin MM', 'mid-air', 'aluminium')
ylabel('RMSE')
xlabel('time passed in minutes')
title('RMSE for prediction vs. input PO2 over time 90% background')

%% Reading files for temperature analysis
folder = fileparts(which(mfilename)); 
addpath(genpath(folder));

[~, continu_MM] = xlsread('measurements_16-12-2021_12;52;58.xlsx');
[~, continu_MS] = xlsread('measurements_16-12-2021_14;32;13.xlsx');
[~, continu_mid_air] = xlsread('measurements_23-12-2021_11;14;27.xlsx');
[~, continu_alum] = xlsread('measurements_23-12-2021_12;38;37.xlsx');

%% Extracting temperature over time
temp_MM = continu_MM(9,7:136);
temp_MS = continu_MS(9,2:131);
temp_mid_air = continu_mid_air(9, 5:69);
temp_alum = continu_alum(9, 5:69); 

temp_MM = cellfun(@str2num, temp_MM);
temp_MS = cellfun(@str2num, temp_MS);
temp_mid_air = cellfun(@str2num, temp_mid_air);
temp_alum = cellfun(@str2num, temp_alum);

% MM
    % Define number of columns to average
    avg_cols = 2;
    % Use filter to calculate the moving average across EVERY combination of columns
    temp_MM_moving_avg = filter(ones(1,avg_cols)/avg_cols,1,temp_MM,[],2);
    % Grab only the column averages that were actually wanted
    temp_MM_avg = temp_MM_moving_avg(:,avg_cols:avg_cols:end);
    
% MS
    % Use filter to calculate the moving average across EVERY combination of columns
    temp_MS_moving_avg = filter(ones(1,avg_cols)/avg_cols,1,temp_MS,[],2);
    % Grab only the column averages that were actually wanted
    temp_MS_avg = temp_MS_moving_avg(:,avg_cols:avg_cols:end);

%% plotting
figure(3)
time2 = 1:1:65;
plot(time2, temp_MS_avg, time2, temp_MM_avg, time2, temp_mid_air, time2, temp_alum)
legend('skin MS', 'skin MM', 'mid-air', 'aluminium')
ylabel('temperature')
xlabel('time passed in minutes')
title('fiber temperature over time for each measurement')