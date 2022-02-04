%% NL ALA after different times of ALA application re-applied!!! MS
clear all
close all
clc

%% Reading in re-applied files 670nm:
folder = fileparts(which(mfilename)); 
addpath(genpath(folder));

MM2_Pleister5_4uur = [];
MM2_Pleister6_5uur = [];
MM2_Pleister7_6uur = [];
MM2_Pleister8_7uur = [];
MM2_Pleister9_8uur = [];
MM2_Pleister10_9uur = [];
MM2_Pleister11_10uur = [];

MM2_Pleister2_13uur = [];
MM2_Pleister3_14uur = [];
MM2_Pleister4_15uur = [];

MM2_Pleister3_16uur = [];
MM2_Pleister4_17uur = [];

MM2_Pleister3_18uur = [];
MM2_Pleister4_19uur = [];

for i = 2:1:6
    MM2_Pleister5_4uur = [MM2_Pleister5_4uur, xlsread('NL_1112uur_MS_sticker5_meting2.xlsx', i, 'B2:B2001')];
    MM2_Pleister6_5uur = [MM2_Pleister6_5uur, xlsread('NL_1213uur_MS_sticker6_meting2.xlsx', i, 'B2:B2001')];
    MM2_Pleister7_6uur = [MM2_Pleister7_6uur, xlsread('NL_1306uur_MS_sticker7_meting2.xlsx', i, 'B2:B2001')];
    MM2_Pleister8_7uur = [MM2_Pleister8_7uur, xlsread('NL_1414uur_MS_sticker8_meting2.xlsx', i, 'B2:B2001')];
    MM2_Pleister9_8uur = [MM2_Pleister9_8uur, xlsread('NL_1511uur_MS_sticker9_meting2.xlsx', i, 'B2:B2001')];
    MM2_Pleister10_9uur = [MM2_Pleister10_9uur, xlsread('NL_1602uur_MS_sticker10_meting2.xlsx', i, 'B2:B2001')];
    MM2_Pleister11_10uur = [MM2_Pleister11_10uur, xlsread('NL_1655uur_MS_sticker11_meting2.xlsx', i, 'B2:B2001')];
    
    MM2_Pleister2_13uur = [MM2_Pleister2_13uur, xlsread('NL_1109uur_MS_Sticker2_meting2.xlsx', i, 'B2:B2001')];
    MM2_Pleister3_14uur = [MM2_Pleister3_14uur, xlsread('NL_1209uur_MS_sticker3_meting2.xlsx', i, 'B2:B2001')];
    MM2_Pleister4_15uur = [MM2_Pleister4_15uur, xlsread('NL_1303uur_MS_sticker4_meting2.xlsx', i, 'B2:B2001')];
    
    MM2_Pleister3_16uur = [MM2_Pleister3_16uur, xlsread('NL_1410uur_MS_sticker3_meting3.xlsx', i, 'B2:B2001')];
    MM2_Pleister4_17uur = [MM2_Pleister4_17uur, xlsread('NL_1507uur_MS_sticker4_meting3.xlsx', i, 'B2:B2001')];
    
    MM2_Pleister3_18uur = [MM2_Pleister3_18uur, xlsread('NL_1559uur_MS_sticker3_meting4.xlsx', i, 'B2:B2001')];
    MM2_Pleister4_19uur = [MM2_Pleister4_19uur, xlsread('NL_1652uur_MS_sticker4_meting4.xlsx', i, 'B2:B2001')];
end

%% finding median of maxima
Max_MM2_Pleister5_4uur = -(median(MM2_Pleister5_4uur(2,:)));
Max_MM2_Pleister6_5uur = -(median(MM2_Pleister6_5uur(2,:)));
Max_MM2_Pleister7_6uur = -(median(MM2_Pleister7_6uur(2,:)));
Max_MM2_Pleister8_7uur = -(median(MM2_Pleister8_7uur(2,:)));
Max_MM2_Pleister9_8uur = -(median(MM2_Pleister9_8uur(2,:)));
Max_MM2_Pleister10_9uur = -(median(MM2_Pleister10_9uur(2,:)));
Max_MM2_Pleister11_10uur = -(median(MM2_Pleister11_10uur(2,:)));

Max_MM2_Pleister2_13uur = -(median(MM2_Pleister2_13uur(2,:)));
Max_MM2_Pleister3_14uur = -(median(MM2_Pleister3_14uur(2,:)));
Max_MM2_Pleister4_15uur = -(median(MM2_Pleister4_15uur(2,:)));

Max_MM2_Pleister3_16uur = -(median(MM2_Pleister3_16uur(2,:)));
Max_MM2_Pleister4_17uur = -(median(MM2_Pleister4_17uur(2,:)));

Max_MM2_Pleister3_18uur = -(median(MM2_Pleister3_18uur(2,:)));
Max_MM2_Pleister4_19uur = -(median(MM2_Pleister4_19uur(2,:)));
 
max_ALA_total2 = [Max_MM2_Pleister5_4uur Max_MM2_Pleister6_5uur Max_MM2_Pleister7_6uur Max_MM2_Pleister8_7uur Max_MM2_Pleister9_8uur Max_MM2_Pleister10_9uur Max_MM2_Pleister11_10uur Max_MM2_Pleister2_13uur Max_MM2_Pleister3_14uur Max_MM2_Pleister4_15uur Max_MM2_Pleister3_16uur Max_MM2_Pleister4_17uur Max_MM2_Pleister3_18uur Max_MM2_Pleister4_19uur];
time_axis = [4 5 6 7 8 9 10 13 14 15 16 17 18 19];
 
figure(1)
plot(time_axis, max_ALA_total2)
xlim([4 19])
ylabel('amplitude')
xlabel('time after ALA application (hours)')
title('Amplitude of 670nm measurement NL for time after ALA re-application MS')

%% Reading in re-applied files 630nm:
folder = fileparts(which(mfilename)); 
addpath(genpath(folder));

MM_Pleister5_4uur = [];
MM_Pleister6_5uur = [];
MM_Pleister7_6uur = [];
MM_Pleister8_7uur = [];
MM_Pleister9_8uur = [];
MM_Pleister10_9uur = [];
MM_Pleister11_10uur = [];

MM_Pleister2_13uur = [];
MM_Pleister3_14uur = [];
MM_Pleister4_15uur = [];

MM_Pleister3_16uur = [];
MM_Pleister4_17uur = [];

MM_Pleister3_18uur = [];
MM_Pleister4_19uur = [];

for i = 2:1:6
    MM_Pleister5_4uur = [MM_Pleister5_4uur, xlsread('NL_1112uur_MS_sticker5_meting2.xlsx', i, 'A2:A2001')];
    MM_Pleister6_5uur = [MM_Pleister6_5uur, xlsread('NL_1213uur_MS_sticker6_meting2.xlsx', i, 'A2:A2001')];
    MM_Pleister7_6uur = [MM_Pleister7_6uur, xlsread('NL_1306uur_MS_sticker7_meting2.xlsx', i, 'A2:A2001')];
    MM_Pleister8_7uur = [MM_Pleister8_7uur, xlsread('NL_1414uur_MS_sticker8_meting2.xlsx', i, 'A2:A2001')];
    MM_Pleister9_8uur = [MM_Pleister9_8uur, xlsread('NL_1511uur_MS_sticker9_meting2.xlsx', i, 'A2:A2001')];
    MM_Pleister10_9uur = [MM_Pleister10_9uur, xlsread('NL_1602uur_MS_sticker10_meting2.xlsx', i, 'A2:A2001')];
    MM_Pleister11_10uur = [MM_Pleister11_10uur, xlsread('NL_1655uur_MS_sticker11_meting2.xlsx', i, 'A2:A2001')];
    
    MM_Pleister2_13uur = [MM_Pleister2_13uur, xlsread('NL_1109uur_MS_Sticker2_meting2.xlsx', i, 'A2:A2001')];
    MM_Pleister3_14uur = [MM_Pleister3_14uur, xlsread('NL_1209uur_MS_sticker3_meting2.xlsx', i, 'A2:A2001')];
    MM_Pleister4_15uur = [MM_Pleister4_15uur, xlsread('NL_1303uur_MS_sticker4_meting2.xlsx', i, 'A2:A2001')];
    
    MM_Pleister3_16uur = [MM_Pleister3_16uur, xlsread('NL_1410uur_MS_sticker3_meting3.xlsx', i, 'A2:A2001')];
    MM_Pleister4_17uur = [MM_Pleister4_17uur, xlsread('NL_1507uur_MS_sticker4_meting3.xlsx', i, 'A2:A2001')];
    
    MM_Pleister3_18uur = [MM_Pleister3_18uur, xlsread('NL_1559uur_MS_sticker3_meting4.xlsx', i, 'A2:A2001')];
    MM_Pleister4_19uur = [MM_Pleister4_19uur, xlsread('NL_1652uur_MS_sticker4_meting4.xlsx', i, 'A2:A2001')];
end

%% finding median of maxima
Max_MM_Pleister5_4uur = -(median(MM_Pleister5_4uur(2,:)));
Max_MM_Pleister6_5uur = -(median(MM_Pleister6_5uur(2,:)));
Max_MM_Pleister7_6uur = -(median(MM_Pleister7_6uur(2,:)));
Max_MM_Pleister8_7uur = -(median(MM_Pleister8_7uur(2,:)));
Max_MM_Pleister9_8uur = -(median(MM_Pleister9_8uur(2,:)));
Max_MM_Pleister10_9uur = -(median(MM_Pleister10_9uur(2,:)));
Max_MM_Pleister11_10uur = -(median(MM_Pleister11_10uur(2,:)));

Max_MM_Pleister2_13uur = -(median(MM_Pleister2_13uur(2,:)));
Max_MM_Pleister3_14uur = -(median(MM_Pleister3_14uur(2,:)));
Max_MM_Pleister4_15uur = -(median(MM_Pleister4_15uur(2,:)));

Max_MM_Pleister3_16uur = -(median(MM_Pleister3_16uur(2,:)));
Max_MM_Pleister4_17uur = -(median(MM_Pleister4_17uur(2,:)));

Max_MM_Pleister3_18uur = -(median(MM_Pleister3_18uur(2,:)));
Max_MM_Pleister4_19uur = -(median(MM_Pleister4_19uur(2,:)));
 
max_ALA_total = [Max_MM_Pleister5_4uur Max_MM_Pleister6_5uur Max_MM_Pleister7_6uur Max_MM_Pleister8_7uur Max_MM_Pleister9_8uur Max_MM_Pleister10_9uur Max_MM_Pleister11_10uur Max_MM_Pleister2_13uur Max_MM_Pleister3_14uur Max_MM_Pleister4_15uur Max_MM_Pleister3_16uur Max_MM_Pleister4_17uur Max_MM_Pleister3_18uur Max_MM_Pleister4_19uur];
time_axis = [4 5 6 7 8 9 10 13 14 15 16 17 18 19];
 
figure(2)
plot(time_axis, max_ALA_total)
xlim([4 19])
ylabel('amplitude')
xlabel('time after ALA application (hours)')
title('Amplitude of 630nm measurement NL for time after ALA re-application MS')

%% COMBINATIE PLOT

figure(3)
plot(time_axis, max_ALA_total, time_axis, max_ALA_total2)
xlim([4 19])
legend('630nm', '670nm')
ylabel('amplitude')
xlabel('time after ALA application (hours)')
title('Amplitude of NL measurement for time after ALA re-application MS')
