%% COMBINATIE REAPPLICATION EN FIRST MEASUREMENT
clear all
close all
clc

%% Color of each sticker
colorSticker1 = 'b';
colorSticker2 = 'r';
colorSticker3 = 'y';
colorSticker4 = 'c';
colorSticker5 = 'm';
colorSticker6 = 'g';
colorSticker7 = 'k'; 
colorSticker8 = [0.50 0.65 0.15]; 
colorSticker9 = '#EDB120';
colorSticker10 = [0 0.5 1]; 
colorSticker11 = '#A2142F'; %[ 0.5 0 1];
colorSticker12 = [0.7 0.7 0.7];

%% Reading in files MM:
folder = fileparts(which(mfilename)); 
addpath(genpath(folder));

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

Parameters = MM_Pleister1_11uur(:,1);

%% determining median mitoPO2
MM_Pleister5_3uur = median(cellfun(@str2num, MM_Pleister5_3uur(7,2:6)));
MM_Pleister6_4uur = median(cellfun(@str2num, MM_Pleister6_4uur(7,2:6)));
MM_Pleister7_5uur = median(cellfun(@str2num, MM_Pleister7_5uur(7,2:6)));
MM_Pleister8_6uur = median(cellfun(@str2num, MM_Pleister8_6uur(7,2:6)));
MM_Pleister9_7uur = median(cellfun(@str2num, MM_Pleister9_7uur(7,2:6)));
MM_Pleister10_8uur = median(cellfun(@str2num, MM_Pleister10_8uur(7,2:6)));
MM_Pleister11_9uur = median(cellfun(@str2num, MM_Pleister11_9uur(7,2:6)));
MM_Pleister12_10uur = median(cellfun(@str2num, MM_Pleister12_10uur(7,2:6)));
MM_Pleister1_11uur = median(cellfun(@str2num, MM_Pleister1_11uur(7,2:6)));
MM_Pleister2_12uur = median(cellfun(@str2num, MM_Pleister2_12uur(7,2:6)));
MM_Pleister3_13uur = median(cellfun(@str2num, MM_Pleister3_13uur(7,2:6)));
MM_Pleister4_14uur = median(cellfun(@str2num, MM_Pleister4_14uur(7,2:6)));

%% Plotting mitoPO2 and lifetime for increasing time after application of ALA
PO2_MM_Pleister = [MM_Pleister5_3uur MM_Pleister6_4uur MM_Pleister7_5uur MM_Pleister8_6uur MM_Pleister9_7uur MM_Pleister10_8uur MM_Pleister11_9uur MM_Pleister12_10uur MM_Pleister1_11uur MM_Pleister2_12uur MM_Pleister3_13uur MM_Pleister4_14uur];
%PO2_MM_Pleister = cellfun(@str2num, PO2_MM_Pleister);
time_axis = [3 4 5 6 7 8 9 10 11 12 13 14];

% Oude grafiek
% figure(1)
% plot(time_axis, PO2_MM_Pleister, '-o')
% xlabel('time after ALA-sticker application (hours)')
% ylabel('mitoPO2')
% xlim([3 19])
% %ylim([60 160])
% title("mitoPo2 for different times of ALA application MM")

%Nieuwe grafiek
figure(11)
hold on
plot(time_axis, PO2_MM_Pleister,'k','LineStyle', '-','Marker', 'none')
plot(time_axis(1,1), PO2_MM_Pleister(1,1),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker1, 'MarkerEdgeColor',colorSticker1)
plot(time_axis(1,2), PO2_MM_Pleister(1,2),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker2, 'MarkerEdgeColor',colorSticker2) 
plot(time_axis(1,3), PO2_MM_Pleister(1,3),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker3,'MarkerEdgeColor',colorSticker3)
plot(time_axis(1,4), PO2_MM_Pleister(1,4),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker4,'MarkerEdgeColor',colorSticker4)
plot(time_axis(1,5), PO2_MM_Pleister(1,5),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker5, 'MarkerEdgeColor',colorSticker5)
plot(time_axis(1,6), PO2_MM_Pleister(1,6),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker6, 'MarkerEdgeColor',colorSticker6)
plot(time_axis(1,7), PO2_MM_Pleister(1,7),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker7, 'MarkerEdgeColor',colorSticker7)
plot(time_axis(1,8), PO2_MM_Pleister(1,8),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker8, 'MarkerEdgeColor',colorSticker8)
plot(time_axis(1,9), PO2_MM_Pleister(1,9),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker9, 'MarkerEdgeColor',colorSticker9)
plot(time_axis(1,10), PO2_MM_Pleister(1,10),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker10, 'MarkerEdgeColor',colorSticker10)
plot(time_axis(1,11), PO2_MM_Pleister(1,11),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker11, 'MarkerEdgeColor',colorSticker11)
plot(time_axis(1,12), PO2_MM_Pleister(1,12),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker12, 'MarkerEdgeColor',colorSticker12)
hold off
xlabel('time after ALA-sticker application (hours)')
ylabel('mitoPO2')
xlim([3 19])
%ylim([60 160])
title("mitoPo2 for different times of ALA application MM")

%% Reading in files MM:
%1 x herplakt
[~, MM_Pleister5_4uur] = xlsread('measurements_27-01-2022_11_05_19.xlsx');
[~, MM_Pleister6_5uur] = xlsread('measurements_27-01-2022_12_06_26.xlsx');
[~, MM_Pleister7_6uur] = xlsread('measurements_27-01-2022_12_59_49.xlsx');
[~, MM_Pleister8_7uur] = xlsread('measurements_27-01-2022_14_07_02.xlsx');
[~, MM_Pleister9_8uur] = xlsread('measurements_27-01-2022_15_01_44.xlsx');
[~, MM_Pleister10_9uur] = xlsread('measurements_27-01-2022_15_56_15.xlsx');
[~, MM_Pleister11_10uur] = xlsread('measurements_27-01-2022_16_45_01.xlsx');

[~, MM_Pleister2_13uur] = xlsread('measurements_27-01-2022_11_01_40.xlsx');
[~, MM_Pleister3_14uur] = xlsread('measurements_27-01-2022_12_02_56.xlsx');
[~, MM_Pleister4_15uur] = xlsread('measurements_27-01-2022_12_55_02.xlsx');

%2x herplakt
[~, MM_Pleister3_16uur] = xlsread('measurements_27-01-2022_14_03_25.xlsx');
[~, MM_Pleister4_17uur] = xlsread('measurements_27-01-2022_14_57_12.xlsx');

%3x herplakt
[~, MM_Pleister3_18uur] = xlsread('measurements_27-01-2022_15_53_16.xlsx');
[~, MM_Pleister4_19uur] = xlsread('measurements_27-01-2022_16_41_00.xlsx');

Parameters = MM_Pleister5_4uur(:,1);

%% determining median mitoPO2
MM_Pleister5_4uur = median(cellfun(@str2num, MM_Pleister5_4uur(7,2:6)));
MM_Pleister6_5uur = median(cellfun(@str2num, MM_Pleister6_5uur(7,2:6)));
MM_Pleister7_6uur = median(cellfun(@str2num, MM_Pleister7_6uur(7,2:6)));
MM_Pleister8_7uur = median(cellfun(@str2num, MM_Pleister8_7uur(7,2:6)));
MM_Pleister9_8uur = median(cellfun(@str2num, MM_Pleister9_8uur(7,2:6)));
MM_Pleister10_9uur = median(cellfun(@str2num, MM_Pleister10_9uur(7,2:6)));
MM_Pleister11_10uur = median(cellfun(@str2num, MM_Pleister11_10uur(7,2:6)));

MM_Pleister2_13uur = median(cellfun(@str2num, MM_Pleister2_13uur(7,2:6)));
MM_Pleister3_14uur = median(cellfun(@str2num, MM_Pleister3_14uur(7,2:6)));
MM_Pleister4_15uur = median(cellfun(@str2num, MM_Pleister4_15uur(7,2:6)));

MM_Pleister3_16uur = median(cellfun(@str2num, MM_Pleister3_16uur(7,2:6)));
MM_Pleister4_17uur = median(cellfun(@str2num, MM_Pleister4_17uur(7,2:6)));

MM_Pleister3_18uur = median(cellfun(@str2num, MM_Pleister3_18uur(7,2:6)));
MM_Pleister4_19uur = median(cellfun(@str2num, MM_Pleister4_19uur(7,2:6)));


%% Plotting mitoPO2 and lifetime for increasing time after application ALA all application times together
PO2_MM_Pleister_total = [MM_Pleister5_4uur MM_Pleister6_5uur MM_Pleister7_6uur MM_Pleister8_7uur MM_Pleister9_8uur MM_Pleister10_9uur MM_Pleister11_10uur  MM_Pleister2_13uur MM_Pleister3_14uur MM_Pleister4_15uur MM_Pleister3_16uur MM_Pleister4_17uur MM_Pleister3_18uur MM_Pleister4_19uur];
%PO2_MM_Pleister_total = cellfun(@str2num, PO2_MM_Pleister_total);
time_axis_total = [4 5 6 7 8 9 10 13 14 15 16 17 18 19];

figure(2)
plot(time_axis_total, PO2_MM_Pleister_total, '-o')
xlabel('total time after ALA-sticker application (hours)')
ylabel('mitoPO2')
xlim([3 19])
title("mitoPo2 for different times of ALA application (re-applications only) MM")

%Nieuwe grafiek
figure(22)
hold on
plot(time_axis_total, PO2_MM_Pleister_total,'k','LineStyle', '-','Marker', 'none')
plot(time_axis_total(1,1), PO2_MM_Pleister_total(1,1),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker5, 'MarkerEdgeColor',colorSticker5)
plot(time_axis_total(1,2), PO2_MM_Pleister_total(1,2),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker6, 'MarkerEdgeColor',colorSticker6) 
plot(time_axis_total(1,3), PO2_MM_Pleister_total(1,3),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker7,'MarkerEdgeColor',colorSticker7)
plot(time_axis_total(1,4), PO2_MM_Pleister_total(1,4),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker8,'MarkerEdgeColor',colorSticker8)
plot(time_axis_total(1,5), PO2_MM_Pleister_total(1,5),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker9, 'MarkerEdgeColor',colorSticker9)
plot(time_axis_total(1,6), PO2_MM_Pleister_total(1,6),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker10, 'MarkerEdgeColor',colorSticker10)
plot(time_axis_total(1,7), PO2_MM_Pleister_total(1,7),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker11, 'MarkerEdgeColor',colorSticker11)
plot(time_axis_total(1,8), PO2_MM_Pleister_total(1,8),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker2, 'MarkerEdgeColor',colorSticker2)
plot(time_axis_total(1,9), PO2_MM_Pleister_total(1,9),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker3, 'MarkerEdgeColor',colorSticker3)
plot(time_axis_total(1,10), PO2_MM_Pleister_total(1,10),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker4, 'MarkerEdgeColor',colorSticker4)
plot(time_axis_total(1,11), PO2_MM_Pleister_total(1,11),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker3, 'MarkerEdgeColor',colorSticker3)
plot(time_axis_total(1,12), PO2_MM_Pleister_total(1,12),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker4, 'MarkerEdgeColor',colorSticker4)
plot(time_axis_total(1,13), PO2_MM_Pleister_total(1,13),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker3, 'MarkerEdgeColor',colorSticker3)
plot(time_axis_total(1,14), PO2_MM_Pleister_total(1,14),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker4, 'MarkerEdgeColor',colorSticker4)
hold off
xlabel('total time after ALA-sticker application (hours)')
ylabel('mitoPO2')
xlim([3 19])
title("mitoPo2 for different times of ALA application (re-applications only) MM")

%% COMBINATIE
figure(3)
plot(time_axis, PO2_MM_Pleister, '-ob')
hold on
plot(time_axis_total, PO2_MM_Pleister_total, '--ob')
xlim([3 19])
ylim([20 160])
xlabel('total time after ALA-sticker application (hours)')
ylabel('mitoPO2')
legend('after 1st application', 'after re-application')
title("mitoPo2 for different times of ALA application MM")

figure(33)
hold on
%first removal
plot(time_axis, PO2_MM_Pleister,'k','LineStyle', '-','Marker', 'none')
plot(time_axis_total, PO2_MM_Pleister_total,'k','LineStyle', '--','Marker', 'none')

plot(time_axis(1,1), PO2_MM_Pleister(1,1),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker1, 'MarkerEdgeColor',colorSticker1)
plot(time_axis(1,2), PO2_MM_Pleister(1,2),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker2, 'MarkerEdgeColor',colorSticker2) 
plot(time_axis(1,3), PO2_MM_Pleister(1,3),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker3,'MarkerEdgeColor',colorSticker3)
plot(time_axis(1,4), PO2_MM_Pleister(1,4),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker4,'MarkerEdgeColor',colorSticker4)
plot(time_axis(1,5), PO2_MM_Pleister(1,5),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker5, 'MarkerEdgeColor',colorSticker5)
plot(time_axis(1,6), PO2_MM_Pleister(1,6),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker6, 'MarkerEdgeColor',colorSticker6)
plot(time_axis(1,7), PO2_MM_Pleister(1,7),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker7, 'MarkerEdgeColor',colorSticker7)
plot(time_axis(1,8), PO2_MM_Pleister(1,8),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker8, 'MarkerEdgeColor',colorSticker8)
plot(time_axis(1,9), PO2_MM_Pleister(1,9),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker9, 'MarkerEdgeColor',colorSticker9)
plot(time_axis(1,10), PO2_MM_Pleister(1,10),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker10, 'MarkerEdgeColor',colorSticker10)
plot(time_axis(1,11), PO2_MM_Pleister(1,11),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker11, 'MarkerEdgeColor',colorSticker11)
plot(time_axis(1,12), PO2_MM_Pleister(1,12),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker12, 'MarkerEdgeColor',colorSticker12)

%multiple removal after re-application
plot(time_axis_total(1,1), PO2_MM_Pleister_total(1,1),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker5, 'MarkerEdgeColor',colorSticker5)
plot(time_axis_total(1,2), PO2_MM_Pleister_total(1,2),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker6, 'MarkerEdgeColor',colorSticker6) 
plot(time_axis_total(1,3), PO2_MM_Pleister_total(1,3),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker7,'MarkerEdgeColor',colorSticker7)
plot(time_axis_total(1,4), PO2_MM_Pleister_total(1,4),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker8,'MarkerEdgeColor',colorSticker8)
plot(time_axis_total(1,5), PO2_MM_Pleister_total(1,5),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker9, 'MarkerEdgeColor',colorSticker9)
plot(time_axis_total(1,6), PO2_MM_Pleister_total(1,6),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker10, 'MarkerEdgeColor',colorSticker10)
plot(time_axis_total(1,7), PO2_MM_Pleister_total(1,7),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker11, 'MarkerEdgeColor',colorSticker11)
plot(time_axis_total(1,8), PO2_MM_Pleister_total(1,8),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker2, 'MarkerEdgeColor',colorSticker2)
plot(time_axis_total(1,9), PO2_MM_Pleister_total(1,9),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker3, 'MarkerEdgeColor',colorSticker3)
plot(time_axis_total(1,10), PO2_MM_Pleister_total(1,10),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker4, 'MarkerEdgeColor',colorSticker4)
plot(time_axis_total(1,11), PO2_MM_Pleister_total(1,11),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker3, 'MarkerEdgeColor',colorSticker3)
plot(time_axis_total(1,12), PO2_MM_Pleister_total(1,12),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker4, 'MarkerEdgeColor',colorSticker4)
plot(time_axis_total(1,13), PO2_MM_Pleister_total(1,13),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker3, 'MarkerEdgeColor',colorSticker3)
plot(time_axis_total(1,14), PO2_MM_Pleister_total(1,14),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker4, 'MarkerEdgeColor',colorSticker4)

hold off
xlim([3 19])
ylim([20 160])
xlabel('total time after ALA-sticker application (hours)')
ylabel('mitoPO2')
legend('after 1st application', 'after re-application', 'Sticker 1', 'Sticker 2', 'Sticker 3', 'Sticker 4', 'Sticker 5', 'Sticker 6', 'Sticker 7', 'Sticker 8', 'Sticker 9', 'Sticker 10', 'Sticker 11', 'Sticker 12')
title("mitoPo2 for different times of ALA application MM")

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Reading in files MS:%% Naam niet veranderd te veel tijd

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

Parameters = MS_Pleister1_11uur(:,1);

%% determining median mitoPO2
MS_Pleister5_3uur = median(cellfun(@str2num, MS_Pleister5_3uur(7,2:6)));
MS_Pleister6_4uur = median(cellfun(@str2num, MS_Pleister6_4uur(7,2:6)));
MS_Pleister7_5uur = median(cellfun(@str2num, MS_Pleister7_5uur(7,2:6)));
MS_Pleister8_6uur = median(cellfun(@str2num, MS_Pleister8_6uur(7,2:6)));
MS_Pleister9_7uur = median(cellfun(@str2num, MS_Pleister9_7uur(7,2:6)));
MS_Pleister10_8uur = median(cellfun(@str2num, MS_Pleister10_8uur(7,2:6)));
MS_Pleister11_9uur = median(cellfun(@str2num, MS_Pleister11_9uur(7,2:6)));
MS_Pleister12_10uur = median(cellfun(@str2num, MS_Pleister12_10uur(7,2:6)));
MS_Pleister1_11uur = median(cellfun(@str2num, MS_Pleister1_11uur(7,2:6)));
MS_Pleister2_12uur = median(cellfun(@str2num, MS_Pleister2_12uur(7,2:6)));
MS_Pleister3_13uur = median(cellfun(@str2num, MS_Pleister3_13uur(7,2:6)));
MS_Pleister4_14uur = median(cellfun(@str2num, MS_Pleister4_14uur(7,2:6)));

%% Plotting mitoPO2 and lifetime for increasing time after application of ALA MS
PO2_MS_Pleister = [MS_Pleister5_3uur MS_Pleister6_4uur MS_Pleister7_5uur MS_Pleister8_6uur MS_Pleister9_7uur MS_Pleister10_8uur MS_Pleister11_9uur MS_Pleister12_10uur MS_Pleister1_11uur MS_Pleister2_12uur MS_Pleister3_13uur MS_Pleister4_14uur];
%PO2_MS_Pleister = cellfun(@str2num, PO2_MS_Pleister);
time_axis = [3 4 5 6 7 8 9 10 11 12 13 14];

figure(4)
plot(time_axis, PO2_MS_Pleister, '-o')
xlabel('time after ALA-sticker application (hours)')
ylabel('mitoPO2')
xlim([3 19])
%ylim([60 160])
title("mitoPo2 for different times of ALA application MS")

%Nieuwe grafiek
figure(44)
hold on
plot(time_axis, PO2_MS_Pleister,'k','LineStyle', '-','Marker', 'none')
plot(time_axis(1,1), PO2_MS_Pleister(1,1),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker1, 'MarkerEdgeColor',colorSticker1)
plot(time_axis(1,2), PO2_MS_Pleister(1,2),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker2, 'MarkerEdgeColor',colorSticker2) 
plot(time_axis(1,3), PO2_MS_Pleister(1,3),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker3,'MarkerEdgeColor',colorSticker3)
plot(time_axis(1,4), PO2_MS_Pleister(1,4),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker4,'MarkerEdgeColor',colorSticker4)
plot(time_axis(1,5), PO2_MS_Pleister(1,5),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker5, 'MarkerEdgeColor',colorSticker5)
plot(time_axis(1,6), PO2_MS_Pleister(1,6),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker6, 'MarkerEdgeColor',colorSticker6)
plot(time_axis(1,7), PO2_MS_Pleister(1,7),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker7, 'MarkerEdgeColor',colorSticker7)
plot(time_axis(1,8), PO2_MS_Pleister(1,8),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker8, 'MarkerEdgeColor',colorSticker8)
plot(time_axis(1,9), PO2_MS_Pleister(1,9),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker9, 'MarkerEdgeColor',colorSticker9)
plot(time_axis(1,10), PO2_MS_Pleister(1,10),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker10, 'MarkerEdgeColor',colorSticker10)
plot(time_axis(1,11), PO2_MS_Pleister(1,11),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker11, 'MarkerEdgeColor',colorSticker11)
plot(time_axis(1,12), PO2_MS_Pleister(1,12),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker12, 'MarkerEdgeColor',colorSticker12)
hold off
xlabel('time after ALA-sticker application (hours)')
ylabel('mitoPO2')
xlim([3 19])
%ylim([60 160])
title("mitoPo2 for different times of ALA application MS")

%% Reading in files MS % name not changed to save time
%1 x herplakt
[~, MS_Pleister5_4uur] = xlsread('measurements_27-01-2022_11_12_18.xlsx');
[~, MS_Pleister6_5uur] = xlsread('measurements_27-01-2022_12_13_05.xlsx');
[~, MS_Pleister7_6uur] = xlsread('measurements_27-01-2022_13_06_42.xlsx');
[~, MS_Pleister8_7uur] = xlsread('measurements_27-01-2022_14_13_55.xlsx');
[~, MS_Pleister9_8uur] = xlsread('measurements_27-01-2022_15_10_39.xlsx');
[~, MS_Pleister10_9uur] = xlsread('measurements_27-01-2022_16_03_01.xlsx');
[~, MS_Pleister11_10uur] = xlsread('measurements_27-01-2022_16_55_11.xlsx');

[~, MS_Pleister2_13uur] = xlsread('measurements_27-01-2022_11_08_59.xlsx');
[~, MS_Pleister3_14uur] = xlsread('measurements_27-01-2022_12_09_35.xlsx');
[~, MS_Pleister4_15uur] = xlsread('measurements_27-01-2022_13_03_18.xlsx');

%2x herplakt
[~, MS_Pleister3_16uur] = xlsread('measurements_27-01-2022_14_10_07.xlsx');
[~, MS_Pleister4_17uur] = xlsread('measurements_27-01-2022_15_07_30.xlsx');

%3x herplakt
[~, MS_Pleister3_18uur] = xlsread('measurements_27-01-2022_15_59_08.xlsx');
[~, MS_Pleister4_19uur] = xlsread('measurements_27-01-2022_16_52_26.xlsx');

Parameters = MS_Pleister5_4uur(:,1);

%% determining median mitoPO2
MS_Pleister5_4uur = median(cellfun(@str2num, MS_Pleister5_4uur(7,2:6)));
MS_Pleister6_5uur = median(cellfun(@str2num, MS_Pleister6_5uur(7,2:6)));
MS_Pleister7_6uur = median(cellfun(@str2num, MS_Pleister7_6uur(7,2:6)));
MS_Pleister8_7uur = median(cellfun(@str2num, MS_Pleister8_7uur(7,2:6)));
MS_Pleister9_8uur = median(cellfun(@str2num, MS_Pleister9_8uur(7,2:6)));
MS_Pleister10_9uur = median(cellfun(@str2num, MS_Pleister10_9uur(7,2:6)));
MS_Pleister11_10uur = median(cellfun(@str2num, MS_Pleister11_10uur(7,2:6)));

MS_Pleister2_13uur = median(cellfun(@str2num, MS_Pleister2_13uur(7,2:6)));
MS_Pleister3_14uur = median(cellfun(@str2num, MS_Pleister3_14uur(7,2:6)));
MS_Pleister4_15uur = median(cellfun(@str2num, MS_Pleister4_15uur(7,2:6)));

MS_Pleister3_16uur = median(cellfun(@str2num, MS_Pleister3_16uur(7,2:6)));
MS_Pleister4_17uur = median(cellfun(@str2num, MS_Pleister4_17uur(7,2:6)));

MS_Pleister3_18uur = median(cellfun(@str2num, MS_Pleister3_18uur(7,2:6)));
MS_Pleister4_19uur = median(cellfun(@str2num, MS_Pleister4_19uur(7,2:6)));

%% Plotting mitoPO2 and lifetime for increasing time after application ALA all application times together
PO2_MS_Pleister_total = [MS_Pleister5_4uur MS_Pleister6_5uur MS_Pleister7_6uur MS_Pleister8_7uur MS_Pleister9_8uur MS_Pleister10_9uur MS_Pleister11_10uur  MS_Pleister2_13uur MS_Pleister3_14uur MS_Pleister4_15uur MS_Pleister3_16uur MS_Pleister4_17uur MS_Pleister3_18uur MS_Pleister4_19uur];
%PO2_MS_Pleister_total = cellfun(@str2num, PO2_MS_Pleister_total);
time_axis_total = [4 5 6 7 8 9 10 13 14 15 16 17 18 19];

figure(5)
plot(time_axis_total, PO2_MS_Pleister_total, '-o')
xlabel('total time after ALA-sticker application (hours)')
ylabel('mitoPO2')
xlim([3 19])
title("mitoPo2 for different times of ALA application (re-applications only) MS")

%Nieuwe grafiek
figure(55)
hold on
plot(time_axis_total, PO2_MS_Pleister_total,'k','LineStyle', '-','Marker', 'none')
plot(time_axis_total(1,1), PO2_MS_Pleister_total(1,1),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker5, 'MarkerEdgeColor',colorSticker5)
plot(time_axis_total(1,2), PO2_MS_Pleister_total(1,2),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker6, 'MarkerEdgeColor',colorSticker6) 
plot(time_axis_total(1,3), PO2_MS_Pleister_total(1,3),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker7,'MarkerEdgeColor',colorSticker7)
plot(time_axis_total(1,4), PO2_MS_Pleister_total(1,4),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker8,'MarkerEdgeColor',colorSticker8)
plot(time_axis_total(1,5), PO2_MS_Pleister_total(1,5),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker9, 'MarkerEdgeColor',colorSticker9)
plot(time_axis_total(1,6), PO2_MS_Pleister_total(1,6),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker10, 'MarkerEdgeColor',colorSticker10)
plot(time_axis_total(1,7), PO2_MS_Pleister_total(1,7),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker11, 'MarkerEdgeColor',colorSticker11)
plot(time_axis_total(1,8), PO2_MS_Pleister_total(1,8),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker2, 'MarkerEdgeColor',colorSticker2)
plot(time_axis_total(1,9), PO2_MS_Pleister_total(1,9),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker3, 'MarkerEdgeColor',colorSticker3)
plot(time_axis_total(1,10), PO2_MS_Pleister_total(1,10),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker4, 'MarkerEdgeColor',colorSticker4)
plot(time_axis_total(1,11), PO2_MS_Pleister_total(1,11),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker3, 'MarkerEdgeColor',colorSticker3)
plot(time_axis_total(1,12), PO2_MS_Pleister_total(1,12),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker4, 'MarkerEdgeColor',colorSticker4)
plot(time_axis_total(1,13), PO2_MS_Pleister_total(1,13),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker3, 'MarkerEdgeColor',colorSticker3)
plot(time_axis_total(1,14), PO2_MS_Pleister_total(1,14),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker4, 'MarkerEdgeColor',colorSticker4)
hold off
xlabel('total time after ALA-sticker application (hours)')
ylabel('mitoPO2')
xlim([3 19])
title("mitoPo2 for different times of ALA application (re-applications only) MS")

%% COMBINATIE
figure(6)
plot(time_axis, PO2_MS_Pleister, '-ob')
hold on
plot(time_axis_total, PO2_MS_Pleister_total, '--ob')
xlim([3 19])
ylim([20 160])
xlabel('total time after ALA-sticker application (hours)')
ylabel('mitoPO2')
legend('after 1st application', 'after re-application')
title("mitoPo2 for different times of ALA application MS")

figure(66)
hold on
plot(time_axis, PO2_MS_Pleister,'k','LineStyle', '-','Marker', 'none')
plot(time_axis_total, PO2_MS_Pleister_total,'k','LineStyle', '--','Marker', 'none')

%first removal
plot(time_axis(1,1), PO2_MS_Pleister(1,1),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker1, 'MarkerEdgeColor',colorSticker1)
plot(time_axis(1,2), PO2_MS_Pleister(1,2),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker2, 'MarkerEdgeColor',colorSticker2) 
plot(time_axis(1,3), PO2_MS_Pleister(1,3),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker3,'MarkerEdgeColor',colorSticker3)
plot(time_axis(1,4), PO2_MS_Pleister(1,4),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker4,'MarkerEdgeColor',colorSticker4)
plot(time_axis(1,5), PO2_MS_Pleister(1,5),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker5, 'MarkerEdgeColor',colorSticker5)
plot(time_axis(1,6), PO2_MS_Pleister(1,6),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker6, 'MarkerEdgeColor',colorSticker6)
plot(time_axis(1,7), PO2_MS_Pleister(1,7),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker7, 'MarkerEdgeColor',colorSticker7)
plot(time_axis(1,8), PO2_MS_Pleister(1,8),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker8, 'MarkerEdgeColor',colorSticker8)
plot(time_axis(1,9), PO2_MS_Pleister(1,9),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker9, 'MarkerEdgeColor',colorSticker9)
plot(time_axis(1,10), PO2_MS_Pleister(1,10),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker10, 'MarkerEdgeColor',colorSticker10)
plot(time_axis(1,11), PO2_MS_Pleister(1,11),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker11, 'MarkerEdgeColor',colorSticker11)
plot(time_axis(1,12), PO2_MS_Pleister(1,12),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker12, 'MarkerEdgeColor',colorSticker12)

%multiple removal after re-application
plot(time_axis_total(1,1), PO2_MS_Pleister_total(1,1),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker5, 'MarkerEdgeColor',colorSticker5)
plot(time_axis_total(1,2), PO2_MS_Pleister_total(1,2),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker6, 'MarkerEdgeColor',colorSticker6) 
plot(time_axis_total(1,3), PO2_MS_Pleister_total(1,3),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker7,'MarkerEdgeColor',colorSticker7)
plot(time_axis_total(1,4), PO2_MS_Pleister_total(1,4),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker8,'MarkerEdgeColor',colorSticker8)
plot(time_axis_total(1,5), PO2_MS_Pleister_total(1,5),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker9, 'MarkerEdgeColor',colorSticker9)
plot(time_axis_total(1,6), PO2_MS_Pleister_total(1,6),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker10, 'MarkerEdgeColor',colorSticker10)
plot(time_axis_total(1,7), PO2_MS_Pleister_total(1,7),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker11, 'MarkerEdgeColor',colorSticker11)
plot(time_axis_total(1,8), PO2_MS_Pleister_total(1,8),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker2, 'MarkerEdgeColor',colorSticker2)
plot(time_axis_total(1,9), PO2_MS_Pleister_total(1,9),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker3, 'MarkerEdgeColor',colorSticker3)
plot(time_axis_total(1,10), PO2_MS_Pleister_total(1,10),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker4, 'MarkerEdgeColor',colorSticker4)
plot(time_axis_total(1,11), PO2_MS_Pleister_total(1,11),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker3, 'MarkerEdgeColor',colorSticker3)
plot(time_axis_total(1,12), PO2_MS_Pleister_total(1,12),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker4, 'MarkerEdgeColor',colorSticker4)
plot(time_axis_total(1,13), PO2_MS_Pleister_total(1,13),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker3, 'MarkerEdgeColor',colorSticker3)
plot(time_axis_total(1,14), PO2_MS_Pleister_total(1,14),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker4, 'MarkerEdgeColor',colorSticker4)
hold off
xlim([3 19])
ylim([20 160])
xlabel('total time after ALA-sticker application (hours)')
ylabel('mitoPO2')
legend('after 1st application', 'after re-application', 'Sticker 1', 'Sticker 2', 'Sticker 3', 'Sticker 4', 'Sticker 5', 'Sticker 6', 'Sticker 7', 'Sticker 8', 'Sticker 9', 'Sticker 10', 'Sticker 11', 'Sticker 12')
title("mitoPo2 for different times of ALA application MS")