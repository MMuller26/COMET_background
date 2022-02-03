%% COMET ALA after different times of ALA application
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

% From PO2 to lifetime 
% %% Stern-Volmer
    % SV_eq_PO2 = (1/tauT1 - 1/tauT0)/kq; %Calculate PO2 based on lifetime
    % SV_eq_tauT1 = tauT0/(PO2*kg+1); %Calculate lifetime based on PO2
tauT0 = 200; %micro sec. 
kq = 398e-6; %mmHg^-1microS^-1 (nu in microsec, e-6 om in microsec te rekenen)

lifetime_MM_Pleister = NaN(1, length(PO2_MM_Pleister));
for j=1:length(PO2_MM_Pleister)
    %lifetime_in(i) = tauT0/(tauT0*PO2_in(i)*kq+1);
    lifetime_MM_Pleister(j)=1/(PO2_MM_Pleister(j)*kq+1/tauT0);
    ReciproqueTau(j)= PO2_MM_Pleister(j)*kq+1/tauT0;
end

figure(2)
plot(time_axis, lifetime_MM_Pleister, '-o')
xlabel('time after ALA-sticker application (hours)')
ylabel('lifetime')
xlim([3 14])
%ylim([14 35])
title("lifetime for different times of ALA application MM")

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

figure(3)
plot(time_axis, PO2_MM_Pleister, '-o')
xlabel('time after ALA-sticker application (hours)')
ylabel('mitoPO2')
xlim([3 19])
%ylim([60 160])
title("mitoPo2 for different times of ALA application MS")

% From PO2 to lifetime 
% %% Stern-Volmer
    % SV_eq_PO2 = (1/tauT1 - 1/tauT0)/kq; %Calculate PO2 based on lifetime
    % SV_eq_tauT1 = tauT0/(PO2*kg+1); %Calculate lifetime based on PO2
tauT0 = 200; %micro sec. 
kq = 398e-6; %mmHg^-1microS^-1 (nu in microsec, e-6 om in microsec te rekenen)

lifetime_MM_Pleister = NaN(1, length(PO2_MM_Pleister));
for j=1:length(PO2_MM_Pleister)
    %lifetime_in(i) = tauT0/(tauT0*PO2_in(i)*kq+1);
    lifetime_MM_Pleister(j)=1/(PO2_MM_Pleister(j)*kq+1/tauT0);
    ReciproqueTau(j)= PO2_MM_Pleister(j)*kq+1/tauT0;
end

figure(4)
plot(time_axis, lifetime_MM_Pleister, '-o')
xlabel('time after ALA-sticker application (hours)')
ylabel('lifetime')
xlim([3 14])
%ylim([14 35])
title("lifetime for different times of ALA application MS")

