%% COMET background measurement ALA vs. background after different times of ALA application
clear all
close all
clc

% tijdstip BGS, welke pleisters 1e meting:
% 8:43 --> pleister 1
% 10:12 --> pleister 2 en 5 
% 11:33 --> pleister 4 en 7 (+ 2e meting 3 en 6)
% 13:38 --> pleister 9 (+ 2e meting 8)
% 15:32 --> pleister 11 (+ 2e meting 10)

%% Reading in files MM:
folder = fileparts(which(mfilename)); 
addpath(genpath(folder));

[~, MM_Pleister5_3uur] = xlsread('measurements_27-01-2022_09;46;28.xlsx'); 
[~, MM_Pleister6_4uur] = xlsread('measurements_27-01-2022_10;42;21.xlsx'); 
[~, MM_Pleister7_5uur] = xlsread('measurements_27-01-2022_11;45;50.xlsx'); 
[~, MM_Pleister8_6uur] = xlsread('measurements_27-01-2022_12;37;24.xlsx'); 
[~, MM_Pleister9_7uur] = xlsread('measurements_27-01-2022_13;45;35.xlsx'); 
[~, MM_Pleister10_8uur] = xlsread('measurements_27-01-2022_14;39;40.xlsx'); 
[~, MM_Pleister11_9uur] = xlsread('measurements_27-01-2022_15;38;21.xlsx'); 
[~, MM_Pleister12_10uur] = xlsread('measurements_27-01-2022_16;37;00.xlsx'); 
[~, MM_Pleister1_11uur] = xlsread('measurements_27-01-2022_08;41;15.xlsx'); 
[~, MM_Pleister2_12uur] = xlsread('measurements_27-01-2022_09;41;01.xlsx'); 
[~, MM_Pleister3_13uur] = xlsread('measurements_27-01-2022_10;38;08.xlsx'); 
[~, MM_Pleister4_14uur] = xlsread('measurements_27-01-2022_11;41;02.xlsx'); 


[~, MM_BGS_Pleister_1] = xlsread('measurements_27-01-2022_08;43;17.xlsx'); 
[~, MM_BGS_Pleister_2_5] = xlsread('measurements_27-01-2022_10;12;52.xlsx'); 
[~, MM_BGS_Pleister_4_7] = xlsread('measurements_27-01-2022_11;33;54.xlsx'); 
[~, MM_BGS_Pleister_9] = xlsread('measurements_27-01-2022_13;38;26.xlsx'); 
[~, MM_BGS_Pleister_11] = xlsread('measurements_27-01-2022_15;32;22.xlsx');

Parameters = MM_Pleister1_11uur(:,1);

%% Voorbewerking MM
MM_Pleister5_3uur = cellfun(@str2num, MM_Pleister5_3uur(7:end,2:end));
MM_Pleister6_4uur = cellfun(@str2num, MM_Pleister6_4uur(7:end,2:end));
MM_Pleister7_5uur = cellfun(@str2num, MM_Pleister7_5uur(7:end,2:end));
MM_Pleister8_6uur = cellfun(@str2num, MM_Pleister8_6uur(7:end,2:end));
MM_Pleister9_7uur = cellfun(@str2num, MM_Pleister9_7uur(7:end,2:end));
MM_Pleister10_8uur = cellfun(@str2num, MM_Pleister10_8uur(7:end,2:end));
MM_Pleister11_9uur = cellfun(@str2num, MM_Pleister11_9uur(7:end,2:end));
MM_Pleister12_10uur = cellfun(@str2num, MM_Pleister12_10uur(7:end,2:end));
MM_Pleister1_11uur = cellfun(@str2num, MM_Pleister1_11uur(7:end,2:end));
MM_Pleister2_12uur = cellfun(@str2num, MM_Pleister2_12uur(7:end,2:end));
MM_Pleister3_13uur = cellfun(@str2num, MM_Pleister3_13uur(7:end,2:end));
MM_Pleister4_14uur = cellfun(@str2num, MM_Pleister4_14uur(7:end,2:end));

MM_BGS_Pleister_1 = cellfun(@str2num, MM_BGS_Pleister_1(7:end, 2:end));
MM_BGS_Pleister_2_5 = cellfun(@str2num, MM_BGS_Pleister_2_5(7:end, 2:end));
MM_BGS_Pleister_4_7 = cellfun(@str2num, MM_BGS_Pleister_4_7(7:end, 2:end));
MM_BGS_Pleister_9 = cellfun(@str2num, MM_BGS_Pleister_9(7:end, 2:end));
MM_BGS_Pleister_11 = cellfun(@str2num, MM_BGS_Pleister_11(7:end, 2:end));

mean_MM_BGS_Pleister_1 = mean(MM_BGS_Pleister_1(49:end, :), 2);
mean_MM_BGS_Pleister_2_5 = mean(MM_BGS_Pleister_2_5(49:end, :), 2);
mean_MM_BGS_Pleister_4_7 = mean(MM_BGS_Pleister_4_7(49:end, :), 2);
mean_MM_BGS_Pleister_9 = mean(MM_BGS_Pleister_9(49:end, :), 2);
mean_MM_BGS_Pleister_11 = mean(MM_BGS_Pleister_11(49:end, :), 2);

% defining amount of samples
samples = [1:1:length(MM_Pleister1_11uur(49:end, :))];

%% Vergelijking gemiddelde BGS metingen over tijd MM

figure(1)
plot(samples, mean_MM_BGS_Pleister_1, samples, mean_MM_BGS_Pleister_2_5, samples, mean_MM_BGS_Pleister_4_7, samples, mean_MM_BGS_Pleister_9, samples, mean_MM_BGS_Pleister_11)
legend('1st BG measurement','2nd BG measurement', '3rd BG measurement', '4th BG measurement', '5th BG measurement')
title('raw data of background measurements at different times')

%% Vergelijking per BGS meting MM

figure(2)
plot(samples, MM_Pleister5_3uur(49:end,1), samples, mean_MM_BGS_Pleister_2_5)
legend('ALA PL5', 'BGS')
title('comparison ALA-sticker after 3 hour application vs. background')

figure(3)
plot(samples, MM_Pleister7_5uur(49:end,1), samples, mean_MM_BGS_Pleister_4_7)
legend('ALA PL7', 'BGS')
title('comparison ALA-sticker after 5 hour application vs. background')

figure(4)
plot(samples, MM_Pleister9_7uur(49:end,1), samples, mean_MM_BGS_Pleister_9)
legend('ALA PL9', 'BGS')
title('comparison ALA-sticker after 7 hour application vs. background')

figure(5)
plot(samples, MM_Pleister11_9uur(49:end,1), samples, mean_MM_BGS_Pleister_11)
legend('ALA PL11', 'BGS')
title('comparison ALA-sticker after 9 hour application vs. background')

figure(6)
plot(samples, MM_Pleister1_11uur(49:end,1), samples, mean_MM_BGS_Pleister_1)
legend('ALA PL1', 'BGS')
title('comparison ALA-sticker after 11 hour application vs. background')

figure(7)
plot(samples, MM_Pleister2_12uur(49:end,1), samples, mean_MM_BGS_Pleister_2_5)
legend('ALA PL2', 'BGS')
title('comparison ALA-sticker after 12 hour application vs. background')

figure(8)
plot(samples, MM_Pleister4_14uur(49:end,1), samples, mean_MM_BGS_Pleister_4_7)
legend('ALA PL4', 'BGS')
title('comparison ALA-sticker after 14 hour application vs. background')

mean_MM_BGS_Pleister_3_6 = mean([mean_MM_BGS_Pleister_2_5(1) mean_MM_BGS_Pleister_4_7(1)]);
mean_MM_BGS_Pleister_8 = mean([mean_MM_BGS_Pleister_4_7(1) mean_MM_BGS_Pleister_9(1)]);
mean_MM_BGS_Pleister_10 = mean([mean_MM_BGS_Pleister_9(1) mean_MM_BGS_Pleister_11(1)]);

total_ALA_MM = [MM_Pleister5_3uur(49,1) MM_Pleister6_4uur(49,1) MM_Pleister7_5uur(49,1) MM_Pleister8_6uur(49,1) MM_Pleister9_7uur(49,1) MM_Pleister10_8uur(49,1) MM_Pleister11_9uur(49,1) MM_Pleister12_10uur(49,1) MM_Pleister1_11uur(49,1) MM_Pleister2_12uur(49,1) MM_Pleister3_13uur(49,1) MM_Pleister4_14uur(49,1)];
total_BGS_MM = [mean_MM_BGS_Pleister_2_5(1) mean_MM_BGS_Pleister_3_6 mean_MM_BGS_Pleister_4_7(1) mean_MM_BGS_Pleister_8 mean_MM_BGS_Pleister_9(1) mean_MM_BGS_Pleister_10 mean_MM_BGS_Pleister_11(1) mean_MM_BGS_Pleister_11(1) mean_MM_BGS_Pleister_1(1) mean_MM_BGS_Pleister_2_5(1) mean_MM_BGS_Pleister_3_6 mean_MM_BGS_Pleister_4_7(1)];

%% Barchart met verschil amplitude BGS en ALA afhankelijk van hoelang erop geplakt. MM
X = categorical({'3 uur'; '4 uur*'; '5 uur'; '6 uur*'; '7 uur'; '8 uur*'; '9 uur'; '10 uur*'; '11 uur'; '12 uur'; '13 uur*'; '14 uur'});
X = reordercats(X,{'3 uur'; '4 uur*'; '5 uur'; '6 uur*'; '7 uur'; '8 uur*'; '9 uur'; '10 uur*'; '11 uur'; '12 uur'; '13 uur*'; '14 uur'});

figure(9)
b = bar(X, [total_ALA_MM' total_BGS_MM'], 0.8)
ylim([0 70000])
ylabel('amplitude')
xlabel('time after APA application (re-applied)')
legend('measured APA signal', 'measured BG signal')
title('Maximum amplitude APA vs. BG measurements MM')



%% Reading in files MS: %% namen niet veranderd want veel werk
folder = fileparts(which(mfilename)); 
addpath(genpath(folder));

[~, MM_Pleister5_3uur] = xlsread('measurements_27-01-2022_09;57;14.xlsx'); 
[~, MM_Pleister6_4uur] = xlsread('measurements_27-01-2022_10;50;43.xlsx'); 
[~, MM_Pleister7_5uur] = xlsread('measurements_27-01-2022_11;52;52.xlsx'); 
[~, MM_Pleister8_6uur] = xlsread('measurements_27-01-2022_12;43;58.xlsx'); 
[~, MM_Pleister9_7uur] = xlsread('measurements_27-01-2022_13;51;11.xlsx'); 
[~, MM_Pleister10_8uur] = xlsread('measurements_27-01-2022_14;48;03.xlsx'); 
[~, MM_Pleister11_9uur] = xlsread('measurements_27-01-2022_15;42;49.xlsx'); 
[~, MM_Pleister12_10uur] = xlsread('measurements_27-01-2022_16;49;00.xlsx'); 
[~, MM_Pleister1_11uur] = xlsread('measurements_27-01-2022_08;51;42.xlsx'); 
[~, MM_Pleister2_12uur] = xlsread('measurements_27-01-2022_09;52;31.xlsx'); 
[~, MM_Pleister3_13uur] = xlsread('measurements_27-01-2022_10;47;13.xlsx'); 
[~, MM_Pleister4_14uur] = xlsread('measurements_27-01-2022_11;49;27.xlsx');  

[~, MM_BGS_Pleister_1] = xlsread('measurements_27-01-2022_08;53;42.xlsx'); 
[~, MM_BGS_Pleister_2_5] = xlsread('measurements_27-01-2022_10;14;55.xlsx'); 
[~, MM_BGS_Pleister_4_7] = xlsread('measurements_27-01-2022_11;38;21.xlsx'); 
[~, MM_BGS_Pleister_9] = xlsread('measurements_27-01-2022_13;42;53.xlsx'); 
[~, MM_BGS_Pleister_11] = xlsread('measurements_27-01-2022_15;35;45.xlsx');

Parameters = MM_Pleister1_11uur(:,1);

%% Voorbewerking MS
MM_Pleister5_3uur = cellfun(@str2num, MM_Pleister5_3uur(7:end,2:end));
MM_Pleister6_4uur = cellfun(@str2num, MM_Pleister6_4uur(7:end,2:end));
MM_Pleister7_5uur = cellfun(@str2num, MM_Pleister7_5uur(7:end,2:end));
MM_Pleister8_6uur = cellfun(@str2num, MM_Pleister8_6uur(7:end,2:end));
MM_Pleister9_7uur = cellfun(@str2num, MM_Pleister9_7uur(7:end,2:end));
MM_Pleister10_8uur = cellfun(@str2num, MM_Pleister10_8uur(7:end,2:end));
MM_Pleister11_9uur = cellfun(@str2num, MM_Pleister11_9uur(7:end,2:end));
MM_Pleister12_10uur = cellfun(@str2num, MM_Pleister12_10uur(7:end,2:end));
MM_Pleister1_11uur = cellfun(@str2num, MM_Pleister1_11uur(7:end,2:end));
MM_Pleister2_12uur = cellfun(@str2num, MM_Pleister2_12uur(7:end,2:end));
MM_Pleister3_13uur = cellfun(@str2num, MM_Pleister3_13uur(7:end,2:end));
MM_Pleister4_14uur = cellfun(@str2num, MM_Pleister4_14uur(7:end,2:end));

MM_BGS_Pleister_1 = cellfun(@str2num, MM_BGS_Pleister_1(7:end, 2:end));
MM_BGS_Pleister_2_5 = cellfun(@str2num, MM_BGS_Pleister_2_5(7:end, 2:end));
MM_BGS_Pleister_4_7 = cellfun(@str2num, MM_BGS_Pleister_4_7(7:end, 2:end));
MM_BGS_Pleister_9 = cellfun(@str2num, MM_BGS_Pleister_9(7:end, 2:end));
MM_BGS_Pleister_11 = cellfun(@str2num, MM_BGS_Pleister_11(7:end, 2:end));

mean_MM_BGS_Pleister_1 = mean(MM_BGS_Pleister_1(49:end, :), 2);
mean_MM_BGS_Pleister_2_5 = mean(MM_BGS_Pleister_2_5(49:end, :), 2);
mean_MM_BGS_Pleister_4_7 = mean(MM_BGS_Pleister_4_7(49:end, :), 2);
mean_MM_BGS_Pleister_9 = mean(MM_BGS_Pleister_9(49:end, :), 2);
mean_MM_BGS_Pleister_11 = mean(MM_BGS_Pleister_11(49:end, :), 2);

% defining amount of samples
samples = [1:1:length(MM_Pleister1_11uur(49:end, :))];


%% Vergelijking per BGS meting MS

figure(10)
plot(samples, MM_Pleister5_3uur(49:end,1), samples, mean_MM_BGS_Pleister_2_5)
legend('ALA PL5', 'BGS')
title('comparison ALA-sticker after 3 hour application vs. background')

figure(11)
plot(samples, MM_Pleister7_5uur(49:end,1), samples, mean_MM_BGS_Pleister_4_7)
legend('ALA PL7', 'BGS')
title('comparison ALA-sticker after 5 hour application vs. background')

figure(12)
plot(samples, MM_Pleister9_7uur(49:end,1), samples, mean_MM_BGS_Pleister_9)
legend('ALA PL9', 'BGS')
title('comparison ALA-sticker after 7 hour application vs. background')

figure(13)
plot(samples, MM_Pleister11_9uur(49:end,1), samples, mean_MM_BGS_Pleister_11)
legend('ALA PL11', 'BGS')
title('comparison ALA-sticker after 9 hour application vs. background')

figure(14)
plot(samples, MM_Pleister1_11uur(49:end,1), samples, mean_MM_BGS_Pleister_1)
legend('ALA PL1', 'BGS')
title('comparison ALA-sticker after 11 hour application vs. background')

figure(15)
plot(samples, MM_Pleister2_12uur(49:end,1), samples, mean_MM_BGS_Pleister_2_5)
legend('ALA PL2', 'BGS')
title('comparison ALA-sticker after 12 hour application vs. background')

figure(16)
plot(samples, MM_Pleister4_14uur(49:end,1), samples, mean_MM_BGS_Pleister_4_7)
legend('ALA PL4', 'BGS')
title('comparison ALA-sticker after 14 hour application vs. background')

mean_MM_BGS_Pleister_3_6 = mean([mean_MM_BGS_Pleister_2_5(1) mean_MM_BGS_Pleister_4_7(1)]);
mean_MM_BGS_Pleister_8 = mean([mean_MM_BGS_Pleister_4_7(1) mean_MM_BGS_Pleister_9(1)]);
mean_MM_BGS_Pleister_10 = mean([mean_MM_BGS_Pleister_9(1) mean_MM_BGS_Pleister_11(1)]);

total_ALA_MM = [MM_Pleister5_3uur(49,1) MM_Pleister6_4uur(49,1) MM_Pleister7_5uur(49,1) MM_Pleister8_6uur(49,1) MM_Pleister9_7uur(49,1) MM_Pleister10_8uur(49,1) MM_Pleister11_9uur(49,1) MM_Pleister12_10uur(49,1) MM_Pleister1_11uur(49,1) MM_Pleister2_12uur(49,1) MM_Pleister3_13uur(49,1) MM_Pleister4_14uur(49,1)];
total_BGS_MM = [mean_MM_BGS_Pleister_2_5(1) mean_MM_BGS_Pleister_3_6 mean_MM_BGS_Pleister_4_7(1) mean_MM_BGS_Pleister_8 mean_MM_BGS_Pleister_9(1) mean_MM_BGS_Pleister_10 mean_MM_BGS_Pleister_11(1) mean_MM_BGS_Pleister_11(1) mean_MM_BGS_Pleister_1(1) mean_MM_BGS_Pleister_2_5(1) mean_MM_BGS_Pleister_3_6 mean_MM_BGS_Pleister_4_7(1)];

%% Barchart met verschil amplitude BGS en ALA afhankelijk van hoelang erop geplakt. MM
X = categorical({'3 uur'; '4 uur*'; '5 uur'; '6 uur*'; '7 uur'; '8 uur*'; '9 uur'; '10 uur*'; '11 uur'; '12 uur'; '13 uur*'; '14 uur'});
X = reordercats(X,{'3 uur'; '4 uur*'; '5 uur'; '6 uur*'; '7 uur'; '8 uur*'; '9 uur'; '10 uur*'; '11 uur'; '12 uur'; '13 uur*'; '14 uur'});

figure(17)
b = bar(X, [total_ALA_MM' total_BGS_MM'], 0.8)
ylim([0 70000])
ylabel('amplitude')
xlabel('time after APA application (re-applied)')
legend('measured APA signal', 'measured BG signal')
title('Maximum amplitude APA vs. BG measurements MS')

