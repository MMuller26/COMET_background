%% NL ALA after different times after ALA removal Pleister 1 MM
clear all
close all
clc

%% Reading in re-applied files 630nm:
folder = fileparts(which(mfilename)); 
addpath(genpath(folder));

MM_Pleister1_1uur = [];
MM_Pleister1_2uur = [];
MM_Pleister1_3uur = [];
MM_Pleister1_4uur = [];
MM_Pleister1_5uur = [];
MM_Pleister1_6uur = [];
MM_Pleister1_7uur = [];
MM_Pleister1_8uur = [];
MM_Pleister1_9uur = [];

for i = 2:1:6
    MM_Pleister1_1uur = [MM_Pleister1_1uur, xlsread('NL_0840uur_MM_Meting1_poging2.xlsx', i, 'A2:A2001')];
    MM_Pleister1_2uur = [MM_Pleister1_2uur, xlsread('NL_1001uur_MM_sticker1_meting2.xlsx', i, 'A2:A2001')];
    MM_Pleister1_3uur = [MM_Pleister1_3uur, xlsread('NL_1055uur_MM_sticker1_meting3.xlsx', i, 'A2:A2001')];
    MM_Pleister1_4uur = [MM_Pleister1_4uur, xlsread('NL_1156uur_MM_sticker1_meting4.xlsx', i, 'A2:A2001')];
    MM_Pleister1_5uur = [MM_Pleister1_5uur, xlsread('NL_1248uur_MM_sticker1_meting5.xlsx', i, 'A2:A2001')];
    MM_Pleister1_6uur = [MM_Pleister1_6uur, xlsread('NL_1355uur_MM_sticker1_meting6.xlsx', i, 'A2:A2001')];
    MM_Pleister1_7uur = [MM_Pleister1_7uur, xlsread('NL_1443uur_MM_sticker1_meting7.xlsx', i, 'A2:A2001')];
    MM_Pleister1_8uur = [MM_Pleister1_8uur, xlsread('NL_1547uur_MM_sticker1_meting8.xlsx', i, 'A2:A2001')];
    MM_Pleister1_9uur = [MM_Pleister1_9uur, xlsread('NL_1631uur_MM_sticker1_meting9.xlsx', i, 'A2:A2001')];
end

%% Finding median of maxima
Max_MM_Pleister1_1uur = -(median(MM_Pleister1_1uur(2,:)));
Max_MM_Pleister1_2uur = -(median(MM_Pleister1_2uur(2,:)));
Max_MM_Pleister1_3uur = -(median(MM_Pleister1_3uur(2,:)));
Max_MM_Pleister1_4uur = -(median(MM_Pleister1_4uur(2,:)));
Max_MM_Pleister1_5uur = -(median(MM_Pleister1_5uur(2,:)));
Max_MM_Pleister1_6uur = -(median(MM_Pleister1_6uur(2,:)));
Max_MM_Pleister1_7uur = -(median(MM_Pleister1_7uur(2,:)));
Max_MM_Pleister1_8uur = -(median(MM_Pleister1_8uur(2,:)));
Max_MM_Pleister1_9uur = -(median(MM_Pleister1_9uur(2,:)));
 
max_ALA_total = [Max_MM_Pleister1_1uur Max_MM_Pleister1_2uur Max_MM_Pleister1_3uur Max_MM_Pleister1_4uur Max_MM_Pleister1_5uur Max_MM_Pleister1_6uur Max_MM_Pleister1_7uur Max_MM_Pleister1_8uur Max_MM_Pleister1_9uur];
time_axis_MM = [0 1.3 2.25 3.25 4.167 5.25 6.08 7.08 7.92];
 
figure(1)
plot(time_axis_MM, max_ALA_total)
xlim([0 8])
ylabel('amplitude')
xlabel('time after ALA removal (hours)')
title('Maximum amplitude for time after ALA removal 630nm MM')

%% Reading in re-applied files 670nm:
folder = fileparts(which(mfilename)); 
addpath(genpath(folder));

MM2_Pleister1_1uur = [];
MM2_Pleister1_2uur = [];
MM2_Pleister1_3uur = [];
MM2_Pleister1_4uur = [];
MM2_Pleister1_5uur = [];
MM2_Pleister1_6uur = [];
MM2_Pleister1_7uur = [];
MM2_Pleister1_8uur = [];
MM2_Pleister1_9uur = [];

for i = 2:1:6
    MM2_Pleister1_1uur = [MM2_Pleister1_1uur, xlsread('NL_0840uur_MM_Meting1_poging2.xlsx', i, 'B2:B2001')];
    MM2_Pleister1_2uur = [MM2_Pleister1_2uur, xlsread('NL_1001uur_MM_sticker1_meting2.xlsx', i, 'B2:B2001')];
    MM2_Pleister1_3uur = [MM2_Pleister1_3uur, xlsread('NL_1055uur_MM_sticker1_meting3.xlsx', i, 'B2:B2001')];
    MM2_Pleister1_4uur = [MM2_Pleister1_4uur, xlsread('NL_1156uur_MM_sticker1_meting4.xlsx', i, 'B2:B2001')];
    MM2_Pleister1_5uur = [MM2_Pleister1_5uur, xlsread('NL_1248uur_MM_sticker1_meting5.xlsx', i, 'B2:B2001')];
    MM2_Pleister1_6uur = [MM2_Pleister1_6uur, xlsread('NL_1355uur_MM_sticker1_meting6.xlsx', i, 'B2:B2001')];
    MM2_Pleister1_7uur = [MM2_Pleister1_7uur, xlsread('NL_1443uur_MM_sticker1_meting7.xlsx', i, 'B2:B2001')];
    MM2_Pleister1_8uur = [MM2_Pleister1_8uur, xlsread('NL_1547uur_MM_sticker1_meting8.xlsx', i, 'B2:B2001')];
    MM2_Pleister1_9uur = [MM2_Pleister1_9uur, xlsread('NL_1631uur_MM_sticker1_meting9.xlsx', i, 'B2:B2001')];
end

%% Finding median of maxima
Max_MM2_Pleister1_1uur = -(median(MM2_Pleister1_1uur(2,:)));
Max_MM2_Pleister1_2uur = -(median(MM2_Pleister1_2uur(2,:)));
Max_MM2_Pleister1_3uur = -(median(MM2_Pleister1_3uur(2,:)));
Max_MM2_Pleister1_4uur = -(median(MM2_Pleister1_4uur(2,:)));
Max_MM2_Pleister1_5uur = -(median(MM2_Pleister1_5uur(2,:)));
Max_MM2_Pleister1_6uur = -(median(MM2_Pleister1_6uur(2,:)));
Max_MM2_Pleister1_7uur = -(median(MM2_Pleister1_7uur(2,:)));
Max_MM2_Pleister1_8uur = -(median(MM2_Pleister1_8uur(2,:)));
Max_MM2_Pleister1_9uur = -(median(MM2_Pleister1_9uur(2,:)));
 
max_ALA_total2 = [Max_MM2_Pleister1_1uur Max_MM2_Pleister1_2uur Max_MM2_Pleister1_3uur Max_MM2_Pleister1_4uur Max_MM2_Pleister1_5uur Max_MM2_Pleister1_6uur Max_MM2_Pleister1_7uur Max_MM2_Pleister1_8uur Max_MM2_Pleister1_9uur];
time_axis_MM = [0 1.3 2.25 3.25 4.167 5.25 6.08 7.08 7.92];
 
figure(2)
plot(time_axis_MM, max_ALA_total)
xlim([0 8])
ylabel('amplitude')
xlabel('time after ALA removal (hours)')
title('Maximum amplitude for time after ALA removal 670nm MM')

%% COMBINATIE PLOT
figure(3)
plot(time_axis_MM, max_ALA_total, time_axis_MM, max_ALA_total2)
xlim([0 8])
legend('630nm', '670nm')
ylabel('amplitude')
xlabel('time after ALA removal (hours)')
title('Amplitude of NL measurement for time after ALA removal MM')