%% COMBINATIE REAPPLICATION EN FIRST MEASUREMENT
clear all
close all
clc

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

figure(1)
plot(time_axis, PO2_MM_Pleister, '-o')
xlabel('time after ALA-sticker application (hours)')
ylabel('mitoPO2')
xlim([3 19])
%ylim([60 160])
title("mitoPo2 for different times of ALA application MM")

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

%% Reading in files MS:%% Naam niet veranderd te veel tijd

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

%% Plotting mitoPO2 and lifetime for increasing time after application of ALA MS
PO2_MM_Pleister = [MM_Pleister5_3uur MM_Pleister6_4uur MM_Pleister7_5uur MM_Pleister8_6uur MM_Pleister9_7uur MM_Pleister10_8uur MM_Pleister11_9uur MM_Pleister12_10uur MM_Pleister1_11uur MM_Pleister2_12uur MM_Pleister3_13uur MM_Pleister4_14uur];
%PO2_MM_Pleister = cellfun(@str2num, PO2_MM_Pleister);
time_axis = [3 4 5 6 7 8 9 10 11 12 13 14];

figure(4)
plot(time_axis, PO2_MM_Pleister, '-o')
xlabel('time after ALA-sticker application (hours)')
ylabel('mitoPO2')
xlim([3 19])
%ylim([60 160])
title("mitoPo2 for different times of ALA application MS")

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

figure(5)
plot(time_axis_total, PO2_MM_Pleister_total, '-o')
xlabel('total time after ALA-sticker application (hours)')
ylabel('mitoPO2')
xlim([3 19])
title("mitoPo2 for different times of ALA application (re-applications only) MS")

%% COMBINATIE
figure(6)
plot(time_axis, PO2_MM_Pleister, '-ob')
hold on
plot(time_axis_total, PO2_MM_Pleister_total, '--ob')
xlim([3 19])
ylim([20 160])
xlabel('total time after ALA-sticker application (hours)')
ylabel('mitoPO2')
legend('after 1st application', 'after re-application')
title("mitoPo2 for different times of ALA application MS")