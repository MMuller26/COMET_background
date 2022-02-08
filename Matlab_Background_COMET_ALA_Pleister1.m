%% COMET background measurement 1st ALA sticker over time MM and MS
clear all
close all
clc

%% Reading in files MM:
folder = fileparts(which(mfilename)); 
addpath(genpath(folder));

[~, MM_Pleister1_1] = xlsread('measurements_27-01-2022_08;41;15.xlsx'); 
[~,MM_Pleister1_2] = xlsread('measurements_27-01-2022_10;01;19.xlsx');
[~,MM_Pleister1_3] = xlsread('measurements_27-01-2022_10;54;38.xlsx');
[~,MM_Pleister1_4] = xlsread('measurements_27-01-2022_11;56;58.xlsx');
[~,MM_Pleister1_5] = xlsread('measurements_27-01-2022_12;48;26.xlsx');
[~,MM_Pleister1_6] = xlsread('measurements_27-01-2022_13;55;47.xlsx');
[~,MM_Pleister1_7] = xlsread('measurements_27-01-2022_14;44;12.xlsx');
[~,MM_Pleister1_8] = xlsread('measurements_27-01-2022_15;47;02.xlsx');
[~,MM_Pleister1_9] = xlsread('measurements_27-01-2022_16;31;12.xlsx');

Parameters = MM_Pleister1_1(:,1);

%% Voorbewerking MM
MM_Pleister1_1 = cellfun(@str2num, MM_Pleister1_1(7:end,2:end));
MM_Pleister1_2 = cellfun(@str2num, MM_Pleister1_2(7:end,2:end));
MM_Pleister1_3 = cellfun(@str2num, MM_Pleister1_3(7:end,2:end));
MM_Pleister1_4 = cellfun(@str2num, MM_Pleister1_4(7:end,2:end));
MM_Pleister1_5 = cellfun(@str2num, MM_Pleister1_5(7:end,2:end));
MM_Pleister1_6 = cellfun(@str2num, MM_Pleister1_6(7:end,2:end));
MM_Pleister1_7 = cellfun(@str2num, MM_Pleister1_7(7:end,2:end));
MM_Pleister1_8 = cellfun(@str2num, MM_Pleister1_8(7:end,2:end));
MM_Pleister1_9 = cellfun(@str2num, MM_Pleister1_9(7:end,2:end));

% defining amount of samples
samples = [1:1:length(MM_Pleister1_1(29:end, :))];

%% Plotting 5 measurements pleister 1 time 1  MM
PO2_MM_Pleister1_1_all = [];

for i =1:size(MM_Pleister1_1(29:end,:),2)
     figure(1)
     plot(samples,MM_Pleister1_1(29:end,i))
     title('5 measurements at time 1 for Pleister 1 MM')
     legend
     hold on
        
    PO2_MM_Pleister1_1 = (sprintf("mitoPO2: %0.1f", MM_Pleister1_1(1,i)));
    PO2_MM_Pleister1_1_all = [PO2_MM_Pleister1_1_all PO2_MM_Pleister1_1];
end 

%% MitoPo2 and lifetime over time (for max measurement only) MM
max_PO2_MM_Pleister1_1 = median(MM_Pleister1_1(1,:));
max_PO2_MM_Pleister1_2 = median(MM_Pleister1_2(1,:));
max_PO2_MM_Pleister1_3 = median(MM_Pleister1_3(1,:));
max_PO2_MM_Pleister1_4 = median(MM_Pleister1_4(1,:));
max_PO2_MM_Pleister1_5 = median(MM_Pleister1_5(1,:));
max_PO2_MM_Pleister1_6 = median(MM_Pleister1_6(1,:));
max_PO2_MM_Pleister1_7 = median(MM_Pleister1_7(1,:));
max_PO2_MM_Pleister1_8 = median(MM_Pleister1_8(1,:));
max_PO2_MM_Pleister1_9 = median(MM_Pleister1_9(1,:));

max_PO2_MM_Pleister1 = [max_PO2_MM_Pleister1_1 max_PO2_MM_Pleister1_2 max_PO2_MM_Pleister1_3 max_PO2_MM_Pleister1_4 max_PO2_MM_Pleister1_5 max_PO2_MM_Pleister1_6 max_PO2_MM_Pleister1_7 max_PO2_MM_Pleister1_8 max_PO2_MM_Pleister1_9];
time_axis = [0 1.3 2.25 3.25 4.167 5.25 6.08 7.08 7.92];

figure(2)
plot(time_axis, max_PO2_MM_Pleister1, '-o')
xlabel('time after ALA-sticker removal (hours)')
ylabel('mitoPO2')
ylim([0 120])
title("MitoPo2 for time after ALA removal (11 hours ALA application) MM")

 % From PO2 to lifetime 
% %% Stern-Volmer
    % SV_eq_PO2 = (1/tauT1 - 1/tauT0)/kq; %Calculate PO2 based on lifetime
    % SV_eq_tauT1 = tauT0/(PO2*kg+1); %Calculate lifetime based on PO2
tauT0 = 200; %micro sec. 
kq = 398e-6; %mmHg^-1microS^-1 (nu in microsec, e-6 om in microsec te rekenen)

max_lifetime_MM_Pleister1 = NaN(1, length(max_PO2_MM_Pleister1));
for j=1:length(max_PO2_MM_Pleister1)
    %lifetime_in(i) = tauT0/(tauT0*PO2_in(i)*kq+1);
    max_lifetime_MM_Pleister1(j)=1/(max_PO2_MM_Pleister1(j)*kq+1/tauT0);
    ReciproqueTau(j)= max_PO2_MM_Pleister1(j)*kq+1/tauT0;
end

figure(3)
plot(time_axis, max_lifetime_MM_Pleister1, '-o')
xlabel('time after ALA-sticker removal (hours)')
ylabel('lifetime')
ylim([0 200])
title("Lifetime for time after ALA removal (11 hours ALA application) MM")

%% Grafiek voor amplitude
med_MM_Pleister1_1 = median(MM_Pleister1_1(48,:));
med_MM_Pleister1_2 = median(MM_Pleister1_2(48,:));
med_MM_Pleister1_3 = median(MM_Pleister1_3(48,:));
med_MM_Pleister1_4 = median(MM_Pleister1_4(48,:));
med_MM_Pleister1_5 = median(MM_Pleister1_5(48,:));
med_MM_Pleister1_6 = median(MM_Pleister1_6(48,:));
med_MM_Pleister1_7 = median(MM_Pleister1_7(48,:));
med_MM_Pleister1_8 = median(MM_Pleister1_8(48,:));
med_MM_Pleister1_9 = median(MM_Pleister1_9(48,:));

med_MM_Pleister1 = [med_MM_Pleister1_1 med_MM_Pleister1_2 med_MM_Pleister1_3 med_MM_Pleister1_4 med_MM_Pleister1_5 med_MM_Pleister1_6 med_MM_Pleister1_7 med_MM_Pleister1_8 med_MM_Pleister1_9];

figure(4)
plot(time_axis, med_MM_Pleister1)
xlabel('time after ALA-sticker removal (hours)')
ylabel('amplitude')
title('amplitude per measurement time MM')

%% Reading in files MS: (namen niet veranderd, veel werk)
folder = fileparts(which(mfilename)); 
addpath(genpath(folder));

[~, MM_Pleister1_1] = xlsread('measurements_27-01-2022_08;51;42.xlsx'); 
[~,MM_Pleister1_2] = xlsread('measurements_27-01-2022_10;05;02.xlsx');
[~,MM_Pleister1_3] = xlsread('measurements_27-01-2022_10;58;26.xlsx');
[~,MM_Pleister1_4] = xlsread('measurements_27-01-2022_12;00;04.xlsx');
[~,MM_Pleister1_5] = xlsread('measurements_27-01-2022_12;51;49.xlsx');
[~,MM_Pleister1_6] = xlsread('measurements_27-01-2022_13;59;50.xlsx');
[~,MM_Pleister1_7] = xlsread('measurements_27-01-2022_14;52;27.xlsx');
[~,MM_Pleister1_8] = xlsread('measurements_27-01-2022_15;50;20.xlsx');
[~,MM_Pleister1_9] = xlsread('measurements_27-01-2022_16;34;19.xlsx');

Parameters = MM_Pleister1_1(:,1);

%% Voorbewerking MS
MM_Pleister1_1 = cellfun(@str2num, MM_Pleister1_1(7:end,2:end));
MM_Pleister1_2 = cellfun(@str2num, MM_Pleister1_2(7:end,2:end));
MM_Pleister1_3 = cellfun(@str2num, MM_Pleister1_3(7:end,2:end));
MM_Pleister1_4 = cellfun(@str2num, MM_Pleister1_4(7:end,2:end));
MM_Pleister1_5 = cellfun(@str2num, MM_Pleister1_5(7:end,2:end));
MM_Pleister1_6 = cellfun(@str2num, MM_Pleister1_6(7:end,2:end));
MM_Pleister1_7 = cellfun(@str2num, MM_Pleister1_7(7:end,2:end));
MM_Pleister1_8 = cellfun(@str2num, MM_Pleister1_8(7:end,2:end));
MM_Pleister1_9 = cellfun(@str2num, MM_Pleister1_9(7:end,2:end));

% defining amount of samples
samples = [1:1:length(MM_Pleister1_1(29:end, :))];

%% Plotting 5 measurements pleister 1 time 1  MS
PO2_MS_Pleister1_1_all = [];

for i =1:size(MM_Pleister1_1(29:end,:),2)
     figure(5)
     plot(samples,MM_Pleister1_1(29:end,i))
     title('5 measurements at time 1 for Pleister 1 MS')
     legend
     hold on
        
    PO2_MS_Pleister1_1 = (sprintf("mitoPO2: %0.1f", MM_Pleister1_1(1,i)));
    PO2_MS_Pleister1_1_all = [PO2_MS_Pleister1_1_all PO2_MS_Pleister1_1];
end 

%% MitoPo2 and lifetime over time (for max measurement only) MM
max_PO2_MM_Pleister1_1 = median(MM_Pleister1_1(1,:));
max_PO2_MM_Pleister1_2 = median(MM_Pleister1_2(1,:));
max_PO2_MM_Pleister1_3 = median(MM_Pleister1_3(1,:));
max_PO2_MM_Pleister1_4 = median(MM_Pleister1_4(1,:));
max_PO2_MM_Pleister1_5 = median(MM_Pleister1_5(1,:));
max_PO2_MM_Pleister1_6 = median(MM_Pleister1_6(1,:));
max_PO2_MM_Pleister1_7 = median(MM_Pleister1_7(1,:));
max_PO2_MM_Pleister1_8 = median(MM_Pleister1_8(1,:));
max_PO2_MM_Pleister1_9 = median(MM_Pleister1_9(1,:));

max_PO2_MM_Pleister1 = [max_PO2_MM_Pleister1_1 max_PO2_MM_Pleister1_2 max_PO2_MM_Pleister1_3 max_PO2_MM_Pleister1_4 max_PO2_MM_Pleister1_5 max_PO2_MM_Pleister1_6 max_PO2_MM_Pleister1_7 max_PO2_MM_Pleister1_8 max_PO2_MM_Pleister1_9];
time_axis_MS = [0 1.25 2.167 3.167 4 5.167 6 7 7.75];

figure(6)
plot(time_axis_MS, max_PO2_MM_Pleister1, '-o')
xlabel('time after ALA-sticker removal (hours)')
ylabel('mitoPO2')
ylim([0 120])
title("MitoPo2 for time after ALA removal (11 hours ALA application) MS")

 % From PO2 to lifetime 
% %% Stern-Volmer
    % SV_eq_PO2 = (1/tauT1 - 1/tauT0)/kq; %Calculate PO2 based on lifetime
    % SV_eq_tauT1 = tauT0/(PO2*kg+1); %Calculate lifetime based on PO2
tauT0 = 200; %micro sec. 
kq = 398e-6; %mmHg^-1microS^-1 (nu in microsec, e-6 om in microsec te rekenen)

max_lifetime_MM_Pleister1 = NaN(1, length(max_PO2_MM_Pleister1));
for j=1:length(max_PO2_MM_Pleister1)
    %lifetime_in(i) = tauT0/(tauT0*PO2_in(i)*kq+1);
    max_lifetime_MM_Pleister1(j)=1/(max_PO2_MM_Pleister1(j)*kq+1/tauT0);
    ReciproqueTau(j)= max_PO2_MM_Pleister1(j)*kq+1/tauT0;
end

figure(7)
plot(time_axis_MS, max_lifetime_MM_Pleister1, '-o')
xlabel('time after ALA-sticker removal (hours)')
ylabel('lifetime')
ylim([0 200])
title("Lifetime for time after ALA removal (11 hours ALA application) MS")

%% Grafiek voor amplitude
med_MM_Pleister1_1 = median(MM_Pleister1_1(48,:));
med_MM_Pleister1_2 = median(MM_Pleister1_2(48,:));
med_MM_Pleister1_3 = median(MM_Pleister1_3(48,:));
med_MM_Pleister1_4 = median(MM_Pleister1_4(48,:));
med_MM_Pleister1_5 = median(MM_Pleister1_5(48,:));
med_MM_Pleister1_6 = median(MM_Pleister1_6(48,:));
med_MM_Pleister1_7 = median(MM_Pleister1_7(48,:));
med_MM_Pleister1_8 = median(MM_Pleister1_8(48,:));
med_MM_Pleister1_9 = median(MM_Pleister1_9(48,:));

med_MM_Pleister1 = [med_MM_Pleister1_1 med_MM_Pleister1_2 med_MM_Pleister1_3 med_MM_Pleister1_4 med_MM_Pleister1_5 med_MM_Pleister1_6 med_MM_Pleister1_7 med_MM_Pleister1_8 med_MM_Pleister1_9];

figure(8)
plot(time_axis_MS, med_MM_Pleister1)
xlabel('time after ALA-sticker removal (hours)')
ylabel('amplitude')
title('amplitude per measurement time MS')