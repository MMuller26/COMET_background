%% NL BGS after different times after ALA application MS % naam niet veranderd ivm tijd
clear all
close all
clc

%% Reading in BGS files 630nm:
folder = fileparts(which(mfilename)); 
addpath(genpath(folder));

MM_BGS_1 = [];
MM_BGS_2 = [];
MM_BGS_3 = [];
MM_BGS_4 = [];
MM_BGS_5 = [];

for i = 2:1:6
    MM_BGS_2 = [MM_BGS_2, xlsread('NL_1014uur_MS_BGS_meting2.xlsx', i, 'A2:A2001')];
    MM_BGS_3 = [MM_BGS_3, xlsread('NL_1138uur_MS_BGS_meting3.xlsx', i, 'A2:A2001')];
    MM_BGS_4 = [MM_BGS_4, xlsread('NL_1342uur_MS_BGS_meting4.xlsx', i, 'A2:A2001')];
    MM_BGS_5 = [MM_BGS_5, xlsread('NL_1535uur_MS_BGS_meting5.xlsx', i, 'A2:A2001')];
end

for j = 7:1:11
    MM_BGS_1 = [MM_BGS_1, xlsread('NL_8.50uur_Meting_1.xlsx', j, 'A2:A2001')];
end

%% calculating mean of maximum
max_MM_BGS_1 = -(mean(MM_BGS_1(2,:)));
max_MM_BGS_2 = -(mean(MM_BGS_2(2,:)));
max_MM_BGS_3 = -(mean(MM_BGS_3(2,:)));
max_MM_BGS_4 = -(mean(MM_BGS_4(2,:)));
max_MM_BGS_5 = -(mean(MM_BGS_5(2,:)));

Max_MM_BGS_total = [max_MM_BGS_1 max_MM_BGS_2 max_MM_BGS_3 max_MM_BGS_4 max_MM_BGS_5];
time_background = [0 1.5 3 5 7];

figure(1)
plot(time_background, Max_MM_BGS_total)
xlabel('time passed (hours)')
ylabel('amplitude')
xlim([0 7])
title('amplitude of background signal over time 630nm MS')

%% Reading in BGS files 670nm:
folder = fileparts(which(mfilename)); 
addpath(genpath(folder));

MM2_BGS_1 = [];
MM2_BGS_2 = [];
MM2_BGS_3 = [];
MM2_BGS_4 = [];
MM2_BGS_5 = [];

for i = 2:1:6
    MM2_BGS_2 = [MM2_BGS_2, xlsread('NL_1014uur_MS_BGS_meting2.xlsx', i, 'B2:B2001')];
    MM2_BGS_3 = [MM2_BGS_3, xlsread('NL_1138uur_MS_BGS_meting3.xlsx', i, 'B2:B2001')];
    MM2_BGS_4 = [MM2_BGS_4, xlsread('NL_1342uur_MS_BGS_meting4.xlsx', i, 'B2:B2001')];
    MM2_BGS_5 = [MM2_BGS_5, xlsread('NL_1535uur_MS_BGS_meting5.xlsx', i, 'B2:B2001')];
end

for j = 7:1:11
    MM2_BGS_1 = [MM2_BGS_1, xlsread('NL_8.50uur_Meting_1.xlsx', j, 'B2:B2001')];
end

%% calculating mean of maximum
max_MM2_BGS_1 = -(mean(MM2_BGS_1(2,:)));
max_MM2_BGS_2 = -(mean(MM2_BGS_2(2,:)));
max_MM2_BGS_3 = -(mean(MM2_BGS_3(2,:)));
max_MM2_BGS_4 = -(mean(MM2_BGS_4(2,:)));
max_MM2_BGS_5 = -(mean(MM2_BGS_5(2,:)));

Max_MM_BGS_total2 = [max_MM2_BGS_1 max_MM2_BGS_2 max_MM2_BGS_3 max_MM2_BGS_4 max_MM2_BGS_5];
time_background = [0 1.5 3 5 7];

figure(2)
plot(time_background, Max_MM_BGS_total2)
xlabel('time passed (hours)')
ylabel('amplitude')
xlim([0 7])
title('Amplitude of background signal over time 670nm MS')

%% COMBINATIE PLOT
figure(3)
plot(time_background, Max_MM_BGS_total, time_background, Max_MM_BGS_total2)
xlim([0 7])
legend('630nm', '670nm')
ylabel('amplitude')
xlabel('time passed(hours)')
title('Amplitude of background signal over time MS')