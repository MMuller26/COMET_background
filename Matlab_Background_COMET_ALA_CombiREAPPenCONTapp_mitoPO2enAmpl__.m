%% COMBINATIE REAPPLICATION EN FIRST MEASUREMENT
% Versie voortbouwend op Matlab_Background_COMET_ALA_CombinationREAPPenNIET__
% Toevoegingen: amplitude bepaling
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
colorStickerBGS = [ 0.6 0 0.2];

%% Reading in files MM:
folder = fileparts(which(mfilename)); 
addpath(genpath(folder));
    %0x herplkat
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

    %  3x herplakt
[~, MM_Pleister3_18uur] = xlsread('measurements_27-01-2022_15_53_16.xlsx');
[~, MM_Pleister4_19uur] = xlsread('measurements_27-01-2022_16_41_00.xlsx');

Parameters = MM_Pleister5_4uur(:,1);

%% Reading in files MS
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Determining median mitoPO2
    %0x herplakt = CONTINUOUS
MitoPO2_MM_Pleister5_3uur = median(cellfun(@str2num, MM_Pleister5_3uur(7,2:6)));
MitoPO2_MM_Pleister6_4uur = median(cellfun(@str2num, MM_Pleister6_4uur(7,2:6)));
MitoPO2_MM_Pleister7_5uur = median(cellfun(@str2num, MM_Pleister7_5uur(7,2:6)));
MitoPO2_MM_Pleister8_6uur = median(cellfun(@str2num, MM_Pleister8_6uur(7,2:6)));
MitoPO2_MM_Pleister9_7uur = median(cellfun(@str2num, MM_Pleister9_7uur(7,2:6)));
MitoPO2_MM_Pleister10_8uur = median(cellfun(@str2num, MM_Pleister10_8uur(7,2:6)));
MitoPO2_MM_Pleister11_9uur = median(cellfun(@str2num, MM_Pleister11_9uur(7,2:6)));
MitoPO2_MM_Pleister12_10uur = median(cellfun(@str2num, MM_Pleister12_10uur(7,2:6)));
MitoPO2_MM_Pleister1_11uur = median(cellfun(@str2num, MM_Pleister1_11uur(7,2:6)));
MitoPO2_MM_Pleister2_12uur = median(cellfun(@str2num, MM_Pleister2_12uur(7,2:6)));
MitoPO2_MM_Pleister3_13uur = median(cellfun(@str2num, MM_Pleister3_13uur(7,2:6)));
MitoPO2_MM_Pleister4_14uur = median(cellfun(@str2num, MM_Pleister4_14uur(7,2:6)));

MitoPO2_MS_Pleister5_3uur = median(cellfun(@str2num, MS_Pleister5_3uur(7,2:6)));
MitoPO2_MS_Pleister6_4uur = median(cellfun(@str2num, MS_Pleister6_4uur(7,2:6)));
MitoPO2_MS_Pleister7_5uur = median(cellfun(@str2num, MS_Pleister7_5uur(7,2:6)));
MitoPO2_MS_Pleister8_6uur = median(cellfun(@str2num, MS_Pleister8_6uur(7,2:6)));
MitoPO2_MS_Pleister9_7uur = median(cellfun(@str2num, MS_Pleister9_7uur(7,2:6)));
MitoPO2_MS_Pleister10_8uur = median(cellfun(@str2num, MS_Pleister10_8uur(7,2:6)));
MitoPO2_MS_Pleister11_9uur = median(cellfun(@str2num, MS_Pleister11_9uur(7,2:6)));
MitoPO2_MS_Pleister12_10uur = median(cellfun(@str2num, MS_Pleister12_10uur(7,2:6)));
MitoPO2_MS_Pleister1_11uur = median(cellfun(@str2num, MS_Pleister1_11uur(7,2:6)));
MitoPO2_MS_Pleister2_12uur = median(cellfun(@str2num, MS_Pleister2_12uur(7,2:6)));
MitoPO2_MS_Pleister3_13uur = median(cellfun(@str2num, MS_Pleister3_13uur(7,2:6)));
MitoPO2_MS_Pleister4_14uur = median(cellfun(@str2num, MS_Pleister4_14uur(7,2:6)));

    % herplakt  =  REAPPLIED
 %%% MM %%%
MitoPO2_MM_Pleister5_4uur = median(cellfun(@str2num, MM_Pleister5_4uur(7,2:6)));
MitoPO2_MM_Pleister6_5uur = median(cellfun(@str2num, MM_Pleister6_5uur(7,2:6)));
MitoPO2_MM_Pleister7_6uur = median(cellfun(@str2num, MM_Pleister7_6uur(7,2:6)));
MitoPO2_MM_Pleister8_7uur = median(cellfun(@str2num, MM_Pleister8_7uur(7,2:6)));
MitoPO2_MM_Pleister9_8uur = median(cellfun(@str2num, MM_Pleister9_8uur(7,2:6)));
MitoPO2_MM_Pleister10_9uur = median(cellfun(@str2num, MM_Pleister10_9uur(7,2:6)));
MitoPO2_MM_Pleister11_10uur = median(cellfun(@str2num, MM_Pleister11_10uur(7,2:6)));

MitoPO2_MM_Pleister2_13uur = median(cellfun(@str2num, MM_Pleister2_13uur(7,2:6)));
MitoPO2_MM_Pleister3_14uur = median(cellfun(@str2num, MM_Pleister3_14uur(7,2:6)));
MitoPO2_MM_Pleister4_15uur = median(cellfun(@str2num, MM_Pleister4_15uur(7,2:6)));

MitoPO2_MM_Pleister3_16uur = median(cellfun(@str2num, MM_Pleister3_16uur(7,2:6)));
MitoPO2_MM_Pleister4_17uur = median(cellfun(@str2num, MM_Pleister4_17uur(7,2:6)));

MitoPO2_MM_Pleister3_18uur = median(cellfun(@str2num, MM_Pleister3_18uur(7,2:6)));
MitoPO2_MM_Pleister4_19uur = median(cellfun(@str2num, MM_Pleister4_19uur(7,2:6)));

 %%% MS %%%
MitoPO2_MS_Pleister5_4uur = median(cellfun(@str2num, MS_Pleister5_4uur(7,2:6)));
MitoPO2_MS_Pleister6_5uur = median(cellfun(@str2num, MS_Pleister6_5uur(7,2:6)));
MitoPO2_MS_Pleister7_6uur = median(cellfun(@str2num, MS_Pleister7_6uur(7,2:6)));
MitoPO2_MS_Pleister8_7uur = median(cellfun(@str2num, MS_Pleister8_7uur(7,2:6)));
MitoPO2_MS_Pleister9_8uur = median(cellfun(@str2num, MS_Pleister9_8uur(7,2:6)));
MitoPO2_MS_Pleister10_9uur = median(cellfun(@str2num, MS_Pleister10_9uur(7,2:6)));
MitoPO2_MS_Pleister11_10uur = median(cellfun(@str2num, MS_Pleister11_10uur(7,2:6)));

MitoPO2_MS_Pleister2_13uur = median(cellfun(@str2num, MS_Pleister2_13uur(7,2:6)));
MitoPO2_MS_Pleister3_14uur = median(cellfun(@str2num, MS_Pleister3_14uur(7,2:6)));
MitoPO2_MS_Pleister4_15uur = median(cellfun(@str2num, MS_Pleister4_15uur(7,2:6)));

MitoPO2_MS_Pleister3_16uur = median(cellfun(@str2num, MS_Pleister3_16uur(7,2:6)));
MitoPO2_MS_Pleister4_17uur = median(cellfun(@str2num, MS_Pleister4_17uur(7,2:6)));

MitoPO2_MS_Pleister3_18uur = median(cellfun(@str2num, MS_Pleister3_18uur(7,2:6)));
MitoPO2_MS_Pleister4_19uur = median(cellfun(@str2num, MS_Pleister4_19uur(7,2:6)));

%% Plotting mitoPO2 and lifetime for increasing time after application of ALA
%%%%%%%%%%% MM %%%%%%%%%%%%%%
PO2_MM_Pleister = [MitoPO2_MM_Pleister5_3uur MitoPO2_MM_Pleister6_4uur MitoPO2_MM_Pleister7_5uur MitoPO2_MM_Pleister8_6uur MitoPO2_MM_Pleister9_7uur MitoPO2_MM_Pleister10_8uur MitoPO2_MM_Pleister11_9uur MitoPO2_MM_Pleister12_10uur MitoPO2_MM_Pleister1_11uur MitoPO2_MM_Pleister2_12uur MitoPO2_MM_Pleister3_13uur MitoPO2_MM_Pleister4_14uur];
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
plot(time_axis(1,1), PO2_MM_Pleister(1,1),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker5, 'MarkerEdgeColor',colorSticker5)
plot(time_axis(1,2), PO2_MM_Pleister(1,2),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker6, 'MarkerEdgeColor',colorSticker6) 
plot(time_axis(1,3), PO2_MM_Pleister(1,3),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker7,'MarkerEdgeColor',colorSticker7)
plot(time_axis(1,4), PO2_MM_Pleister(1,4),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker8,'MarkerEdgeColor',colorSticker8)
plot(time_axis(1,5), PO2_MM_Pleister(1,5),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker9, 'MarkerEdgeColor',colorSticker9)
plot(time_axis(1,6), PO2_MM_Pleister(1,6),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker10, 'MarkerEdgeColor',colorSticker10)
plot(time_axis(1,7), PO2_MM_Pleister(1,7),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker11, 'MarkerEdgeColor',colorSticker11)
plot(time_axis(1,8), PO2_MM_Pleister(1,8),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker12, 'MarkerEdgeColor',colorSticker12)
plot(time_axis(1,9), PO2_MM_Pleister(1,9),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker1, 'MarkerEdgeColor',colorSticker1)
plot(time_axis(1,10), PO2_MM_Pleister(1,10),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker2, 'MarkerEdgeColor',colorSticker2)
plot(time_axis(1,11), PO2_MM_Pleister(1,11),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker3, 'MarkerEdgeColor',colorSticker3)
plot(time_axis(1,12), PO2_MM_Pleister(1,12),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker4, 'MarkerEdgeColor',colorSticker4)
hold off
xlabel('time after ALA-sticker application (hours)')
ylabel('mitoPO2')
xlim([3 19])
%ylim([60 160])
title("mitoPo2 for different times of ALA application MM")


    % Plotting mitoPO2 and lifetime for increasing time after application ALA all application times together
PO2_MM_Pleister_total = [MitoPO2_MM_Pleister5_4uur MitoPO2_MM_Pleister6_5uur MitoPO2_MM_Pleister7_6uur MitoPO2_MM_Pleister8_7uur MitoPO2_MM_Pleister9_8uur MitoPO2_MM_Pleister10_9uur MitoPO2_MM_Pleister11_10uur  MitoPO2_MM_Pleister2_13uur MitoPO2_MM_Pleister3_14uur MitoPO2_MM_Pleister4_15uur MitoPO2_MM_Pleister3_16uur MitoPO2_MM_Pleister4_17uur MitoPO2_MM_Pleister3_18uur MitoPO2_MM_Pleister4_19uur];
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

%%COMBINATIE plot
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

%%%%%%%%%%% MS %%%%%%%%%%%%%%
% Plotting mitoPO2 and lifetime for increasing time after application of ALA MS
PO2_MS_Pleister = [MitoPO2_MS_Pleister5_3uur MitoPO2_MS_Pleister6_4uur MitoPO2_MS_Pleister7_5uur MitoPO2_MS_Pleister8_6uur MitoPO2_MS_Pleister9_7uur MitoPO2_MS_Pleister10_8uur MitoPO2_MS_Pleister11_9uur MitoPO2_MS_Pleister12_10uur MitoPO2_MS_Pleister1_11uur MitoPO2_MS_Pleister2_12uur MitoPO2_MS_Pleister3_13uur MitoPO2_MS_Pleister4_14uur];
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


% Plotting mitoPO2 and lifetime for increasing time after application ALA all application times together
%%%%%%%%%%% MS %%%%%%%%%%%%%%

PO2_MS_Pleister_total = [MitoPO2_MS_Pleister5_4uur MitoPO2_MS_Pleister6_5uur MitoPO2_MS_Pleister7_6uur MitoPO2_MS_Pleister8_7uur MitoPO2_MS_Pleister9_8uur MitoPO2_MS_Pleister10_9uur MitoPO2_MS_Pleister11_10uur  MitoPO2_MS_Pleister2_13uur MitoPO2_MS_Pleister3_14uur MitoPO2_MS_Pleister4_15uur MitoPO2_MS_Pleister3_16uur MitoPO2_MS_Pleister4_17uur MitoPO2_MS_Pleister3_18uur MitoPO2_MS_Pleister4_19uur];
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

%%COMBINATIE plot
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


%% All data combined in one plot to see how this looks
% Too much information?
% Niet zo interessant en verwarrend gezien curves --> mogelijk wel optie
% bij amplitude want dan dalende trend zichtbaar bij sticker 1; en
% constante lijn bij applicatieduur?

figure(7)
%first removal
title("mitoPo2 for different times of ALA application")

subplot(2,1,1)
hold on
plot(time_axis, PO2_MM_Pleister,'k','LineStyle', '-','LineWidth', 1.5,'Marker', 'none')
plot(time_axis_total, PO2_MM_Pleister_total,'k','LineStyle', '--','LineWidth', 1.5,'Marker', 'none')

plot(time_axis(1,1), PO2_MM_Pleister(1,1),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker5, 'MarkerEdgeColor',colorSticker5)
plot(time_axis(1,2), PO2_MM_Pleister(1,2),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker6, 'MarkerEdgeColor',colorSticker6) 
plot(time_axis(1,3), PO2_MM_Pleister(1,3),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker7,'MarkerEdgeColor',colorSticker7)
plot(time_axis(1,4), PO2_MM_Pleister(1,4),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker8,'MarkerEdgeColor',colorSticker8)
plot(time_axis(1,5), PO2_MM_Pleister(1,5),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker9, 'MarkerEdgeColor',colorSticker9)
plot(time_axis(1,6), PO2_MM_Pleister(1,6),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker10, 'MarkerEdgeColor',colorSticker10)
plot(time_axis(1,7), PO2_MM_Pleister(1,7),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker11, 'MarkerEdgeColor',colorSticker11)
plot(time_axis(1,8), PO2_MM_Pleister(1,8),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker12, 'MarkerEdgeColor',colorSticker12)
plot(time_axis(1,9), PO2_MM_Pleister(1,9),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker1, 'MarkerEdgeColor',colorSticker1)
plot(time_axis(1,10), PO2_MM_Pleister(1,10),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker2, 'MarkerEdgeColor',colorSticker2)
plot(time_axis(1,11), PO2_MM_Pleister(1,11),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker3, 'MarkerEdgeColor',colorSticker3)
plot(time_axis(1,12), PO2_MM_Pleister(1,12),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker4, 'MarkerEdgeColor',colorSticker4)


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
legend('Continuous application', 'Re-application', 'Sticker 1', 'Sticker 2', 'Sticker 3', 'Sticker 4', 'Sticker 5', 'Sticker 6', 'Sticker 7', 'Sticker 8', 'Sticker 9', 'Sticker 10', 'Sticker 11', 'Sticker 12')
title('MitoPo2 for different times of ALA application - Subject 1' )
xlim([3 19])
ylim([20 160])

subplot(2,1,2)
hold on
plot(time_axis, PO2_MS_Pleister, 'Color',[0.7 0.7 0.7],'LineStyle', '-','LineWidth', 1.5,'Marker', 'none')
plot(time_axis_total, PO2_MS_Pleister_total,'Color',[0.7 0.7 0.7],'LineStyle', '--','LineWidth', 1.5,   'Marker', 'none')

%first removal
plot(time_axis(1,1), PO2_MS_Pleister(1,1),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker5, 'MarkerEdgeColor',colorSticker5)
plot(time_axis(1,2), PO2_MS_Pleister(1,2),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker6, 'MarkerEdgeColor',colorSticker6) 
plot(time_axis(1,3), PO2_MS_Pleister(1,3),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker7,'MarkerEdgeColor',colorSticker7)
plot(time_axis(1,4), PO2_MS_Pleister(1,4),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker8,'MarkerEdgeColor',colorSticker8)
plot(time_axis(1,5), PO2_MS_Pleister(1,5),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker9, 'MarkerEdgeColor',colorSticker9)
plot(time_axis(1,6), PO2_MS_Pleister(1,6),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker10, 'MarkerEdgeColor',colorSticker10)
plot(time_axis(1,7), PO2_MS_Pleister(1,7),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker11, 'MarkerEdgeColor',colorSticker11)
plot(time_axis(1,8), PO2_MS_Pleister(1,8),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker12, 'MarkerEdgeColor',colorSticker12)
plot(time_axis(1,9), PO2_MS_Pleister(1,9),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker1, 'MarkerEdgeColor',colorSticker1)
plot(time_axis(1,10), PO2_MS_Pleister(1,10),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker2, 'MarkerEdgeColor',colorSticker2)
plot(time_axis(1,11), PO2_MS_Pleister(1,11),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker3, 'MarkerEdgeColor',colorSticker3)
plot(time_axis(1,12), PO2_MS_Pleister(1,12),'LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker4, 'MarkerEdgeColor',colorSticker4)

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
xlabel('Total time after ALA-sticker application (hours)')
ylabel('MitoPO2')
title('MitoPo2 for different times of ALA application - Subject 2' )


%%  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    AMPLITUDES   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%To do: creeer figure(7) maar dan met amplitude ipv mitoPO2


% Inladen BGS
[~, MM_BGS_Pleister_1] = xlsread('measurements_27-01-2022_08_43_17.xlsx'); 
[~, MM_BGS_Pleister_2_5] = xlsread('measurements_27-01-2022_10_12_52.xlsx'); 
[~, MM_BGS_Pleister_4_7] = xlsread('measurements_27-01-2022_11_33_54.xlsx'); 
[~, MM_BGS_Pleister_9] = xlsread('measurements_27-01-2022_13_38_26.xlsx'); 
[~, MM_BGS_Pleister_11] = xlsread('measurements_27-01-2022_15_32_22.xlsx');

[~, MS_BGS_Pleister_1] = xlsread('measurements_27-01-2022_08_53_42.xlsx'); 
[~, MS_BGS_Pleister_2_5] = xlsread('measurements_27-01-2022_10_14_55.xlsx'); 
[~, MS_BGS_Pleister_4_7] = xlsread('measurements_27-01-2022_11_38_21.xlsx'); 
[~, MS_BGS_Pleister_9] = xlsread('measurements_27-01-2022_13_42_53.xlsx'); 
[~, MS_BGS_Pleister_11] = xlsread('measurements_27-01-2022_15_35_45.xlsx');
% Voorbewerking MM en MS
    %DF
vb_MM_Pleister5_3uur = cellfun(@str2num, MM_Pleister5_3uur(7:end,2:end));
vb_MM_Pleister6_4uur = cellfun(@str2num, MM_Pleister6_4uur(7:end,2:end));
vb_MM_Pleister7_5uur = cellfun(@str2num, MM_Pleister7_5uur(7:end,2:end));
vb_MM_Pleister8_6uur = cellfun(@str2num, MM_Pleister8_6uur(7:end,2:end));
vb_MM_Pleister9_7uur = cellfun(@str2num, MM_Pleister9_7uur(7:end,2:end));
vb_MM_Pleister10_8uur = cellfun(@str2num, MM_Pleister10_8uur(7:end,2:end));
vb_MM_Pleister11_9uur = cellfun(@str2num, MM_Pleister11_9uur(7:end,2:end));
vb_MM_Pleister12_10uur = cellfun(@str2num, MM_Pleister12_10uur(7:end,2:end));
vb_MM_Pleister1_11uur = cellfun(@str2num, MM_Pleister1_11uur(7:end,2:end));
vb_MM_Pleister2_12uur = cellfun(@str2num, MM_Pleister2_12uur(7:end,2:end));
vb_MM_Pleister3_13uur = cellfun(@str2num, MM_Pleister3_13uur(7:end,2:end));
vb_MM_Pleister4_14uur = cellfun(@str2num, MM_Pleister4_14uur(7:end,2:end));

vb_MS_Pleister5_3uur = cellfun(@str2num, MS_Pleister5_3uur(7:end,2:end));
vb_MS_Pleister6_4uur = cellfun(@str2num, MS_Pleister6_4uur(7:end,2:end));
vb_MS_Pleister7_5uur = cellfun(@str2num, MS_Pleister7_5uur(7:end,2:end));
vb_MS_Pleister8_6uur = cellfun(@str2num, MS_Pleister8_6uur(7:end,2:end));
vb_MS_Pleister9_7uur = cellfun(@str2num, MS_Pleister9_7uur(7:end,2:end));
vb_MS_Pleister10_8uur = cellfun(@str2num, MS_Pleister10_8uur(7:end,2:end));
vb_MS_Pleister11_9uur = cellfun(@str2num, MS_Pleister11_9uur(7:end,2:end));
vb_MS_Pleister12_10uur = cellfun(@str2num, MS_Pleister12_10uur(7:end,2:end));
vb_MS_Pleister1_11uur = cellfun(@str2num, MS_Pleister1_11uur(7:end,2:end));
vb_MS_Pleister2_12uur = cellfun(@str2num, MS_Pleister2_12uur(7:end,2:end));
vb_MS_Pleister3_13uur = cellfun(@str2num, MS_Pleister3_13uur(7:end,2:end));
vb_MS_Pleister4_14uur = cellfun(@str2num, MS_Pleister4_14uur(7:end,2:end));

    %BGS
vb_MM_BGS_Pleister_1 = cellfun(@str2num, MM_BGS_Pleister_1(7:end, 2:end));
vb_MM_BGS_Pleister_2_5 = cellfun(@str2num, MM_BGS_Pleister_2_5(7:end, 2:end));
vb_MM_BGS_Pleister_4_7 = cellfun(@str2num, MM_BGS_Pleister_4_7(7:end, 2:end));
vb_MM_BGS_Pleister_9 = cellfun(@str2num, MM_BGS_Pleister_9(7:end, 2:end));
vb_MM_BGS_Pleister_11 = cellfun(@str2num, MM_BGS_Pleister_11(7:end, 2:end));
    
vb_MS_BGS_Pleister_1 = cellfun(@str2num, MS_BGS_Pleister_1(7:end, 2:end));
vb_MS_BGS_Pleister_2_5 = cellfun(@str2num, MS_BGS_Pleister_2_5(7:end, 2:end));
vb_MS_BGS_Pleister_4_7 = cellfun(@str2num, MS_BGS_Pleister_4_7(7:end, 2:end));
vb_MS_BGS_Pleister_9 = cellfun(@str2num, MS_BGS_Pleister_9(7:end, 2:end));
vb_MS_BGS_Pleister_11 = cellfun(@str2num, MS_BGS_Pleister_11(7:end, 2:end));
 
    %Mean of BGS
mean_MM_BGS_Pleister_1 = mean(vb_MM_BGS_Pleister_1(48:end, :), 2);
mean_MM_BGS_Pleister_2_5 = mean(vb_MM_BGS_Pleister_2_5(48:end, :), 2);
mean_MM_BGS_Pleister_4_7 = mean(vb_MM_BGS_Pleister_4_7(48:end, :), 2);
mean_MM_BGS_Pleister_9 = mean(vb_MM_BGS_Pleister_9(48:end, :), 2);
mean_MM_BGS_Pleister_11 = mean(vb_MM_BGS_Pleister_11(48:end, :), 2);

mean_MS_BGS_Pleister_1 = mean(vb_MS_BGS_Pleister_1(48:end, :), 2);
mean_MS_BGS_Pleister_2_5 = mean(vb_MS_BGS_Pleister_2_5(48:end, :), 2);
mean_MS_BGS_Pleister_4_7 = mean(vb_MS_BGS_Pleister_4_7(48:end, :), 2);
mean_MS_BGS_Pleister_9 = mean(vb_MS_BGS_Pleister_9(48:end, :), 2);
mean_MS_BGS_Pleister_11 = mean(vb_MS_BGS_Pleister_11(48:end, :), 2);

% defining amount of samples
samples = [1:1:length(MM_Pleister1_11uur(48:end, :))];

%% Get mean of 5 shots and get maximum amplitude

%Use median of all 5 shots since also used in other results
median_MM_Pleister5_3uur = median(vb_MM_Pleister5_3uur(30:end, 2:end),2);
median_MM_Pleister6_4uur = median(vb_MM_Pleister6_4uur(30:end, 2:end),2);
median_MM_Pleister7_5uur = median(vb_MM_Pleister7_5uur(30:end, 2:end),2);
median_MM_Pleister8_6uur = median(vb_MM_Pleister8_6uur(30:end, 2:end),2);
median_MM_Pleister9_7uur = median(vb_MM_Pleister9_7uur(30:end, 2:end),2);
median_MM_Pleister10_8uur = median(vb_MM_Pleister10_8uur(30:end, 2:end),2);
median_MM_Pleister11_9uur = median(vb_MM_Pleister11_9uur(30:end, 2:end),2);
median_MM_Pleister12_10uur = median(vb_MM_Pleister12_10uur(30:end, 2:end),2);
median_MM_Pleister1_11uur = median(vb_MM_Pleister1_11uur(30:end, 2:end),2);
median_MM_Pleister2_12uur = median(vb_MM_Pleister2_12uur(30:end, 2:end),2);
median_MM_Pleister3_13uur = median(vb_MM_Pleister3_13uur(30:end, 2:end),2);
median_MM_Pleister4_14uur = median(vb_MM_Pleister4_14uur(30:end, 2:end),2);

median_MS_Pleister5_3uur = median(vb_MS_Pleister5_3uur(30:end, 2:end),2);
median_MS_Pleister5_3uur = median(vb_MS_Pleister5_3uur(30:end, 2:end),2);
median_MS_Pleister6_4uur = median(vb_MS_Pleister6_4uur(30:end, 2:end),2);
median_MS_Pleister7_5uur = median(vb_MS_Pleister7_5uur(30:end, 2:end),2);
median_MS_Pleister8_6uur = median(vb_MS_Pleister8_6uur(30:end, 2:end),2);
median_MS_Pleister9_7uur = median(vb_MS_Pleister9_7uur(30:end, 2:end),2);
median_MS_Pleister10_8uur = median(vb_MS_Pleister10_8uur(30:end, 2:end),2);
median_MS_Pleister11_9uur = median(vb_MS_Pleister11_9uur(30:end, 2:end),2);
median_MS_Pleister12_10uur = median(vb_MS_Pleister12_10uur(30:end, 2:end),2);
median_MS_Pleister1_11uur = median(vb_MS_Pleister1_11uur(30:end, 2:end),2);
median_MS_Pleister2_12uur = median(vb_MS_Pleister2_12uur(30:end, 2:end),2);
median_MS_Pleister3_13uur = median(vb_MS_Pleister3_13uur(30:end, 2:end),2);
median_MS_Pleister4_14uur = median(vb_MS_Pleister4_14uur(30:end, 2:end),2);

%Get maximum amplitude of 5 shot average  -- MM
maxAmpl_MM_Pleister5_3uur = max(median_MM_Pleister5_3uur);
maxAmpl_MM_Pleister6_4uur = max(median_MM_Pleister6_4uur);
maxAmpl_MM_Pleister7_5uur = median(median_MM_Pleister7_5uur);
maxAmpl_MM_Pleister8_6uur = median(median_MM_Pleister8_6uur);
maxAmpl_MM_Pleister9_7uur = max(median_MM_Pleister9_7uur);
maxAmpl_MM_Pleister10_8uur = max(median_MM_Pleister10_8uur);
maxAmpl_MM_Pleister11_9uur = max(median_MM_Pleister11_9uur);
maxAmpl_MM_Pleister12_10uur = max(median_MM_Pleister12_10uur);
maxAmpl_MM_Pleister1_11uur = max(median_MM_Pleister1_11uur);
maxAmpl_MM_Pleister2_12uur = max(median_MM_Pleister2_12uur);
maxAmpl_MM_Pleister3_13uur = max(median_MM_Pleister3_13uur);
maxAmpl_MM_Pleister4_14uur = max(median_MM_Pleister4_14uur);

maxAmpl_MS_Pleister5_3uur = max(median_MS_Pleister5_3uur);
maxAmpl_MS_Pleister6_4uur = max(median_MS_Pleister6_4uur);
maxAmpl_MS_Pleister7_5uur = median(median_MS_Pleister7_5uur);
maxAmpl_MS_Pleister8_6uur = median(median_MS_Pleister8_6uur);
maxAmpl_MS_Pleister9_7uur = max(median_MS_Pleister9_7uur);
maxAmpl_MS_Pleister10_8uur = max(median_MS_Pleister10_8uur);
maxAmpl_MS_Pleister11_9uur = max(median_MS_Pleister11_9uur);
maxAmpl_MS_Pleister12_10uur = max(median_MS_Pleister12_10uur);
maxAmpl_MS_Pleister1_11uur = max(median_MS_Pleister1_11uur);
maxAmpl_MS_Pleister2_12uur = max(median_MS_Pleister2_12uur);
maxAmpl_MS_Pleister3_13uur = max(median_MS_Pleister3_13uur);
maxAmpl_MS_Pleister4_14uur = max(median_MS_Pleister4_14uur);








%  %% Get maximum amplitudes OUDE METHODE (KAN WEG? --> VERGEILJKEN MET HIERBOVEN)
%  % Since COMET always has its maximum amplitude ar row 48, this row is used
% % determining median mitoPO2
% OmaxAmpl_MM_Pleister5_3uur = median(vb_MM_Pleister5_3uur(48,:));
% OmaxAmpl_MM_Pleister6_4uur = median(vb_MM_Pleister6_4uur(48,:));
% OmaxAmpl_MM_Pleister7_5uur = median(vb_MM_Pleister7_5uur(48,:));
% OmaxAmpl_MM_Pleister8_6uur = median(vb_MM_Pleister8_6uur(48,:));
% OmaxAmpl_MM_Pleister9_7uur = median(vb_MM_Pleister9_7uur(48,:));
% OmaxAmpl_MM_Pleister10_8uur = median(vb_MM_Pleister10_8uur(48,:));
% OmaxAmpl_MM_Pleister11_9uur = median(vb_MM_Pleister11_9uur(48,:));
% OmaxAmpl_MM_Pleister12_10uur = median(vb_MM_Pleister12_10uur(48,:));
% OmaxAmpl_MM_Pleister1_11uur = median(vb_MM_Pleister1_11uur(48,:));
% OmaxAmpl_MM_Pleister2_12uur = median(vb_MM_Pleister2_12uur(48,:));
% OmaxAmpl_MM_Pleister3_13uur = median(vb_MM_Pleister3_13uur(48,:));
% OmaxAmpl_MM_Pleister4_14uur = median(vb_MM_Pleister4_14uur(48,:));
% 
% OmaxAmpl_MS_Pleister5_3uur = median(vb_MS_Pleister5_3uur(48,:));
% OmaxAmpl_MS_Pleister6_4uur = median(vb_MS_Pleister6_4uur(48,:));
% OmaxAmpl_MS_Pleister7_5uur = median(vb_MS_Pleister7_5uur(48,:));
% OmaxAmpl_MS_Pleister8_6uur = median(vb_MS_Pleister8_6uur(48,:));
% OmaxAmpl_MS_Pleister9_7uur = median(vb_MS_Pleister9_7uur(48,:));
% OmaxAmpl_MS_Pleister10_8uur = median(vb_MS_Pleister10_8uur(48,:));
% OmaxAmpl_MS_Pleister11_9uur = median(vb_MS_Pleister11_9uur(48,:));
% OmaxAmpl_MS_Pleister12_10uur = median(vb_MS_Pleister12_10uur(48,:));
% OmaxAmpl_MS_Pleister1_11uur = median(vb_MS_Pleister1_11uur(48,:));
% OmaxAmpl_MS_Pleister2_12uur = median(vb_MS_Pleister2_12uur(48,:));
% OmaxAmpl_MS_Pleister3_13uur = median(vb_MS_Pleister3_13uur(48,:));
% OmaxAmpl_MS_Pleister4_14uur = median(vb_MS_Pleister4_14uur(48,:));
%%
% mean background signals between measurements
mean_MM_BGS_Pleister_3_6 = mean([mean_MM_BGS_Pleister_2_5(1) mean_MM_BGS_Pleister_4_7(1)]);
mean_MM_BGS_Pleister_8 = mean([mean_MM_BGS_Pleister_4_7(1) mean_MM_BGS_Pleister_9(1)]);
mean_MM_BGS_Pleister_10 = mean([mean_MM_BGS_Pleister_9(1) mean_MM_BGS_Pleister_11(1)]);

mean_MS_BGS_Pleister_3_6 = mean([mean_MS_BGS_Pleister_2_5(1) mean_MS_BGS_Pleister_4_7(1)]);
mean_MS_BGS_Pleister_8 = mean([mean_MS_BGS_Pleister_4_7(1) mean_MS_BGS_Pleister_9(1)]);
mean_MS_BGS_Pleister_10 = mean([mean_MS_BGS_Pleister_9(1) mean_MS_BGS_Pleister_11(1)]);

%making vectors
total_ALA_MM = [maxAmpl_MM_Pleister5_3uur maxAmpl_MM_Pleister6_4uur maxAmpl_MM_Pleister7_5uur maxAmpl_MM_Pleister8_6uur maxAmpl_MM_Pleister9_7uur maxAmpl_MM_Pleister10_8uur maxAmpl_MM_Pleister11_9uur maxAmpl_MM_Pleister12_10uur maxAmpl_MM_Pleister1_11uur maxAmpl_MM_Pleister2_12uur maxAmpl_MM_Pleister3_13uur maxAmpl_MM_Pleister4_14uur];
total_BGS_MM = [mean_MM_BGS_Pleister_2_5(1) mean_MM_BGS_Pleister_3_6 mean_MM_BGS_Pleister_4_7(1) mean_MM_BGS_Pleister_8 mean_MM_BGS_Pleister_9(1) mean_MM_BGS_Pleister_10 mean_MM_BGS_Pleister_11(1) mean_MM_BGS_Pleister_11(1) mean_MM_BGS_Pleister_1(1) mean_MM_BGS_Pleister_2_5(1) mean_MM_BGS_Pleister_3_6 mean_MM_BGS_Pleister_4_7(1)];

total_ALA_MS = [maxAmpl_MS_Pleister5_3uur maxAmpl_MS_Pleister6_4uur maxAmpl_MS_Pleister7_5uur maxAmpl_MS_Pleister8_6uur maxAmpl_MS_Pleister9_7uur maxAmpl_MS_Pleister10_8uur maxAmpl_MS_Pleister11_9uur maxAmpl_MS_Pleister12_10uur maxAmpl_MS_Pleister1_11uur maxAmpl_MS_Pleister2_12uur maxAmpl_MS_Pleister3_13uur maxAmpl_MS_Pleister4_14uur];
total_BGS_MS = [mean_MS_BGS_Pleister_2_5(1) mean_MS_BGS_Pleister_3_6 mean_MS_BGS_Pleister_4_7(1) mean_MS_BGS_Pleister_8 mean_MS_BGS_Pleister_9(1) mean_MS_BGS_Pleister_10 mean_MS_BGS_Pleister_11(1) mean_MS_BGS_Pleister_11(1) mean_MS_BGS_Pleister_1(1) mean_MS_BGS_Pleister_2_5(1) mean_MS_BGS_Pleister_3_6 mean_MS_BGS_Pleister_4_7(1)];

%% Barchart met verschil amplitude BGS en ALA afhankelijk van hoelang erop geplakt. --> continuous application
X = categorical({'3 hours'; '4 hours'; '5 hours'; '6 hours'; '7 hours'; '8 hours'; '9 hours'; '10 hours'; '11 hours'; '12 hours'; '13 hours'; '14 hours'});
X = reordercats(X,{'3 hours'; '4 hours'; '5 hours'; '6 hours'; '7 hours'; '8 hours'; '9 hours'; '10 hours'; '11 hours'; '12 hours'; '13 hours'; '14 hours'});

% figure(100)
% b = bar(X, [total_ALA_MM' total_BGS_MM'], 0.8)
% ylim([0 50000])
% ylabel('Amplitude')
% xlabel('Time after ALA application (re-applied)') %KLOPT NIET TOCH? IS NIET REAPPLIED gezien ingeladen datafiles????
% legend('Measured ALA signal', 'measured BG signal')
% title('Maximum amplitude ALA vs. BG measurements MM')

figure(101)
subplot(2,1,1)
hold on
plot(X,total_ALA_MM, 'LineStyle', '-','LineWidth', 1.5,'Marker', 'none')
plot(X,total_BGS_MM,'Color' , colorStickerBGS, 'LineStyle', '--','LineWidth', 1.5,'Marker', 'none')
    %DF MM
plot(X(1,1), total_ALA_MM(1,1), 'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker5, 'MarkerEdgeColor',colorSticker5)
plot(X(2,1), total_ALA_MM(1,2),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker6, 'MarkerEdgeColor',colorSticker6) 
plot(X(3,1), total_ALA_MM(1,3),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker7,'MarkerEdgeColor',colorSticker7)
plot(X(4,1), total_ALA_MM(1,4),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker8,'MarkerEdgeColor',colorSticker8)
plot(X(5,1), total_ALA_MM(1,5),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker9, 'MarkerEdgeColor',colorSticker9)
plot(X(6,1), total_ALA_MM(1,6),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker10, 'MarkerEdgeColor',colorSticker10)
plot(X(7,1), total_ALA_MM(1,7),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker11, 'MarkerEdgeColor',colorSticker11)
plot(X(8,1), total_ALA_MM(1,8),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker12, 'MarkerEdgeColor',colorSticker12)
plot(X(9,1), total_ALA_MM(1,9),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker1, 'MarkerEdgeColor',colorSticker1)
plot(X(10,1), total_ALA_MM(1,10),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker2, 'MarkerEdgeColor',colorSticker2)
plot(X(11,1), total_ALA_MM(1,11),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker3, 'MarkerEdgeColor',colorSticker3)
plot(X(12,1), total_ALA_MM(1,12),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker4, 'MarkerEdgeColor',colorSticker4)

    % BGS MM
plot(X(1,1), total_BGS_MM(1,1), 'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorStickerBGS, 'MarkerEdgeColor',colorStickerBGS)
plot(X(2,1), total_BGS_MM(1,2),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorStickerBGS, 'MarkerEdgeColor',colorStickerBGS) 
plot(X(3,1), total_BGS_MM(1,3),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorStickerBGS,'MarkerEdgeColor',colorStickerBGS)
plot(X(4,1), total_BGS_MM(1,4),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorStickerBGS,'MarkerEdgeColor',colorStickerBGS)
plot(X(5,1), total_BGS_MM(1,5),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorStickerBGS, 'MarkerEdgeColor',colorStickerBGS)
plot(X(6,1), total_BGS_MM(1,6),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorStickerBGS, 'MarkerEdgeColor',colorStickerBGS)
plot(X(7,1), total_BGS_MM(1,7),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorStickerBGS, 'MarkerEdgeColor',colorStickerBGS)
plot(X(8,1), total_BGS_MM(1,8),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorStickerBGS, 'MarkerEdgeColor',colorStickerBGS)
plot(X(9,1), total_BGS_MM(1,9),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorStickerBGS, 'MarkerEdgeColor',colorStickerBGS)
plot(X(10,1), total_BGS_MM(1,10),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorStickerBGS, 'MarkerEdgeColor',colorStickerBGS)
plot(X(11,1), total_BGS_MM(1,11),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorStickerBGS, 'MarkerEdgeColor',colorStickerBGS)
plot(X(12,1), total_BGS_MM(1,12),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorStickerBGS, 'MarkerEdgeColor',colorStickerBGS)
ylim([0 50000])
ylabel('Amplitude')
xlabel('Time after ALA application')
legend('Measured ALA signal', 'Measured BG signal')
title('Maximum amplitude ALA vs. BG measurements - Subject 1')
hold off

subplot(2,1,2)
%making vectors
hold on
plot(X,total_ALA_MS, 'LineStyle', '-','LineWidth', 1.5,'Marker', 'none')
plot(X,total_BGS_MS,'Color', colorStickerBGS, 'LineStyle', '--','LineWidth', 1.5,'Marker', 'none')

    % DF MS
plot(X(1,1), total_ALA_MS(1,1), 'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker5, 'MarkerEdgeColor',colorSticker5)
plot(X(2,1), total_ALA_MS(1,2),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker6, 'MarkerEdgeColor',colorSticker6) 
plot(X(3,1), total_ALA_MS(1,3),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker7,'MarkerEdgeColor',colorSticker7)
plot(X(4,1), total_ALA_MS(1,4),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker8,'MarkerEdgeColor',colorSticker8)
plot(X(5,1), total_ALA_MS(1,5),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker9, 'MarkerEdgeColor',colorSticker9)
plot(X(6,1), total_ALA_MS(1,6),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker10, 'MarkerEdgeColor',colorSticker10)
plot(X(7,1), total_ALA_MS(1,7),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker11, 'MarkerEdgeColor',colorSticker11)
plot(X(8,1), total_ALA_MS(1,8),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker12, 'MarkerEdgeColor',colorSticker12)
plot(X(9,1), total_ALA_MS(1,9),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker1, 'MarkerEdgeColor',colorSticker1)
plot(X(10,1), total_ALA_MS(1,10),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker2, 'MarkerEdgeColor',colorSticker2)
plot(X(11,1), total_ALA_MS(1,11),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker3, 'MarkerEdgeColor',colorSticker3)
plot(X(12,1), total_ALA_MS(1,12),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorSticker4, 'MarkerEdgeColor',colorSticker4)

    %BGS MS
plot(X(1,1), total_BGS_MS(1,1), 'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorStickerBGS, 'MarkerEdgeColor',colorStickerBGS)
plot(X(2,1), total_BGS_MS(1,2),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorStickerBGS, 'MarkerEdgeColor',colorStickerBGS) 
plot(X(3,1), total_BGS_MS(1,3),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorStickerBGS,'MarkerEdgeColor',colorStickerBGS)
plot(X(4,1), total_BGS_MS(1,4),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorStickerBGS,'MarkerEdgeColor',colorStickerBGS)
plot(X(5,1), total_BGS_MS(1,5),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorStickerBGS, 'MarkerEdgeColor',colorStickerBGS)
plot(X(6,1), total_BGS_MS(1,6),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorStickerBGS, 'MarkerEdgeColor',colorStickerBGS)
plot(X(7,1), total_BGS_MS(1,7),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorStickerBGS, 'MarkerEdgeColor',colorStickerBGS)
plot(X(8,1), total_BGS_MS(1,8),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorStickerBGS, 'MarkerEdgeColor',colorStickerBGS)
plot(X(9,1), total_BGS_MS(1,9),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorStickerBGS, 'MarkerEdgeColor',colorStickerBGS)
plot(X(10,1), total_BGS_MS(1,10),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorStickerBGS, 'MarkerEdgeColor',colorStickerBGS)
plot(X(11,1), total_BGS_MS(1,11),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorStickerBGS, 'MarkerEdgeColor',colorStickerBGS)
plot(X(12,1), total_BGS_MS(1,12),'k','LineStyle', '-','Marker', 'o', 'MarkerFaceColor', colorStickerBGS, 'MarkerEdgeColor',colorStickerBGS)


ylim([0 50000])
ylabel('Amplitude')
xlabel('Time after ALA application')
title('Maximum amplitude ALA vs. BG measurements - Subject 2')
hold off

