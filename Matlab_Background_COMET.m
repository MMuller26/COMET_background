%% COMET background measurement with and without pressure on skin MM
clear all
close all
clc

%% Reading in files:
folder = fileparts(which(mfilename)); 
addpath(genpath(folder));

[~, skinMM] = xlsread('HuidMM_30xaanlsuitend_15xPauze10sfZonderdruk_15xPauze10sMetdruk_measurements_02-12-2021_10;20;09.xlsx'); 
[~,skinMS] = xlsread('measurements_02-12-2021_10;33;31.xlsx');

Parameters = skinMM(:,1);

%% COMET background measurement 2 Hz without pressure on skin MM
MM_2Hz_NoPress = skinMM(:,2:31);
MM_raw_2Hz_NoPress = MM_2Hz_NoPress(35:size(MM_2Hz_NoPress, 1), :);
    % removing measurement column 2
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
hold off

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
hold off

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
hold off

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
hold off

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
hold off
