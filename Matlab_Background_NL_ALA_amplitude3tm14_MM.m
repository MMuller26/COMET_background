%% NL ALA after different times of ALA application MM
clear all
close all
clc

%% Reading in files 630nm:
folder = fileparts(which(mfilename)); 
addpath(genpath(folder));

MM_Pleister5_3uur = [];
MM_Pleister6_4uur = [];
MM_Pleister7_5uur = [];
MM_Pleister8_6uur = [];
MM_Pleister9_7uur = [];
MM_Pleister10_8uur = [];
MM_Pleister11_9uur = [];
MM_Pleister12_10uur = [];
MM_Pleister1_11uur = [];
MM_Pleister2_12uur = [];
MM_Pleister3_13uur = [];
MM_Pleister4_14uur = [];

for i = 2:1:6
    MM_Pleister5_3uur = [MM_Pleister5_3uur, xlsread('NL_MM_0948_sticker5_meting1!.xlsx', i, 'A2:A2001')];
    MM_Pleister6_4uur = [MM_Pleister6_4uur, xlsread('NL_1042uur_MM_sticker6_meting1.xlsx', i, 'A2:A2001')];
    MM_Pleister7_5uur = [MM_Pleister7_5uur, xlsread('NL_1145uur_MM_sticker7_meting1.xlsx', i, 'A2:A2001')];
    MM_Pleister8_6uur = [MM_Pleister8_6uur, xlsread('NL_1238uur_MM_sticker8_meting1.xlsx', i, 'A2:A2001')];
    MM_Pleister9_7uur = [MM_Pleister9_7uur, xlsread('NL_1346uur_MM_sticker9_meting1.xlsx', i, 'A2:A2001')];
    MM_Pleister10_8uur = [MM_Pleister10_8uur, xlsread('NL_1440uur_MM_sticker10_meting1.xlsx', i, 'A2:A2001')];
    MM_Pleister11_9uur = [MM_Pleister11_9uur, xlsread('NL_1538uur_MM_sticker11_meting1.xlsx', i, 'A2:A2001')];
    MM_Pleister12_10uur = [MM_Pleister12_10uur, xlsread('NL_1637uur_MM_sticker12_meting1.xlsx', i, 'A2:A2001')];
    MM_Pleister1_11uur = [MM_Pleister1_11uur, xlsread('NL_0840uur_MM_Meting1_poging2.xlsx', i, 'A2:A2001')];
    MM_Pleister2_12uur = [MM_Pleister2_12uur, xlsread('NL_MM_0940uur_meting1_!.xlsx', i, 'A2:A20001')];
    MM_Pleister3_13uur = [MM_Pleister3_13uur, xlsread('NL_1037uur_MM_sticker3_meting1.xlsx', i, 'A2:A2001')];
    MM_Pleister4_14uur = [MM_Pleister4_14uur, xlsread('NL_1140uur_MM_sticker4_meting1.xlsx', i, 'A2:A2001')];
end

%% finding median of maxima
Max_MM_Pleister5_3uur = -(median(MM_Pleister5_3uur(2,:)));
Max_MM_Pleister6_4uur = -(median(MM_Pleister6_4uur(2,:)));
Max_MM_Pleister7_5uur = -(median(MM_Pleister7_5uur(2,:)));
Max_MM_Pleister8_6uur = -(median(MM_Pleister8_6uur(2,:)));
Max_MM_Pleister9_7uur = -(median(MM_Pleister9_7uur(2,:)));
Max_MM_Pleister10_8uur = -(median(MM_Pleister10_8uur(2,:)));
Max_MM_Pleister11_9uur = -(median(MM_Pleister11_9uur(2,:)));
Max_MM_Pleister12_10uur = -(median(MM_Pleister12_10uur(2,:)));
Max_MM_Pleister1_11uur = -(median(MM_Pleister1_11uur(2,:)));
Max_MM_Pleister2_12uur = -(median(MM_Pleister2_12uur(2,:)));
Max_MM_Pleister3_13uur = -(median(MM_Pleister3_13uur(2,:)));
Max_MM_Pleister4_14uur = -(median(MM_Pleister4_14uur(2,:)));

max_ALA_total = [Max_MM_Pleister5_3uur Max_MM_Pleister6_4uur Max_MM_Pleister7_5uur Max_MM_Pleister8_6uur Max_MM_Pleister9_7uur Max_MM_Pleister10_8uur Max_MM_Pleister11_9uur Max_MM_Pleister12_10uur Max_MM_Pleister1_11uur Max_MM_Pleister2_12uur Max_MM_Pleister3_13uur Max_MM_Pleister4_14uur];
time_axis = 3:1:14;

figure(1)
plot(time_axis, max_ALA_total)
xlim([3 14])
ylabel('amplitude')
xlabel('time after ALA application (hours)')
title('Amplitude of 630nm measurement NL for time after ALA application MM')

%% Reading in files 670nm:
folder = fileparts(which(mfilename)); 
addpath(genpath(folder));

MM2_Pleister5_3uur = [];
MM2_Pleister6_4uur = [];
MM2_Pleister7_5uur = [];
MM2_Pleister8_6uur = [];
MM2_Pleister9_7uur = [];
MM2_Pleister10_8uur = [];
MM2_Pleister11_9uur = [];
MM2_Pleister12_10uur = [];
MM2_Pleister1_11uur = [];
MM2_Pleister2_12uur = [];
MM2_Pleister3_13uur = [];
MM2_Pleister4_14uur = [];

for i = 2:1:6
    MM2_Pleister5_3uur = [MM2_Pleister5_3uur, xlsread('NL_MM_0948_sticker5_meting1!.xlsx', i, 'B2:B2001')];
    MM2_Pleister6_4uur = [MM2_Pleister6_4uur, xlsread('NL_1042uur_MM_sticker6_meting1.xlsx', i, 'B2:B2001')];
    MM2_Pleister7_5uur = [MM2_Pleister7_5uur, xlsread('NL_1145uur_MM_sticker7_meting1.xlsx', i, 'B2:B2001')];
    MM2_Pleister8_6uur = [MM2_Pleister8_6uur, xlsread('NL_1238uur_MM_sticker8_meting1.xlsx', i, 'B2:B2001')];
    MM2_Pleister9_7uur = [MM2_Pleister9_7uur, xlsread('NL_1346uur_MM_sticker9_meting1.xlsx', i, 'B2:B2001')];
    MM2_Pleister10_8uur = [MM2_Pleister10_8uur, xlsread('NL_1440uur_MM_sticker10_meting1.xlsx', i, 'B2:B2001')];
    MM2_Pleister11_9uur = [MM2_Pleister11_9uur, xlsread('NL_1538uur_MM_sticker11_meting1.xlsx', i, 'B2:B2001')];
    MM2_Pleister12_10uur = [MM2_Pleister12_10uur, xlsread('NL_1637uur_MM_sticker12_meting1.xlsx', i, 'B2:B2001')];
    MM2_Pleister1_11uur = [MM2_Pleister1_11uur, xlsread('NL_0840uur_MM_Meting1_poging2.xlsx', i, 'B2:B2001')];
    MM2_Pleister2_12uur = [MM2_Pleister2_12uur, xlsread('NL_MM_0940uur_meting1_!.xlsx', i, 'B2:B20001')];
    MM2_Pleister3_13uur = [MM2_Pleister3_13uur, xlsread('NL_1037uur_MM_sticker3_meting1.xlsx', i, 'B2:B2001')];
    MM2_Pleister4_14uur = [MM2_Pleister4_14uur, xlsread('NL_1140uur_MM_sticker4_meting1.xlsx', i, 'B2:B2001')];
end

%% finding median of maxima
Max_MM2_Pleister5_3uur = -(median(MM2_Pleister5_3uur(2,:)));
Max_MM2_Pleister6_4uur = -(median(MM2_Pleister6_4uur(2,:)));
Max_MM2_Pleister7_5uur = -(median(MM2_Pleister7_5uur(2,:)));
Max_MM2_Pleister8_6uur = -(median(MM2_Pleister8_6uur(2,:)));
Max_MM2_Pleister9_7uur = -(median(MM2_Pleister9_7uur(2,:)));
Max_MM2_Pleister10_8uur = -(median(MM2_Pleister10_8uur(2,:)));
Max_MM2_Pleister11_9uur = -(median(MM2_Pleister11_9uur(2,:)));
Max_MM2_Pleister12_10uur = -(median(MM2_Pleister12_10uur(2,:)));
Max_MM2_Pleister1_11uur = -(median(MM2_Pleister1_11uur(2,:)));
Max_MM2_Pleister2_12uur = -(median(MM2_Pleister2_12uur(2,:)));
Max_MM2_Pleister3_13uur = -(median(MM2_Pleister3_13uur(2,:)));
Max_MM2_Pleister4_14uur = -(median(MM2_Pleister4_14uur(2,:)));

max_ALA_total2 = [Max_MM2_Pleister5_3uur Max_MM2_Pleister6_4uur Max_MM2_Pleister7_5uur Max_MM2_Pleister8_6uur Max_MM2_Pleister9_7uur Max_MM2_Pleister10_8uur Max_MM2_Pleister11_9uur Max_MM2_Pleister12_10uur Max_MM2_Pleister1_11uur Max_MM2_Pleister2_12uur Max_MM2_Pleister3_13uur Max_MM2_Pleister4_14uur];
time_axis = 3:1:14;

figure(2)
plot(time_axis, max_ALA_total2)
xlim([3 14])
ylabel('amplitude')
xlabel('time after ALA application (hours)')
title('Amplitude of 670nm measurement NL for time after ALA application MM')

%% COMBINATIE PLOT

figure(3)
plot(time_axis, max_ALA_total, time_axis, max_ALA_total2)
xlim([3 14])
legend('630nm', '670nm')
ylabel('amplitude')
xlabel('time after ALA application (hours)')
title('Amplitude of NL measurement for time after ALA application MM')
