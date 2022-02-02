%% COMET ALA after re-application (multiple times)
clear all
close all
clc

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

%% Plotting mitoPO2 and lifetime for increasing time after application ALA (2nd application only)
PO2_MM_Pleister_2nd = [MM_Pleister5_4uur(7,2) MM_Pleister6_5uur(7,2) MM_Pleister7_6uur(7,2) MM_Pleister8_7uur(7,2) MM_Pleister9_8uur(7,2) MM_Pleister10_9uur(7,2) MM_Pleister11_10uur(7,2)  MM_Pleister2_13uur(7,2) MM_Pleister3_14uur(7,2) MM_Pleister4_15uur(7,2)];
PO2_MM_Pleister_2nd = cellfun(@str2num, PO2_MM_Pleister_2nd);
time_axis_2nd = [4 5 6 7 8 9 10 13 14 15];

figure(1)
plot(time_axis_2nd, PO2_MM_Pleister_2nd, '-o')
xlabel('total time after ALA-sticker application (hours)')
ylabel('mitoPO2')
% xlim([3 14])
% ylim([70 180])
title("mitoPo2 for different times of ALA application (2nd application) MM")

%% Plotting mitoPO2 and lifetime for increasing time after application ALA (2nd, 3rd, 4th application together)

PO2_MM_Pleister_3 = [MM_Pleister3_14uur(7,2) MM_Pleister3_16uur(7,2)  MM_Pleister3_18uur(7,2) ];
PO2_MM_Pleister_3 = cellfun(@str2num, PO2_MM_Pleister_3);
time_axis_3 = [14 16 18];

figure(2)
plot(time_axis_3, PO2_MM_Pleister_3)
xlabel('total time after ALA-sticker application (hours)')
ylabel('mitoPO2')
title("mitoPo2 for different times of re-application MM")

PO2_MM_Pleister_4 = [MM_Pleister4_15uur(7,2) MM_Pleister4_17uur(7,2)  MM_Pleister4_19uur(7,2) ];
PO2_MM_Pleister_4 = cellfun(@str2num, PO2_MM_Pleister_4);
time_axis_4 = [15 17 19];

figure(3)
plot(time_axis_4, PO2_MM_Pleister_4)
xlabel('total time after ALA-sticker application (hours)')
ylabel('mitoPO2')
title("mitoPo2 for different times of re-application MM")

%% Plotting mitoPO2 and lifetime for increasing time after application ALA all application times together
PO2_MM_Pleister_total = [MM_Pleister5_4uur(7,2) MM_Pleister6_5uur(7,2) MM_Pleister7_6uur(7,2) MM_Pleister8_7uur(7,2) MM_Pleister9_8uur(7,2) MM_Pleister10_9uur(7,2) MM_Pleister11_10uur(7,2)  MM_Pleister2_13uur(7,2) MM_Pleister3_14uur(7,2) MM_Pleister4_15uur(7,2)  MM_Pleister3_16uur(7,2) MM_Pleister4_17uur(7,2)  MM_Pleister3_18uur(7,2) MM_Pleister4_19uur(7,2)];
PO2_MM_Pleister_total = cellfun(@str2num, PO2_MM_Pleister_total);
time_axis_total = [4 5 6 7 8 9 10 13 14 15 16 17 18 19];

figure(4)
plot(time_axis_total, PO2_MM_Pleister_total, '-o')
xlabel('total time after ALA-sticker application (hours)')
ylabel('mitoPO2')
title("mitoPo2 for different times of ALA application (re-applications only) MM")

%% Reading in files MS % name not changed to save time
%1 x herplakt
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

%% Plotting mitoPO2 and lifetime for increasing time after application ALA (2nd application only)
PO2_MM_Pleister_2nd = [MM_Pleister5_4uur(7,2) MM_Pleister6_5uur(7,2) MM_Pleister7_6uur(7,2) MM_Pleister8_7uur(7,2) MM_Pleister9_8uur(7,2) MM_Pleister10_9uur(7,2) MM_Pleister11_10uur(7,2)  MM_Pleister2_13uur(7,2) MM_Pleister3_14uur(7,2) MM_Pleister4_15uur(7,2)];
PO2_MM_Pleister_2nd = cellfun(@str2num, PO2_MM_Pleister_2nd);
time_axis_2nd = [4 5 6 7 8 9 10 13 14 15];

figure(5)
plot(time_axis_2nd, PO2_MM_Pleister_2nd, '-o')
xlabel('total time after ALA-sticker application (hours)')
ylabel('mitoPO2')
% xlim([3 14])
% ylim([70 180])
title("mitoPo2 for different times of ALA application (2nd application) MS")

%% Plotting mitoPO2 and lifetime for increasing time after application ALA (2nd, 3rd, 4th application together)

PO2_MM_Pleister_3 = [MM_Pleister3_14uur(7,2) MM_Pleister3_16uur(7,2)  MM_Pleister3_18uur(7,2) ];
PO2_MM_Pleister_3 = cellfun(@str2num, PO2_MM_Pleister_3);
time_axis_3 = [14 16 18];

figure(6)
plot(time_axis_3, PO2_MM_Pleister_3)
xlabel('total time after ALA-sticker application (hours)')
ylabel('mitoPO2')
title("mitoPo2 for different times of re-application MS")

PO2_MM_Pleister_4 = [MM_Pleister4_15uur(7,2) MM_Pleister4_17uur(7,2)  MM_Pleister4_19uur(7,2) ];
PO2_MM_Pleister_4 = cellfun(@str2num, PO2_MM_Pleister_4);
time_axis_4 = [15 17 19];

figure(7)
plot(time_axis_4, PO2_MM_Pleister_4)
xlabel('total time after ALA-sticker application (hours)')
ylabel('mitoPO2')
title("mitoPo2 for different times of re-application MS")

%% Plotting mitoPO2 and lifetime for increasing time after application ALA all application times together
PO2_MM_Pleister_total = [MM_Pleister5_4uur(7,2) MM_Pleister6_5uur(7,2) MM_Pleister7_6uur(7,2) MM_Pleister8_7uur(7,2) MM_Pleister9_8uur(7,2) MM_Pleister10_9uur(7,2) MM_Pleister11_10uur(7,2)  MM_Pleister2_13uur(7,2) MM_Pleister3_14uur(7,2) MM_Pleister4_15uur(7,2)  MM_Pleister3_16uur(7,2) MM_Pleister4_17uur(7,2)  MM_Pleister3_18uur(7,2) MM_Pleister4_19uur(7,2)];
PO2_MM_Pleister_total = cellfun(@str2num, PO2_MM_Pleister_total);
time_axis_total = [4 5 6 7 8 9 10 13 14 15 16 17 18 19];

figure(8)
plot(time_axis_total, PO2_MM_Pleister_total, '-o')
xlabel('total time after ALA-sticker application (hours)')
ylabel('mitoPO2')
title("mitoPo2 for different times of ALA application (re-applications only) MS")