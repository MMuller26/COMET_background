%% COMET ALA after re-application (multiple times)
clear all
close all
clc

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

%% Plotting mitoPO2 and lifetime for increasing time after application ALA (2nd application only)
PO2_MM_Pleister_2nd = [MM_Pleister5_4uur MM_Pleister6_5uur MM_Pleister7_6uur MM_Pleister8_7uur MM_Pleister9_8uur MM_Pleister10_9uur MM_Pleister11_10uur  MM_Pleister2_13uur MM_Pleister3_14uur MM_Pleister4_15uur];
%PO2_MM_Pleister_2nd = cellfun(@str2num, PO2_MM_Pleister_2nd);
time_axis_2nd = [4 5 6 7 8 9 10 13 14 15];

figure(1)
plot(time_axis_2nd, PO2_MM_Pleister_2nd, '-o')
xlabel('total time after ALA-sticker application (hours)')
ylabel('mitoPO2')
% xlim([3 14])
% ylim([70 180])
title("mitoPo2 for different times of ALA application (2nd application) MM")

%% Plotting mitoPO2 and lifetime for increasing time after application ALA (2nd, 3rd, 4th application together)

PO2_MM_Pleister_3 = [MM_Pleister3_14uur MM_Pleister3_16uur  MM_Pleister3_18uur ];
%PO2_MM_Pleister_3 = cellfun(@str2num, PO2_MM_Pleister_3);
time_axis_3 = [14 16 18];

figure(2)
plot(time_axis_3, PO2_MM_Pleister_3)
xlabel('total time after ALA-sticker application (hours)')
ylabel('mitoPO2')
title("mitoPo2 for different times of re-application MM")

PO2_MM_Pleister_4 = [MM_Pleister4_15uur MM_Pleister4_17uur  MM_Pleister4_19uur];
%PO2_MM_Pleister_4 = cellfun(@str2num, PO2_MM_Pleister_4);
time_axis_4 = [15 17 19];

figure(3)
plot(time_axis_4, PO2_MM_Pleister_4)
xlabel('total time after ALA-sticker application (hours)')
ylabel('mitoPO2')
title("mitoPo2 for different times of re-application MM")

%% Plotting mitoPO2 and lifetime for increasing time after application ALA all application times together
PO2_MM_Pleister_total = [MM_Pleister5_4uur MM_Pleister6_5uur MM_Pleister7_6uur MM_Pleister8_7uur MM_Pleister9_8uur MM_Pleister10_9uur MM_Pleister11_10uur  MM_Pleister2_13uur MM_Pleister3_14uur MM_Pleister4_15uur MM_Pleister3_16uur MM_Pleister4_17uur MM_Pleister3_18uur MM_Pleister4_19uur];
%PO2_MM_Pleister_total = cellfun(@str2num, PO2_MM_Pleister_total);
time_axis_total = [4 5 6 7 8 9 10 13 14 15 16 17 18 19];

figure(4)
plot(time_axis_total, PO2_MM_Pleister_total, '-o')
xlabel('total time after ALA-sticker application (hours)')
ylabel('mitoPO2')
xlim([3 19])
title("mitoPo2 for different times of ALA application (re-applications only) MM")

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

%% Plotting mitoPO2 and lifetime for increasing time after application ALA (2nd application only)
PO2_MS_Pleister_2nd = [MS_Pleister5_4uur MS_Pleister6_5uur MS_Pleister7_6uur MS_Pleister8_7uur MS_Pleister9_8uur MS_Pleister10_9uur MS_Pleister11_10uur  MS_Pleister2_13uur MS_Pleister3_14uur MS_Pleister4_15uur];
%PO2_MS_Pleister_2nd = cellfun(@str2num, PO2_MS_Pleister_2nd);
time_axis_2nd = [4 5 6 7 8 9 10 13 14 15];

figure(5)
plot(time_axis_2nd, PO2_MS_Pleister_2nd, '-o')
xlabel('total time after ALA-sticker application (hours)')
ylabel('mitoPO2')
% xlim([3 14])
% ylim([70 180])
title("mitoPo2 for different times of ALA application (2nd application) MS")

%% Plotting mitoPO2 and lifetime for increasing time after application ALA (2nd, 3rd, 4th application together)

PO2_MS_Pleister_3 = [MS_Pleister3_14uur MS_Pleister3_16uur  MS_Pleister3_18uur ];
%PO2_MS_Pleister_3 = cellfun(@str2num, PO2_MS_Pleister_3);
time_axis_3 = [14 16 18];

figure(6)
plot(time_axis_3, PO2_MS_Pleister_3)
xlabel('total time after ALA-sticker application (hours)')
ylabel('mitoPO2')
title("mitoPo2 for different times of re-application MS")

PO2_MS_Pleister_4 = [MS_Pleister4_15uur MS_Pleister4_17uur  MS_Pleister4_19uur];
%PO2_MS_Pleister_4 = cellfun(@str2num, PO2_MS_Pleister_4);
time_axis_4 = [15 17 19];

figure(7)
plot(time_axis_4, PO2_MS_Pleister_4)
xlabel('total time after ALA-sticker application (hours)')
ylabel('mitoPO2')
title("mitoPo2 for different times of re-application MS")

%% Plotting mitoPO2 and lifetime for increasing time after application ALA all application times together
PO2_MS_Pleister_total = [MS_Pleister5_4uur MS_Pleister6_5uur MS_Pleister7_6uur MS_Pleister8_7uur MS_Pleister9_8uur MS_Pleister10_9uur MS_Pleister11_10uur  MS_Pleister2_13uur MS_Pleister3_14uur MS_Pleister4_15uur MS_Pleister3_16uur MS_Pleister4_17uur MS_Pleister3_18uur MS_Pleister4_19uur];
%PO2_MS_Pleister_total = cellfun(@str2num, PO2_MS_Pleister_total);
time_axis_total = [4 5 6 7 8 9 10 13 14 15 16 17 18 19];

figure(8)
plot(time_axis_total, PO2_MS_Pleister_total, '-o')
xlabel('total time after ALA-sticker application (hours)')
ylabel('mitoPO2')
xlim([3 19])
title("mitoPo2 for different times of ALA application (re-applications only) MS")