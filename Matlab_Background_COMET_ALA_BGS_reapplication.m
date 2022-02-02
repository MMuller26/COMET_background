%% COMET ALA vs. BGS after re-application (multiple times)
clear all
close all
clc

% tijdstip BGS, welke pleisters 2e/3e/4e meting:
% BGS 10:41 -->
% 2e meting 2 en 5  (combi BGS 2 en 3)
% BGS 11:33 -->  2e meting 3 en 6
% 2e meting 4 en 7  (combi BGS 3 en 4)
% BGS 13:38 -->  2e meting 8 3e meting 3
% 2e meting 9 3e meting 4 (combi BGS 4 en 5)
% BGS 15:32 -->  2e meting 10 4e meting 3
% 2e meting 11 4e meting 4 (BGS meting 5)

%% Reading in files MM:
%1 x herplakt
[~, MM_Pleister5_4uur] = xlsread('measurements_27-01-2022_11;05;19.xlsx');
[~, MM_Pleister6_5uur] = xlsread('measurements_27-01-2022_12;06;26.xlsx');
[~, MM_Pleister7_6uur] = xlsread('measurements_27-01-2022_12;59;49.xlsx');
[~, MM_Pleister8_7uur] = xlsread('measurements_27-01-2022_14;07;02.xlsx');
[~, MM_Pleister9_8uur] = xlsread('measurements_27-01-2022_15;01;44.xlsx');
[~, MM_Pleister10_9uur] = xlsread('measurements_27-01-2022_15;56;15.xlsx');
[~, MM_Pleister11_10uur] = xlsread('measurements_27-01-2022_16;45;01.xlsx');

[~, MM_Pleister2_13uur] = xlsread('measurements_27-01-2022_11;01;40.xlsx');
[~, MM_Pleister3_14uur] = xlsread('measurements_27-01-2022_12;02;56.xlsx');
[~, MM_Pleister4_15uur] = xlsread('measurements_27-01-2022_12;55;02.xlsx');

%2x herplakt
[~, MM_Pleister3_16uur] = xlsread('measurements_27-01-2022_14;03;25.xlsx');
[~, MM_Pleister4_17uur] = xlsread('measurements_27-01-2022_14;57;12.xlsx');

%3x herplakt
[~, MM_Pleister3_18uur] = xlsread('measurements_27-01-2022_15;53;16.xlsx');
[~, MM_Pleister4_19uur] = xlsread('measurements_27-01-2022_16;41;00.xlsx');

Parameters = MM_Pleister5_4uur(:,1);

% Background
[~, MM_BGS_2] = xlsread('measurements_27-01-2022_10;12;52.xlsx'); 
[~, MM_BGS_3] = xlsread('measurements_27-01-2022_11;33;54.xlsx'); 
[~, MM_BGS_4] = xlsread('measurements_27-01-2022_13;38;26.xlsx'); 
[~, MM_BGS_5] = xlsread('measurements_27-01-2022_15;32;22.xlsx');

%% Voorbewerking MM
%2e meting (1x herplakt)
MM_Pleister5_4uur = cellfun(@str2num, MM_Pleister5_4uur(7:end,2:end));
MM_Pleister6_5uur = cellfun(@str2num, MM_Pleister6_5uur(7:end,2:end));
MM_Pleister7_6uur = cellfun(@str2num, MM_Pleister7_6uur(7:end,2:end));
MM_Pleister8_7uur = cellfun(@str2num, MM_Pleister8_7uur(7:end,2:end));
MM_Pleister9_8uur = cellfun(@str2num, MM_Pleister9_8uur(7:end,2:end));
MM_Pleister10_9uur = cellfun(@str2num, MM_Pleister10_9uur(7:end,2:end));
MM_Pleister11_10uur = cellfun(@str2num, MM_Pleister11_10uur(7:end,2:end));
MM_Pleister2_13uur = cellfun(@str2num, MM_Pleister2_13uur(7:end,2:end));
MM_Pleister3_14uur = cellfun(@str2num, MM_Pleister3_14uur(7:end,2:end));
MM_Pleister4_15uur = cellfun(@str2num, MM_Pleister4_15uur(7:end,2:end));

%3e meting (2x herplakt)
MM_Pleister3_16uur = cellfun(@str2num, MM_Pleister3_16uur(7:end,2:end));
MM_Pleister4_17uur = cellfun(@str2num, MM_Pleister4_17uur(7:end,2:end));

%4e meting (3x herplakt)
MM_Pleister3_18uur = cellfun(@str2num, MM_Pleister3_18uur(7:end,2:end));
MM_Pleister4_19uur = cellfun(@str2num, MM_Pleister4_19uur(7:end,2:end));

% Background
MM_BGS_2 = cellfun(@str2num, MM_BGS_2(7:end, 2:end));
MM_BGS_3 = cellfun(@str2num, MM_BGS_3(7:end, 2:end));
MM_BGS_4 = cellfun(@str2num, MM_BGS_4(7:end, 2:end));
MM_BGS_5 = cellfun(@str2num, MM_BGS_5(7:end, 2:end));


mean_MM_BGS_2 = mean(MM_BGS_2(49:end, :), 2);
mean_MM_BGS_3 = mean(MM_BGS_3(49:end, :), 2);
mean_MM_BGS_4 = mean(MM_BGS_4(49:end, :), 2);
mean_MM_BGS_5 = mean(MM_BGS_5(49:end, :), 2);

% defining amount of samples
samples = [1:1:length(MM_Pleister5_4uur(49:end, :))];

mean_MM_BGS_25 = mean([mean_MM_BGS_2(1) mean_MM_BGS_3(1)]);
mean_MM_BGS_35 = mean([mean_MM_BGS_3(1) mean_MM_BGS_4(1)]);
mean_MM_BGS_45 = mean([mean_MM_BGS_4(1) mean_MM_BGS_5(1)]);

%% Barchart met verschil amplitude BGS en ALA afhankelijk van hoelang erop geplakt (re-application only) MM

total_ALA_MM = [0 MM_Pleister5_4uur(49,1) MM_Pleister6_5uur(49,1) MM_Pleister7_6uur(49,1) MM_Pleister8_7uur(49,1) MM_Pleister9_8uur(49,1) MM_Pleister10_9uur(49,1) MM_Pleister11_10uur(49,1) 0 0 MM_Pleister2_13uur(49,1) MM_Pleister3_14uur(49,1)];
total_BGS_MM = [0 mean_MM_BGS_25 mean_MM_BGS_3(1) mean_MM_BGS_35 mean_MM_BGS_4(1) mean_MM_BGS_45 mean_MM_BGS_5(1) mean_MM_BGS_5(1) 0 0 mean_MM_BGS_25 mean_MM_BGS_3(1)];

X = categorical({'3 uur'; '4 uur*'; '5 uur'; '6 uur*'; '7 uur'; '8 uur*'; '9 uur'; '10 uur*'; '11 uur'; '12 uur'; '13 uur*'; '14 uur'});
X = reordercats(X,{'3 uur'; '4 uur*'; '5 uur'; '6 uur*'; '7 uur'; '8 uur*'; '9 uur'; '10 uur*'; '11 uur'; '12 uur'; '13 uur*'; '14 uur'});

figure(1)
b = bar(X, [total_ALA_MM' total_BGS_MM'], 0.8)
ylim([0 70000])
ylabel('amplitude')
xlabel('time after APA application (re-applied)')
legend('measured APA signal', 'measured BG signal')
title('Maximum amplitude APA vs. BG measurements re-applied only MM')

%% Reading in files MS % naam niet veranderd om tijd te besparen

[~, MM_Pleister5_4uur] = xlsread('measurements_27-01-2022_11;12;18.xlsx');
[~, MM_Pleister6_5uur] = xlsread('measurements_27-01-2022_12;13;05.xlsx');
[~, MM_Pleister7_6uur] = xlsread('measurements_27-01-2022_13;06;42.xlsx');
[~, MM_Pleister8_7uur] = xlsread('measurements_27-01-2022_14;13;55.xlsx');
[~, MM_Pleister9_8uur] = xlsread('measurements_27-01-2022_15;10;39.xlsx');
[~, MM_Pleister10_9uur] = xlsread('measurements_27-01-2022_16;03;01.xlsx');
[~, MM_Pleister11_10uur] = xlsread('measurements_27-01-2022_16;55;11.xlsx');

[~, MM_Pleister2_13uur] = xlsread('measurements_27-01-2022_11;08;59.xlsx');
[~, MM_Pleister3_14uur] = xlsread('measurements_27-01-2022_12;09;35.xlsx');
[~, MM_Pleister4_15uur] = xlsread('measurements_27-01-2022_13;03;18.xlsx');

%2x herplakt
[~, MM_Pleister3_16uur] = xlsread('measurements_27-01-2022_14;10;07.xlsx');
[~, MM_Pleister4_17uur] = xlsread('measurements_27-01-2022_15;07;30.xlsx');

%3x herplakt
[~, MM_Pleister3_18uur] = xlsread('measurements_27-01-2022_15;59;08.xlsx');
[~, MM_Pleister4_19uur] = xlsread('measurements_27-01-2022_16;52;26.xlsx');

Parameters = MM_Pleister5_4uur(:,1);

% Background
[~, MM_BGS_2] = xlsread('measurements_27-01-2022_10;12;52.xlsx'); 
[~, MM_BGS_3] = xlsread('measurements_27-01-2022_11;33;54.xlsx'); 
[~, MM_BGS_4] = xlsread('measurements_27-01-2022_13;38;26.xlsx'); 
[~, MM_BGS_5] = xlsread('measurements_27-01-2022_15;32;22.xlsx');

%% Voorbewerking MS
%2e meting (1x herplakt)
MM_Pleister5_4uur = cellfun(@str2num, MM_Pleister5_4uur(7:end,2:end));
MM_Pleister6_5uur = cellfun(@str2num, MM_Pleister6_5uur(7:end,2:end));
MM_Pleister7_6uur = cellfun(@str2num, MM_Pleister7_6uur(7:end,2:end));
MM_Pleister8_7uur = cellfun(@str2num, MM_Pleister8_7uur(7:end,2:end));
MM_Pleister9_8uur = cellfun(@str2num, MM_Pleister9_8uur(7:end,2:end));
MM_Pleister10_9uur = cellfun(@str2num, MM_Pleister10_9uur(7:end,2:end));
MM_Pleister11_10uur = cellfun(@str2num, MM_Pleister11_10uur(7:end,2:end));
MM_Pleister2_13uur = cellfun(@str2num, MM_Pleister2_13uur(7:end,2:end));
MM_Pleister3_14uur = cellfun(@str2num, MM_Pleister3_14uur(7:end,2:end));
MM_Pleister4_15uur = cellfun(@str2num, MM_Pleister4_15uur(7:end,2:end));

%3e meting (2x herplakt)
MM_Pleister3_16uur = cellfun(@str2num, MM_Pleister3_16uur(7:end,2:end));
MM_Pleister4_17uur = cellfun(@str2num, MM_Pleister4_17uur(7:end,2:end));

%4e meting (3x herplakt)
MM_Pleister3_18uur = cellfun(@str2num, MM_Pleister3_18uur(7:end,2:end));
MM_Pleister4_19uur = cellfun(@str2num, MM_Pleister4_19uur(7:end,2:end));

% Background
MM_BGS_2 = cellfun(@str2num, MM_BGS_2(7:end, 2:end));
MM_BGS_3 = cellfun(@str2num, MM_BGS_3(7:end, 2:end));
MM_BGS_4 = cellfun(@str2num, MM_BGS_4(7:end, 2:end));
MM_BGS_5 = cellfun(@str2num, MM_BGS_5(7:end, 2:end));


mean_MM_BGS_2 = mean(MM_BGS_2(49:end, :), 2);
mean_MM_BGS_3 = mean(MM_BGS_3(49:end, :), 2);
mean_MM_BGS_4 = mean(MM_BGS_4(49:end, :), 2);
mean_MM_BGS_5 = mean(MM_BGS_5(49:end, :), 2);

% defining amount of samples
samples = [1:1:length(MM_Pleister5_4uur(49:end, :))];

mean_MM_BGS_25 = mean([mean_MM_BGS_2(1) mean_MM_BGS_3(1)]);
mean_MM_BGS_35 = mean([mean_MM_BGS_3(1) mean_MM_BGS_4(1)]);
mean_MM_BGS_45 = mean([mean_MM_BGS_4(1) mean_MM_BGS_5(1)]);

%% Barchart met verschil amplitude BGS en ALA afhankelijk van hoelang erop geplakt (re-application only) MS

total_ALA_MM = [0 MM_Pleister5_4uur(49,1) MM_Pleister6_5uur(49,1) MM_Pleister7_6uur(49,1) MM_Pleister8_7uur(49,1) MM_Pleister9_8uur(49,1) MM_Pleister10_9uur(49,1) MM_Pleister11_10uur(49,1) 0 0 MM_Pleister2_13uur(49,1) MM_Pleister3_14uur(49,1)];
total_BGS_MM = [0 mean_MM_BGS_25 mean_MM_BGS_3(1) mean_MM_BGS_35 mean_MM_BGS_4(1) mean_MM_BGS_45 mean_MM_BGS_5(1) mean_MM_BGS_5(1) 0 0 mean_MM_BGS_25 mean_MM_BGS_3(1)];

X = categorical({'3 uur'; '4 uur*'; '5 uur'; '6 uur*'; '7 uur'; '8 uur*'; '9 uur'; '10 uur*'; '11 uur'; '12 uur'; '13 uur*'; '14 uur'});
X = reordercats(X,{'3 uur'; '4 uur*'; '5 uur'; '6 uur*'; '7 uur'; '8 uur*'; '9 uur'; '10 uur*'; '11 uur'; '12 uur'; '13 uur*'; '14 uur'});

figure(2)
b = bar(X, [total_ALA_MM' total_BGS_MM'], 0.8)
ylim([0 70000])
ylabel('amplitude')
xlabel('time after APA application (re-applied)')
legend('measured APA signal', 'measured BG signal')
title('Maximum amplitude APA vs. BG measurements re-applied only MS')

