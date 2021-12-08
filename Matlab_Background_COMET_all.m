%% COMET all background measurements compared to each other
clear all
close all
clc

%% Reading in files:
folder = fileparts(which(mfilename)); 
addpath(genpath(folder));

[~, skinMM] = xlsread('HuidMM_30xaanlsuitend_15xPauze10sfZonderdruk_15xPauze10sMetdruk_measurements_02-12-2021_10;20;09.xlsx'); 
[~,skinMS] = xlsread('measurements_02-12-2021_10;33;31.xlsx');

[~, fiber_straight] = xlsread('Fiber_RECHT_100x_measurements_02-12-2021_16;27;15.xlsx');
[~, fiber_bent] = xlsread('Fiber_KROM_100x_measurements_02-12-2021_16;19;22.xlsx'); 

[~, mid_air] = xlsread('COMET_BG_30xluchtledige_measurements_02-12-2021_09;59;50.xlsx');

%% COMET background measurement 2 Hz without pressure on skin MM
Parameters = skinMM(:,1);
MM_2Hz_NoPress = skinMM(:,2:31);
MM_raw_2Hz_NoPress = MM_2Hz_NoPress(35:size(MM_2Hz_NoPress, 1), :);
    % removing measurement column 2 because of missing data
    MM_raw_2Hz_NoPress(:,2) = [];
    % cell array to double
    MM_raw_2Hz_NoPress = cellfun(@str2num, MM_raw_2Hz_NoPress);

% defining amount of samples
samples = [1:1:length(MM_raw_2Hz_NoPress)];

% plotting data MM_raw_2Hz_NoPress
for i =1:size(MM_raw_2Hz_NoPress,2)
    figure(1)
plot(samples,MM_raw_2Hz_NoPress(:,i))
title('MM raw data without pressure 2Hz')
hold on
end

% plotting mean of MM_raw_2Hz_NoPress
mean_MM_raw_2Hz_NoPress = mean(MM_raw_2Hz_NoPress, 2);
plot(samples, mean_MM_raw_2Hz_NoPress, '-g', 'LineWidth', 2)
hold off
    %fprintf('%d\n',round(mean_MM_raw_2Hz_NoPress(:,1)));

%% COMET background measurement 0.1 Hz without pressure on skin MM
MM_01Hz_NoPress = skinMM(:,32:46);
MM_raw_01Hz_NoPress = MM_01Hz_NoPress(35:size(MM_01Hz_NoPress, 1), :);
    % cell array to double
    MM_raw_01Hz_NoPress = cellfun(@str2num, MM_raw_01Hz_NoPress);

% plotting data MM_raw_01Hz_NoPress
for i =1:size(MM_raw_01Hz_NoPress,2)
    figure(2)
plot(samples,MM_raw_01Hz_NoPress(:,i))
title('MM raw data without pressure 0.1Hz')
hold on
end

% plotting mean of MM_raw_01Hz_NoPress
mean_MM_raw_01Hz_NoPress = mean(MM_raw_01Hz_NoPress, 2);
plot(samples, mean_MM_raw_01Hz_NoPress, '-g', 'LineWidth', 2)
hold off
    %fprintf('%d\n',round(mean_MM_raw_01Hz_NoPress(:,1)));

%% COMET background measurement 0.1 Hz with pressure on skin MM
MM_01Hz_Press = skinMM(:,47:61);
MM_raw_01Hz_Press = MM_01Hz_Press(35:size(MM_01Hz_Press, 1), :);
    % cell array to double
    MM_raw_01Hz_Press = cellfun(@str2num, MM_raw_01Hz_Press);

% plotting data MM_raw_01Hz_Press
for i =1:size(MM_raw_01Hz_Press,2)
    figure(3)
plot(samples,MM_raw_01Hz_Press(:,i))
title('MM raw data with pressure 0.1Hz')
hold on
end

% plotting mean of MM_raw_01Hz_Press
mean_MM_raw_01Hz_Press = mean(MM_raw_01Hz_Press, 2);
plot(samples, mean_MM_raw_01Hz_Press, '-g', 'LineWidth', 2)
hold off
    %fprintf('%d\n',round(mean_MM_raw_01Hz_Press(:,1)));

%% COMET background measurement 2 Hz without pressure on skin MS
MS_01Hz_NoPress = skinMS(:,2:15);
MS_raw_01Hz_NoPress = MS_01Hz_NoPress(35:size(MS_01Hz_NoPress,1),:);
    % Cell array to double
    MS_raw_01Hz_NoPress = cellfun(@str2num,MS_raw_01Hz_NoPress);

for i =1:size(MS_raw_01Hz_NoPress,2)
    figure(4)
plot(samples,MS_raw_01Hz_NoPress(:,i))
title('MS raw data without pressure 0.1Hz')
hold on
end

% plotting mean of MS_raw_01Hz_NoPress
mean_MS_raw_01Hz_NoPress = mean(MS_raw_01Hz_NoPress, 2);
plot(samples, mean_MS_raw_01Hz_NoPress, '-g', 'LineWidth', 2)
hold off
    %fprintf('%d\n',round(mean_MS_raw_01Hz_NoPress(:,1)));

%% COMET background measurement 2 Hz with pressure on skin MS
MS_01Hz_Press = skinMS(:,17:size(skinMS,2));
MS_raw_01Hz_Press = MS_01Hz_Press(35:size(MS_01Hz_Press,1),:);
    % Cell array to double
    MS_raw_01Hz_Press = cellfun(@str2num,MS_raw_01Hz_Press);

for i =1:size(MS_raw_01Hz_NoPress,2)
    figure(5)
plot(samples,MS_raw_01Hz_Press(:,i))
title('MS raw data with pressure 0.1Hz')
hold on
end

% plotting mean of MS_raw_01Hz_Press
mean_MS_raw_01Hz_Press = mean(MS_raw_01Hz_Press, 2);
plot(samples, mean_MS_raw_01Hz_Press, '-g', 'LineWidth', 2)
hold off
    %fprintf('%d\n',round(mean_MS_raw_01Hz_Press(:,1)));
    
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
    figure(6)
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
    figure(7)
plot(samples,fiber_bent_raw_1Hz(:,i))
title('raw data of bent fiber measurements at 1Hz')
hold on
end

% plotting mean of fiber_bent_raw_1Hz
mean_fiber_bent_raw_1Hz = mean(fiber_bent_raw_1Hz, 2);
plot(samples, mean_fiber_bent_raw_1Hz, '-g', 'LineWidth', 2)
hold off
    %fprintf('%d\n',round(mean_fiber_bent_raw_1Hz(:,1)));
    
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
    figure(8)
plot(samples,mid_air_raw_1Hz(:,i))
title('raw data of mid-air measurement at 1Hz')
hold on
end

% plotting mean of mid_air_raw_1Hz
mean_mid_air_raw_1Hz = mean(mid_air_raw_1Hz, 2);
plot(samples, mean_mid_air_raw_1Hz, '-g', 'LineWidth', 2)
hold off
    %fprintf('%d\n',round(mean_mid_air_raw_1Hz(:,1)));

%% Comparing mean of background mid-air 1Hz vs. straight fiber 1Hz measurement

figure(9)
plot(samples, mean_mid_air_raw_1Hz, samples, mean_fiber_straight_raw_1Hz)
legend('mid-air','straight fiber')
title('1Hz mid-air vs. 1Hz straight fiber measurement')

%% Comparing mean of background MM skin 2Hz without pressure vs. straight fiber 1Hz measurement

figure(10)
plot(samples, mean_MM_raw_2Hz_NoPress, samples, mean_fiber_straight_raw_1Hz)
legend('MM skin NoPress','straight fiber')
title('2Hz skin NoPress vs. 1Hz straight fiber measurement')

%% Comparing mean of background MM skin 2Hz without pressure vs. bent fiber 1Hz measurement

figure(11)
plot(samples, mean_MM_raw_2Hz_NoPress, samples, mean_fiber_bent_raw_1Hz)
legend('MM skin NoPress','bent fiber')
title('2Hz skin NoPress vs. 1Hz bent fiber measurement')

