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
%%
    % ons protocol
[~, MM_Pleister5_3uur] = xlsread('measurements_27-01-2022_09_46_28.xlsx');
[~, MM_Pleister6_4uur] = xlsread('measurements_27-01-2022_10_42_21.xlsx'); 
[~, MM_Pleister7_5uur] = xlsread('measurements_27-01-2022_11_45_50.xlsx'); 
[~, MM_Pleister8_6uur] = xlsread('measurements_27-01-2022_12_37_24.xlsx'); 
[~, MM_Pleister9_7uur] = xlsread('measurements_27-01-2022_13_45_35.xlsx'); 
[~, MM_Pleister10_8uur] = xlsread('measurements_27-01-2022_14_39_40.xlsx'); 
[~, MM_Pleister11_9uur] = xlsread('measurements_27-01-2022_15_38_21.xlsx'); 
[~, MM_Pleister12_10uur] = xlsread('measurements_27-01-2022_16_37_00.xlsx'); 
[~, MM_Pleister1_11uur] = xlsread('measurements_27-01-2022_08_41_15.xlsx'); 
[~, MM_Pleister2_12uur] = xlsread('measurements_27-01-2022_09_41_01.xlsx'); 
[~, MM_Pleister3_13uur] = xlsread('measurements_27-01-2022_10_38_08.xlsx'); 
[~, MM_Pleister4_14uur] = xlsread('measurements_27-01-2022_11_41_02.xlsx'); 

    % extra ?
[~, MM_BGS_Pleister_1] = xlsread('measurements_27-01-2022_08_43_17.xlsx'); 
[~, MM_BGS_Pleister_2_5] = xlsread('measurements_27-01-2022_10_12_52.xlsx'); 
[~, MM_BGS_Pleister_4_7] = xlsread('measurements_27-01-2022_11_33_54.xlsx'); 
[~, MM_BGS_Pleister_9] = xlsread('measurements_27-01-2022_13_38_26.xlsx'); 
[~, MM_BGS_Pleister_11] = xlsread('measurements_27-01-2022_15_32_22.xlsx');

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

mean_MM_BGS_Pleister_1 = mean(MM_BGS_Pleister_1(48:end, :), 2);
mean_MM_BGS_Pleister_2_5 = mean(MM_BGS_Pleister_2_5(48:end, :), 2);
mean_MM_BGS_Pleister_4_7 = mean(MM_BGS_Pleister_4_7(48:end, :), 2);
mean_MM_BGS_Pleister_9 = mean(MM_BGS_Pleister_9(48:end, :), 2);
mean_MM_BGS_Pleister_11 = mean(MM_BGS_Pleister_11(48:end, :), 2);

% defining amount of samples
samples = [1:1:length(MM_Pleister1_11uur(48:end, :))];

%% Vergelijking gemiddelde BGS metingen over tijd MM

figure(1)
plot(samples, mean_MM_BGS_Pleister_1, samples, mean_MM_BGS_Pleister_2_5, samples, mean_MM_BGS_Pleister_4_7, samples, mean_MM_BGS_Pleister_9, samples, mean_MM_BGS_Pleister_11)
legend('1st BG measurement','2nd BG measurement', '3rd BG measurement', '4th BG measurement', '5th BG measurement')
title('raw data of background measurements at different times')

%% Vergelijking per BGS meting MM

% figure(2)
% plot(samples, MM_Pleister5_3uur(49:end,1), samples, mean_MM_BGS_Pleister_2_5)
% legend('ALA PL5', 'BGS')
% title('comparison ALA-sticker after 3 hour application vs. background')
% 
% figure(3)
% plot(samples, MM_Pleister7_5uur(49:end,1), samples, mean_MM_BGS_Pleister_4_7)
% legend('ALA PL7', 'BGS')
% title('comparison ALA-sticker after 5 hour application vs. background')
% 
% figure(4)
% plot(samples, MM_Pleister9_7uur(49:end,1), samples, mean_MM_BGS_Pleister_9)
% legend('ALA PL9', 'BGS')
% title('comparison ALA-sticker after 7 hour application vs. background')
% 
% figure(5)
% plot(samples, MM_Pleister11_9uur(49:end,1), samples, mean_MM_BGS_Pleister_11)
% legend('ALA PL11', 'BGS')
% title('comparison ALA-sticker after 9 hour application vs. background')
% 
% figure(6)
% plot(samples, MM_Pleister1_11uur(49:end,1), samples, mean_MM_BGS_Pleister_1)
% legend('ALA PL1', 'BGS')
% title('comparison ALA-sticker after 11 hour application vs. background')
% 
% figure(7)
% plot(samples, MM_Pleister2_12uur(49:end,1), samples, mean_MM_BGS_Pleister_2_5)
% legend('ALA PL2', 'BGS')
% title('comparison ALA-sticker after 12 hour application vs. background')
% 
% figure(8)
% plot(samples, MM_Pleister4_14uur(49:end,1), samples, mean_MM_BGS_Pleister_4_7)
% legend('ALA PL4', 'BGS')
% title('comparison ALA-sticker after 14 hour application vs. background')

% determining median mitoPO2
max_MM_Pleister5_3uur = median(MM_Pleister5_3uur(48,:));
max_MM_Pleister6_4uur = median(MM_Pleister6_4uur(48,:));
max_MM_Pleister7_5uur = median(MM_Pleister7_5uur(48,:));
max_MM_Pleister8_6uur = median(MM_Pleister8_6uur(48,:));
max_MM_Pleister9_7uur = median(MM_Pleister9_7uur(48,:));
max_MM_Pleister10_8uur = median(MM_Pleister10_8uur(48,:));
max_MM_Pleister11_9uur = median(MM_Pleister11_9uur(48,:));
max_MM_Pleister12_10uur = median(MM_Pleister12_10uur(48,:));
max_MM_Pleister1_11uur = median(MM_Pleister1_11uur(48,:));
max_MM_Pleister2_12uur = median(MM_Pleister2_12uur(48,:));
max_MM_Pleister3_13uur = median(MM_Pleister3_13uur(48,:));
max_MM_Pleister4_14uur = median(MM_Pleister4_14uur(48,:));

% mean background signals between measurements
mean_MM_BGS_Pleister_3_6 = mean([mean_MM_BGS_Pleister_2_5(1) mean_MM_BGS_Pleister_4_7(1)]);
mean_MM_BGS_Pleister_8 = mean([mean_MM_BGS_Pleister_4_7(1) mean_MM_BGS_Pleister_9(1)]);
mean_MM_BGS_Pleister_10 = mean([mean_MM_BGS_Pleister_9(1) mean_MM_BGS_Pleister_11(1)]);

%making vectors
total_ALA_MM = [max_MM_Pleister5_3uur max_MM_Pleister6_4uur max_MM_Pleister7_5uur max_MM_Pleister8_6uur max_MM_Pleister9_7uur max_MM_Pleister10_8uur max_MM_Pleister11_9uur max_MM_Pleister12_10uur max_MM_Pleister1_11uur max_MM_Pleister2_12uur max_MM_Pleister3_13uur max_MM_Pleister4_14uur];
total_BGS_MM = [mean_MM_BGS_Pleister_2_5(1) mean_MM_BGS_Pleister_3_6 mean_MM_BGS_Pleister_4_7(1) mean_MM_BGS_Pleister_8 mean_MM_BGS_Pleister_9(1) mean_MM_BGS_Pleister_10 mean_MM_BGS_Pleister_11(1) mean_MM_BGS_Pleister_11(1) mean_MM_BGS_Pleister_1(1) mean_MM_BGS_Pleister_2_5(1) mean_MM_BGS_Pleister_3_6 mean_MM_BGS_Pleister_4_7(1)];

%% Barchart met verschil amplitude BGS en ALA afhankelijk van hoelang erop geplakt. MM
X = categorical({'3 uur'; '4 uur*'; '5 uur'; '6 uur*'; '7 uur'; '8 uur*'; '9 uur'; '10 uur*'; '11 uur'; '12 uur'; '13 uur*'; '14 uur'});
X = reordercats(X,{'3 uur'; '4 uur*'; '5 uur'; '6 uur*'; '7 uur'; '8 uur*'; '9 uur'; '10 uur*'; '11 uur'; '12 uur'; '13 uur*'; '14 uur'});

figure(2)
b = bar(X, [total_ALA_MM' total_BGS_MM'], 0.8)
ylim([0 50000])
ylabel('amplitude')
xlabel('time after ALA application (re-applied)')
legend('measured ALA signal', 'measured BG signal')
title('Maximum amplitude ALA vs. BG measurements MM')


%% Reading in files MS: %% namen niet veranderd want veel werk
folder = fileparts(which(mfilename)); 
addpath(genpath(folder));

[~, MS_Pleister5_3uur] = xlsread('measurements_27-01-2022_09_57_14.xlsx'); 
[~, MS_Pleister6_4uur] = xlsread('measurements_27-01-2022_10_50_43.xlsx'); 
[~, MS_Pleister7_5uur] = xlsread('measurements_27-01-2022_11_52_52.xlsx'); 
[~, MS_Pleister8_6uur] = xlsread('measurements_27-01-2022_12_43_58.xlsx'); 
[~, MS_Pleister9_7uur] = xlsread('measurements_27-01-2022_13_51_11.xlsx'); 
[~, MS_Pleister10_8uur] = xlsread('measurements_27-01-2022_14_48_03.xlsx'); 
[~, MS_Pleister11_9uur] = xlsread('measurements_27-01-2022_15_42_49.xlsx'); 
[~, MS_Pleister12_10uur] = xlsread('measurements_27-01-2022_16_49_00.xlsx'); 
[~, MS_Pleister1_11uur] = xlsread('measurements_27-01-2022_08_51_42.xlsx'); 
[~, MS_Pleister2_12uur] = xlsread('measurements_27-01-2022_09_52_31.xlsx'); 
[~, MS_Pleister3_13uur] = xlsread('measurements_27-01-2022_10_47_13.xlsx'); 
[~, MS_Pleister4_14uur] = xlsread('measurements_27-01-2022_11_49_27.xlsx');  

[~, MS_BGS_Pleister_1] = xlsread('measurements_27-01-2022_08_53_42.xlsx'); 
[~, MS_BGS_Pleister_2_5] = xlsread('measurements_27-01-2022_10_14_55.xlsx'); 
[~, MS_BGS_Pleister_4_7] = xlsread('measurements_27-01-2022_11_38_21.xlsx'); 
[~, MS_BGS_Pleister_9] = xlsread('measurements_27-01-2022_13_42_53.xlsx'); 
[~, MS_BGS_Pleister_11] = xlsread('measurements_27-01-2022_15_35_45.xlsx');

Parameters = MS_Pleister1_11uur(:,1);

%% Voorbewerking MS
MS_Pleister5_3uur = cellfun(@str2num, MS_Pleister5_3uur(7:end,2:end));
MS_Pleister6_4uur = cellfun(@str2num, MS_Pleister6_4uur(7:end,2:end));
MS_Pleister7_5uur = cellfun(@str2num, MS_Pleister7_5uur(7:end,2:end));
MS_Pleister8_6uur = cellfun(@str2num, MS_Pleister8_6uur(7:end,2:end));
MS_Pleister9_7uur = cellfun(@str2num, MS_Pleister9_7uur(7:end,2:end));
MS_Pleister10_8uur = cellfun(@str2num, MS_Pleister10_8uur(7:end,2:end));
MS_Pleister11_9uur = cellfun(@str2num, MS_Pleister11_9uur(7:end,2:end));
MS_Pleister12_10uur = cellfun(@str2num, MS_Pleister12_10uur(7:end,2:end));
MS_Pleister1_11uur = cellfun(@str2num, MS_Pleister1_11uur(7:end,2:end));
MS_Pleister2_12uur = cellfun(@str2num, MS_Pleister2_12uur(7:end,2:end));
MS_Pleister3_13uur = cellfun(@str2num, MS_Pleister3_13uur(7:end,2:end));
MS_Pleister4_14uur = cellfun(@str2num, MS_Pleister4_14uur(7:end,2:end));

MS_BGS_Pleister_1 = cellfun(@str2num, MS_BGS_Pleister_1(7:end, 2:end));
MS_BGS_Pleister_2_5 = cellfun(@str2num, MS_BGS_Pleister_2_5(7:end, 2:end));
MS_BGS_Pleister_4_7 = cellfun(@str2num, MS_BGS_Pleister_4_7(7:end, 2:end));
MS_BGS_Pleister_9 = cellfun(@str2num, MS_BGS_Pleister_9(7:end, 2:end));
MS_BGS_Pleister_11 = cellfun(@str2num, MS_BGS_Pleister_11(7:end, 2:end));

<<<<<<< HEAD
mean_MS_BGS_Pleister_1 = mean(MS_BGS_Pleister_1(49:end, :), 2);
mean_MS_BGS_Pleister_2_5 = mean(MS_BGS_Pleister_2_5(49:end, :), 2);
mean_MS_BGS_Pleister_4_7 = mean(MS_BGS_Pleister_4_7(49:end, :), 2);
mean_MS_BGS_Pleister_9 = mean(MS_BGS_Pleister_9(49:end, :), 2);
mean_MS_BGS_Pleister_11 = mean(MS_BGS_Pleister_11(49:end, :), 2);

% defining amount of samples
samples = [1:1:length(MS_Pleister1_11uur(49:end, :))];
=======
mean_MM_BGS_Pleister_1 = mean(MM_BGS_Pleister_1(48:end, :), 2);
mean_MM_BGS_Pleister_2_5 = mean(MM_BGS_Pleister_2_5(48:end, :), 2);
mean_MM_BGS_Pleister_4_7 = mean(MM_BGS_Pleister_4_7(48:end, :), 2);
mean_MM_BGS_Pleister_9 = mean(MM_BGS_Pleister_9(48:end, :), 2);
mean_MM_BGS_Pleister_11 = mean(MM_BGS_Pleister_11(48:end, :), 2);

% defining amount of samples
samples = [1:1:length(MM_Pleister1_11uur(48:end, :))];
>>>>>>> ce21d1bfa125c6cd9f8a95d03c96ae3939a2a469


%% Vergelijking per BGS meting MS

% figure(10)
% plot(samples, MS_Pleister5_3uur(49:end,1), samples, mean_MS_BGS_Pleister_2_5)
% legend('ALA PL5', 'BGS')
% title('comparison ALA-sticker after 3 hour application vs. background')
% 
% figure(11)
% plot(samples, MS_Pleister7_5uur(49:end,1), samples, mean_MS_BGS_Pleister_4_7)
% legend('ALA PL7', 'BGS')
% title('comparison ALA-sticker after 5 hour application vs. background')
% 
% figure(12)
% plot(samples, MS_Pleister9_7uur(49:end,1), samples, mean_MS_BGS_Pleister_9)
% legend('ALA PL9', 'BGS')
% title('comparison ALA-sticker after 7 hour application vs. background')
% 
% figure(13)
% plot(samples, MS_Pleister11_9uur(49:end,1), samples, mean_MS_BGS_Pleister_11)
% legend('ALA PL11', 'BGS')
% title('comparison ALA-sticker after 9 hour application vs. background')
% 
% figure(14)
% plot(samples, MS_Pleister1_11uur(49:end,1), samples, mean_MS_BGS_Pleister_1)
% legend('ALA PL1', 'BGS')
% title('comparison ALA-sticker after 11 hour application vs. background')
% 
% figure(15)
% plot(samples, MS_Pleister2_12uur(49:end,1), samples, mean_MS_BGS_Pleister_2_5)
% legend('ALA PL2', 'BGS')
% title('comparison ALA-sticker after 12 hour application vs. background')
% 
% figure(16)
% plot(samples, MS_Pleister4_14uur(49:end,1), samples, mean_MS_BGS_Pleister_4_7)
% legend('ALA PL4', 'BGS')
% title('comparison ALA-sticker after 14 hour application vs. background')

% determining median mitoPO2
<<<<<<< HEAD
max_MS_Pleister5_3uur = median(MS_Pleister5_3uur(49,:));
max_MS_Pleister6_4uur = median(MS_Pleister6_4uur(49,:));
max_MS_Pleister7_5uur = median(MS_Pleister7_5uur(49,:));
max_MS_Pleister8_6uur = median(MS_Pleister8_6uur(49,:));
max_MS_Pleister9_7uur = median(MS_Pleister9_7uur(49,:));
max_MS_Pleister10_8uur = median(MS_Pleister10_8uur(49,:));
max_MS_Pleister11_9uur = median(MS_Pleister11_9uur(49,:));
max_MS_Pleister12_10uur = median(MS_Pleister12_10uur(49,:));
max_MS_Pleister1_11uur = median(MS_Pleister1_11uur(49,:));
max_MS_Pleister2_12uur = median(MS_Pleister2_12uur(49,:));
max_MS_Pleister3_13uur = median(MS_Pleister3_13uur(49,:));
max_MS_Pleister4_14uur = median(MS_Pleister4_14uur(49,:));
=======
max_MM_Pleister5_3uur = median(MM_Pleister5_3uur(48,:));
max_MM_Pleister6_4uur = median(MM_Pleister6_4uur(48,:));
max_MM_Pleister7_5uur = median(MM_Pleister7_5uur(48,:));
max_MM_Pleister8_6uur = median(MM_Pleister8_6uur(48,:));
max_MM_Pleister9_7uur = median(MM_Pleister9_7uur(48,:));
max_MM_Pleister10_8uur = median(MM_Pleister10_8uur(48,:));
max_MM_Pleister11_9uur = median(MM_Pleister11_9uur(48,:));
max_MM_Pleister12_10uur = median(MM_Pleister12_10uur(48,:));
max_MM_Pleister1_11uur = median(MM_Pleister1_11uur(48,:));
max_MM_Pleister2_12uur = median(MM_Pleister2_12uur(48,:));
max_MM_Pleister3_13uur = median(MM_Pleister3_13uur(48,:));
max_MM_Pleister4_14uur = median(MM_Pleister4_14uur(48,:));
>>>>>>> ce21d1bfa125c6cd9f8a95d03c96ae3939a2a469

% mean background signals between measurements
mean_MS_BGS_Pleister_3_6 = mean([mean_MS_BGS_Pleister_2_5(1) mean_MS_BGS_Pleister_4_7(1)]);
mean_MS_BGS_Pleister_8 = mean([mean_MS_BGS_Pleister_4_7(1) mean_MS_BGS_Pleister_9(1)]);
mean_MS_BGS_Pleister_10 = mean([mean_MS_BGS_Pleister_9(1) mean_MS_BGS_Pleister_11(1)]);

%making vectors
total_ALA_MS = [max_MS_Pleister5_3uur max_MS_Pleister6_4uur max_MS_Pleister7_5uur max_MS_Pleister8_6uur max_MS_Pleister9_7uur max_MS_Pleister10_8uur max_MS_Pleister11_9uur max_MS_Pleister12_10uur max_MS_Pleister1_11uur max_MS_Pleister2_12uur max_MS_Pleister3_13uur max_MS_Pleister4_14uur];
total_BGS_MS = [mean_MS_BGS_Pleister_2_5(1) mean_MS_BGS_Pleister_3_6 mean_MS_BGS_Pleister_4_7(1) mean_MS_BGS_Pleister_8 mean_MS_BGS_Pleister_9(1) mean_MS_BGS_Pleister_10 mean_MS_BGS_Pleister_11(1) mean_MS_BGS_Pleister_11(1) mean_MS_BGS_Pleister_1(1) mean_MS_BGS_Pleister_2_5(1) mean_MS_BGS_Pleister_3_6 mean_MS_BGS_Pleister_4_7(1)];

%% Barchart met verschil amplitude BGS en ALA afhankelijk van hoelang erop geplakt. MS --> GRATIS TIP: KOPIEER EN PLAK IN NIEUW BESTAND, ZOEK 'MM' REPLACE WITH 'MS'KLAAR :)
X = categorical({'3 uur'; '4 uur*'; '5 uur'; '6 uur*'; '7 uur'; '8 uur*'; '9 uur'; '10 uur*'; '11 uur'; '12 uur'; '13 uur*'; '14 uur'});
X = reordercats(X,{'3 uur'; '4 uur*'; '5 uur'; '6 uur*'; '7 uur'; '8 uur*'; '9 uur'; '10 uur*'; '11 uur'; '12 uur'; '13 uur*'; '14 uur'});

figure(3)
b = bar(X, [total_ALA_MS' total_BGS_MS'], 0.8)
ylim([0 50000])
ylabel('amplitude')
xlabel('time after ALA application (re-applied)')
legend('measured ALA signal', 'measured BG signal')
title('Maximum amplitude ALA vs. BG measurements MS')
