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

filename = "20211123_avg_monoExp+BG27-47"; % in LV gemaakt. BG OL exp.2021-05 HR
BGall = importdata(filename);
old_laser = BGall(40:size(BGall,2));
%% Temperaturen sensoren 
% --> maakt niet het verschil tussen fiber straight en mid air!
temp_skinMM = skinMM(9,2:size(skinMM,2));
temp_skinMM = cellfun(@str2num, temp_skinMM);
mean_temp_skinMM = mean(temp_skinMM); % 29.5 graden

temp_skinMS = skinMS(9,2:size(skinMS,2));
temp_skinMS = cellfun(@str2num, temp_skinMS);
mean_temp_skinMS = mean(temp_skinMS); % 31.4 graden

temp_fiber_straight = fiber_straight(9,2:size(fiber_straight, 2));
temp_fiber_straight = cellfun(@str2num, temp_fiber_straight);
mean_temp_fiber_straight = mean(temp_fiber_straight); % 25.6 graden

temp_fiber_bent = fiber_bent(9,2:size(fiber_bent, 2));
temp_fiber_bent = cellfun(@str2num, temp_fiber_bent);
mean_temp_fiber_bent = mean(temp_fiber_bent); % 26.4 graden

temp_mid_air = mid_air(9,2:size(mid_air, 2));
temp_mid_air = cellfun(@str2num, temp_mid_air);
mean_temp_mid_air = mean(temp_mid_air); % 25.2 graden

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

%% Mid-air correction and normalization
% Defining x and y
x = (samples(20:size(samples, 2))-20)';
y_mid_air = mean_mid_air_raw_1Hz(20:size(mean_mid_air_raw_1Hz, 1)); 

% Implementing correction
mean_correct = mean(y_mid_air(end-4:end));
y_mid_air_correct = y_mid_air - mean_correct;

% Normalizing 
max_y_mid_air_correct = max(y_mid_air_correct)
y_mid_air_correct_norm = y_mid_air_correct / max_y_mid_air_correct;

norm_mid_air = y_mid_air_correct_norm

%% Fiber and straight bent correction and normalization
y_fiber_straight = mean_fiber_straight_raw_1Hz(20:size(mean_fiber_straight_raw_1Hz, 1));
y_fiber_bent = mean_fiber_bent_raw_1Hz(20:size(mean_fiber_bent_raw_1Hz, 1));

% Implementing correction
mean_correct = mean(y_fiber_straight(end-4:end));
y_fiber_straight_correct = y_fiber_straight - mean_correct;

mean_correct = mean(y_fiber_bent(end-4:end));
y_fiber_bent_correct = y_fiber_bent - mean_correct;

% Normalizing 
max_y_fiber_straight_correct = max(y_fiber_straight_correct)
y_fiber_straight_correct_norm = y_fiber_straight_correct / max_y_fiber_straight_correct;

max_y_fiber_bent_correct = max(y_fiber_bent_correct)
y_fiber_bent_correct_norm = y_fiber_bent_correct / max_y_fiber_bent_correct;

norm_fiber_straight = y_fiber_straight_correct_norm
norm_fiber_bent = y_fiber_bent_correct_norm

%% skin 2Hz correction and normalization
% Defining x and y
y_MM_2Hz = mean_MM_raw_2Hz_NoPress(20:size(mean_MM_raw_2Hz_NoPress, 1));

% Implementing correction
mean_correct = mean(y_MM_2Hz(end-4:end));
y_MM_2Hz_correct = y_MM_2Hz - mean_correct;

% Normalizing 
max_y_MM_2Hz_correct = max(y_MM_2Hz_correct)
y_MM_2Hz_correct_norm = y_MM_2Hz_correct / max_y_MM_2Hz_correct;

norm_skin_2Hz = y_MM_2Hz_correct_norm;

%% Old laser PBS correction and normalization

norm_old_laser = old_laser/max(old_laser);

%% Comparing mean of background mid-air 1Hz vs. straight fiber 1Hz measurement

figure(9)
plot(x, norm_mid_air, x, norm_fiber_straight)
legend('mid-air','straight fiber')
title('1Hz mid-air vs. 1Hz straight fiber measurement')
ylim([0 1])
xlabel('samples')

log_norm_mid_air = log(norm_mid_air);
log_norm_fiber_straight = log(norm_fiber_straight);

figure(91)
plot(x, log_norm_mid_air, x, log_norm_fiber_straight)
legend('mid-air','straight fiber')
title('1Hz mid-air vs. 1Hz straight fiber measurement - natural log')
xlabel('samples')

%% Comparing mean of background MM skin 2Hz without pressure vs. straight fiber 1Hz measurement

figure(10)
plot(x, norm_skin_2Hz, x, norm_fiber_straight)
legend('MM skin NoPress','straight fiber')
title('2Hz skin NoPress vs. 1Hz straight fiber measurement')
ylim([0 1])
%% Comparing mean of background MM skin 2Hz without pressure vs. bent fiber 1Hz measurement

figure(11)
plot(x, norm_skin_2Hz, x, norm_fiber_bent)
legend('MM skin NoPress','bent fiber')
title('2Hz skin NoPress vs. 1Hz bent fiber measurement')
ylim([0 1])


%% Inladen NL experiment MM
folder = fileparts(which(mfilename)); 
addpath(genpath(folder));

MM_BGS_1 = [];
MM_BGS_2 = [];
MM_BGS_3 = [];
MM_BGS_4 = [];
MM_BGS_5 = [];

for i = 2:1:6
    MM_BGS_2 = [MM_BGS_2, xlsread('NL_1011uur_BGS_meting2.xlsx', i, 'A2:A2001')];
    MM_BGS_3 = [MM_BGS_3, xlsread('NL_1134uur_MM_BGS_meting3.xlsx', i, 'A2:A2001')];
    MM_BGS_4 = [MM_BGS_4, xlsread('NL_1340uur_MM_BGS_meting4.xlsx', i, 'A2:A2001')];
    MM_BGS_5 = [MM_BGS_5, xlsread('NL_1532uur_MM_BGS_meting5.xlsx', i, 'A2:A2001')];
end

for j = 7:1:11
    MM_BGS_1 = [MM_BGS_1, xlsread('NL_0840uur_MM_Meting1_poging2', j, 'A2:A2001')];
end

mean_MM_BGS_1 = -mean(MM_BGS_1(2:end, :), 2);
mean_MM_BGS_2 = -mean(MM_BGS_2(2:end, :), 2);
mean_MM_BGS_3 = -mean(MM_BGS_3(2:end, :), 2);
mean_MM_BGS_4 = -mean(MM_BGS_4(2:end, :), 2);
mean_MM_BGS_5 = -mean(MM_BGS_5(2:end, :), 2);

mean_MM_BGS_total = mean([mean_MM_BGS_1 mean_MM_BGS_2 mean_MM_BGS_3 mean_MM_BGS_4 mean_MM_BGS_5],2);

% Implementing correction 
mean_correct = mean(mean_MM_BGS_total(end-4:end));
mean_correct_MM_BGS = mean_MM_BGS_total - mean_correct;
 
% Normalizing 
max_MM_BGS_correct = max(mean_correct_MM_BGS);
MM_BGS_correct_norm = mean_correct_MM_BGS / max_MM_BGS_correct;

%% Inladen NL experiment MS
folder = fileparts(which(mfilename)); 
addpath(genpath(folder));

MS_BGS_1 = [];
MS_BGS_2 = [];
MS_BGS_3 = [];
MS_BGS_4 = [];
MS_BGS_5 = [];

for i = 2:1:6
    MS_BGS_2 = [MS_BGS_2, xlsread('NL_1014uur_MS_BGS_meting2.xlsx', i, 'A2:A2001')];
    MS_BGS_3 = [MS_BGS_3, xlsread('NL_1138uur_MS_BGS_meting3.xlsx', i, 'A2:A2001')];
    MS_BGS_4 = [MS_BGS_4, xlsread('NL_1342uur_MS_BGS_meting4.xlsx', i, 'A2:A2001')];
    MS_BGS_5 = [MS_BGS_5, xlsread('NL_1535uur_MS_BGS_meting5.xlsx', i, 'A2:A2001')];
end

for j = 7:1:11
    MS_BGS_1 = [MS_BGS_1, xlsread('NL_8.50uur_Meting_1.xlsx', j, 'A2:A2001')];
end

mean_MS_BGS_1 = -mean(MS_BGS_1(2:end, :), 2);
mean_MS_BGS_2 = -mean(MS_BGS_2(2:end, :), 2);
mean_MS_BGS_3 = -mean(MS_BGS_3(2:end, :), 2);
mean_MS_BGS_4 = -mean(MS_BGS_4(2:end, :), 2);
mean_MS_BGS_5 = -mean(MS_BGS_5(2:end, :), 2);

mean_MS_BGS_total = mean([mean_MS_BGS_1 mean_MS_BGS_2 mean_MS_BGS_3 mean_MS_BGS_4 mean_MS_BGS_5],2);

% Implementing correction 
mean_correct = mean(mean_MS_BGS_total(end-4:end));
mean_correct_MS_BGS = mean_MS_BGS_total - mean_correct;
 
% Normalizing 
max_MS_BGS_correct = max(mean_correct_MS_BGS);
MS_BGS_correct_norm = mean_correct_MS_BGS / max_MS_BGS_correct;

%% Comparison mean background MM skin 2Hz without pressure vs. mid-air 1Hz vs. old laser PBS vs. NL skin MM and MS wells measurement 
figure(12)
plot(x(1:1883, 1), norm_skin_2Hz(1:1883,1))
hold on
plot(x(1:1883, 1), norm_mid_air(1:1883,1))
plot(x(1:1883, 1), norm_old_laser')
plot(x(1:1883, 1), MM_BGS_correct_norm(1:1883,1))
plot(x(1:1883, 1), MS_BGS_correct_norm(1:1883,1))
xlabel('samples')
ylabel('lifetime ??s')
ylim([0 1])
legend('comet-skin', 'comet-mid-air', 'old laser-pbs', 'NL-skin-MM', 'NL-skin-MS')
title('normalized comet skin/mid-air, old-laser pbs, new-laser skin MM/MS lifetimes')