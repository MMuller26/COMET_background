%% Plotting all amplitude plots for NL measurements 
clear all
close all
clc

%% reading in saved files

% 3tm4 hours after ALA application
load('max_ALA_total_MM_630nm.mat')
load('max_ALA_total_MM_670nm.mat')
max_ALA_total_MM_630nm = max_ALA_total;
max_ALA_total_MM_670nm = max_ALA_total2;

load('max_ALA_total_MS_630nm.mat')
load('max_ALA_total_MS_670nm.mat')
max_ALA_total_MS_630nm = max_ALA_total;
max_ALA_total_MS_670nm = max_ALA_total2;

% 4tm19 hours after ALA re-application
load('max_ALA_total_MM_630nm_reapplied.mat')
load('max_ALA_total_MM_670nm_reapplied.mat')
max_ALA_total_MM_630nm_reapplied = max_ALA_total;
max_ALA_total_MM_670nm_reapplied = max_ALA_total2;

load('max_ALA_total_MS_630nm_reapplied.mat')
load('max_ALA_total_MS_670nm_reapplied.mat')
max_ALA_total_MS_630nm_reapplied = max_ALA_total;
max_ALA_total_MS_670nm_reapplied = max_ALA_total2;

% 0tm9 hours after ALA removal
load('max_ALA_total_MM_630nm_pleister1.mat')
load('max_ALA_total_MM_670nm_pleister1.mat')
max_ALA_total_MM_630nm_pleister1 = max_ALA_total;
max_ALA_total_MM_670nm_pleister1 = max_ALA_total2;

load('max_ALA_total_MS_630nm_pleister1.mat')
load('max_ALA_total_MS_670nm_pleister1.mat')
max_ALA_total_MS_630nm_pleister1 = max_ALA_total;
max_ALA_total_MS_670nm_pleister1 = max_ALA_total2;

% 0tm7 hours of background over time
load('max_ALA_total_MM_630nm_background.mat')
load('max_ALA_total_MM_670nm_background.mat')
max_ALA_total_MM_630nm_background = Max_MM_BGS_total;
max_ALA_total_MM_670nm_background = Max_MM_BGS_total2;

load('max_ALA_total_MS_630nm_background.mat')
load('max_ALA_total_MS_670nm_background.mat')
max_ALA_total_MS_630nm_background = Max_MM_BGS_total;
max_ALA_total_MS_670nm_background = Max_MM_BGS_total2;

%% Amplitudes 630nm vs. 670nm graphs

% 3tm4 hours after ALA application
time_axis = [3 4 5 6 7 8 9 10 11 12 13 14];

figure(1)
plot(time_axis, max_ALA_total_MM_630nm, '-ob', time_axis, max_ALA_total_MM_670nm, '--ob')
hold on
plot(time_axis, max_ALA_total_MS_630nm, '-or', time_axis, max_ALA_total_MS_670nm, '--or')
xlim([3 14])
legend('MM 630nm', 'MM 670nm', 'MS 630nm', 'MS 670nm')
ylabel('Maximum Amplitude')
xlabel('Time after ALA application (hours)')
title('Maximum amplitude for time after ALA application new laser measurements')

% 4tm19 hours after ALA re-application
time_axis_reapplied = [4 5 6 7 8 9 10 13 14 15 16 17 18 19];

figure(2)
plot(time_axis_reapplied, max_ALA_total_MM_630nm_reapplied, '-ob', time_axis_reapplied, max_ALA_total_MM_670nm_reapplied, '--ob')
hold on
plot(time_axis_reapplied, max_ALA_total_MS_630nm_reapplied, '-or', time_axis_reapplied, max_ALA_total_MS_670nm_reapplied, '--or')
xlim([4 19])
legend('MM 630nm', 'MM 670nm', 'MS 630nm', 'MS 670nm')
ylabel('Maximum Amplitude')
xlabel('Time after ALA re-application (hours)')
title('Maximum amplitude for time after ALA re-application new laser measurements')

% Combination after 1 application and re-application
figure(3)
plot(time_axis, max_ALA_total_MM_630nm, '-ob', time_axis, max_ALA_total_MM_670nm, '--ob')
hold on
plot(time_axis_reapplied, max_ALA_total_MM_630nm_reapplied, '-og', time_axis_reapplied, max_ALA_total_MM_670nm_reapplied, '--og')
xlim([3 19])
legend('1st appl. 630nm', '1st appl. 670nm', '2nd appl. 630nm', '2nd appl. 670nm')
ylabel('Maximum Amplitude')
xlabel('Time after ALA (re-)application (hours)')
title('Maximum amplitude for time after ALA application vs. re-application MM (NL)')

figure(4)
plot(time_axis, max_ALA_total_MS_630nm, '-ob', time_axis, max_ALA_total_MS_670nm, '--ob')
hold on
plot(time_axis_reapplied, max_ALA_total_MS_630nm_reapplied, '-og', time_axis_reapplied, max_ALA_total_MS_670nm_reapplied, '--og')
xlim([3 19])
legend('1st appl. 630nm', '1st appl. 670nm', '2nd appl. 630nm', '2nd appl. 670nm')
ylabel('Maximum Amplitude')
xlabel('Time after ALA (re-)application (hours)')
title('Maximum amplitude for time after ALA application vs. re-application MS (NL)')

% 0tm9 hours after ALA removal
time_axis_removed_MM = [0 1.3 2.25 3.25 4.167 5.25 6.08 7.08 7.92];
time_axis_removed_MS = [0 1.25 2.167 3.167 4 5.167 6 7 7.75];

figure(5)
plot(time_axis_removed_MM, max_ALA_total_MM_630nm_pleister1, '-ob', time_axis_removed_MM, max_ALA_total_MM_670nm_pleister1, '--ob')
hold on 
plot(time_axis_removed_MS, max_ALA_total_MS_630nm_pleister1, '-or', time_axis_removed_MS, max_ALA_total_MS_670nm_pleister1, '--or')
xlim([0 8])
legend('MM 630nm', 'MM 670nm', 'MS 630nm', 'MS 670nm')
ylabel('Maximum Amplitude')
xlabel('Time after ALA removal (hours)')
title('Maximum amplitude for time after ALA removal new laser measurements')

% 0tm7 hours of background over time
time_axis_background = [0 1.5 3 5 7];

figure(6)
plot(time_axis_background, max_ALA_total_MM_630nm_background, '-ob', time_axis_background, max_ALA_total_MM_670nm_background, '--ob')
hold on
plot(time_axis_background, max_ALA_total_MS_630nm_background, '-or', time_axis_background, max_ALA_total_MS_670nm_background, '--or')
xlim([0 7])
legend('MM 630nm', 'MM 670nm', 'MS 630nm', 'MS 670nm')
ylabel('Maximum Amplitude')
xlabel('Time passed(hours)')
title('Maximum amplitude backgrouond measurements (NL) over time')
%% Amplitudes vs. background barchart voorbewerkingen

% 3tm4 hours after ALA application 
    % MM
max_ALA_total_MM_630nm = [max_ALA_total_MM_630nm 0 0 0 0 0];
max_ALA_total_MM_670nm = [max_ALA_total_MM_670nm 0 0 0 0 0];
MM_BGS_630 = max_ALA_total_MM_630nm_background;
MM_BGS_670 = max_ALA_total_MM_670nm_background;
MM_BGS_630_appl = [MM_BGS_630(2) mean(MM_BGS_630(2:3)) MM_BGS_630(3) mean(MM_BGS_630(3:4)) MM_BGS_630(4) mean(MM_BGS_630(4:5)) MM_BGS_630(5) MM_BGS_630(5) MM_BGS_630(1) MM_BGS_630(2) mean(MM_BGS_630(2:3)) MM_BGS_630(3) 0 0 0 0 0];
MM_BGS_670_appl = [MM_BGS_670(2) mean(MM_BGS_670(2:3)) MM_BGS_670(3) mean(MM_BGS_670(3:4)) MM_BGS_670(4) mean(MM_BGS_670(4:5)) MM_BGS_670(5) MM_BGS_670(5) MM_BGS_670(1) MM_BGS_670(2) mean(MM_BGS_670(2:3)) MM_BGS_670(3) 0 0 0 0 0];
    % MS
max_ALA_total_MS_630nm = [max_ALA_total_MS_630nm 0 0 0 0 0];
max_ALA_total_MS_670nm = [max_ALA_total_MS_670nm 0 0 0 0 0];
MS_BGS_630 = max_ALA_total_MS_630nm_background;
MS_BGS_670 = max_ALA_total_MS_670nm_background;
MS_BGS_630_appl = [MS_BGS_630(2) mean(MS_BGS_630(2:3)) MS_BGS_630(3) mean(MS_BGS_630(3:4)) MS_BGS_630(4) mean(MS_BGS_630(4:5)) MS_BGS_630(5) MS_BGS_630(5) MS_BGS_630(1) MS_BGS_630(2) mean(MS_BGS_630(2:3)) MS_BGS_630(3) 0 0 0 0 0];
MS_BGS_670_appl = [MS_BGS_670(2) mean(MS_BGS_670(2:3)) MS_BGS_670(3) mean(MS_BGS_670(3:4)) MS_BGS_670(4) mean(MS_BGS_670(4:5)) MS_BGS_670(5) MS_BGS_670(5) MS_BGS_670(1) MS_BGS_670(2) mean(MS_BGS_670(2:3)) MS_BGS_670(3) 0 0 0 0 0];

% 4tm19 hours after ALA re-application
    %MM
max_ALA_total_MM_630nm_reapplied = [0 max_ALA_total_MM_630nm_reapplied(1:7) 0 0 max_ALA_total_MM_630nm_reapplied(8:end)];
max_ALA_total_MM_670nm_reapplied = [0 max_ALA_total_MM_670nm_reapplied(1:7) 0 0 max_ALA_total_MM_670nm_reapplied(8:end)];
MM_BGS_630_reappl = [0 mean(MM_BGS_630(2:3)) MM_BGS_630(3) mean(MM_BGS_630(3:4)) MM_BGS_630(4) mean(MM_BGS_630(4:5)) MM_BGS_630(5) MM_BGS_630(5) 0 0 mean(MM_BGS_630(2:3)) MM_BGS_630(3) mean(MM_BGS_630(3:4)) MM_BGS_630(4) mean(MM_BGS_630(4:5)) MM_BGS_630(5) MM_BGS_630(5)];
MM_BGS_670_reappl = [0 mean(MM_BGS_670(2:3)) MM_BGS_670(3) mean(MM_BGS_670(3:4)) MM_BGS_670(4) mean(MM_BGS_670(4:5)) MM_BGS_670(5) MM_BGS_670(5) 0 0 mean(MM_BGS_670(2:3)) MM_BGS_670(3) mean(MM_BGS_670(3:4)) MM_BGS_670(4) mean(MM_BGS_670(4:5)) MM_BGS_670(5) MM_BGS_670(5)];
    % MS
max_ALA_total_MS_630nm_reapplied = [0 max_ALA_total_MS_630nm_reapplied(1:7) 0 0 max_ALA_total_MS_630nm_reapplied(8:end)];
max_ALA_total_MS_670nm_reapplied = [0 max_ALA_total_MS_670nm_reapplied(1:7) 0 0 max_ALA_total_MS_670nm_reapplied(8:end)];
MS_BGS_630_reappl = [0 mean(MS_BGS_630(2:3)) MS_BGS_630(3) mean(MS_BGS_630(3:4)) MS_BGS_630(4) mean(MS_BGS_630(4:5)) MS_BGS_630(5) MS_BGS_630(5) 0 0 mean(MS_BGS_630(2:3)) MS_BGS_630(3) mean(MS_BGS_630(3:4)) MS_BGS_630(4) mean(MS_BGS_630(4:5)) MS_BGS_630(5) MS_BGS_630(5)];
MS_BGS_670_reappl = [0 mean(MS_BGS_670(2:3)) MS_BGS_670(3) mean(MS_BGS_670(3:4)) MS_BGS_670(4) mean(MS_BGS_670(4:5)) MS_BGS_670(5) MS_BGS_670(5) 0 0 mean(MS_BGS_670(2:3)) MS_BGS_670(3) mean(MS_BGS_670(3:4)) MS_BGS_670(4) mean(MS_BGS_670(4:5)) MS_BGS_670(5) MS_BGS_670(5)];

% 0tm9 hours after ALA removal
    %MM
MM_BGS_630_removed = [MM_BGS_630(1) MM_BGS_630(2) mean(MM_BGS_630(2:3)) MM_BGS_630(3) mean(MM_BGS_630(3:4)) MM_BGS_630(4) mean(MM_BGS_630(4:5)) MM_BGS_630(5) MM_BGS_630(5)];
MM_BGS_670_removed = [MM_BGS_670(1) MM_BGS_670(2) mean(MM_BGS_670(2:3)) MM_BGS_670(3) mean(MM_BGS_670(3:4)) MM_BGS_670(4) mean(MM_BGS_670(4:5)) MM_BGS_670(5) MM_BGS_670(5)];
    %MS
MS_BGS_630_removed = [MS_BGS_630(1) MS_BGS_630(2) mean(MS_BGS_630(2:3)) MS_BGS_630(3) mean(MS_BGS_630(3:4)) MS_BGS_630(4) mean(MS_BGS_630(4:5)) MS_BGS_630(5) MS_BGS_630(5)];
MS_BGS_670_removed = [MS_BGS_670(1) MS_BGS_670(2) mean(MS_BGS_670(2:3)) MS_BGS_670(3) mean(MS_BGS_670(3:4)) MS_BGS_670(4) mean(MS_BGS_670(4:5)) MS_BGS_670(5) MS_BGS_670(5)];

%% Amplitudes vs. background barchart plots. 
X = categorical({'3 uur'; '4 uur*'; '5 uur'; '6 uur*'; '7 uur'; '8 uur*'; '9 uur'; '10 uur*'; '11 uur'; '12 uur'; '13 uur*'; '14 uur'; '15 uur*'; '16 uur'; '17 uur*';'18 uur';'19 uur*'});
X = reordercats(X,{'3 uur'; '4 uur*'; '5 uur'; '6 uur*'; '7 uur'; '8 uur*'; '9 uur'; '10 uur*'; '11 uur'; '12 uur'; '13 uur*'; '14 uur'; '15 uur*'; '16 uur'; '17 uur*';'18 uur';'19 uur*'});

Y = categorical({'0 uur'; '1 uur'; '2 uur'; '3 uur'; '4 uur'; '5 uur'; '6 uur'; '7 uur'; '8 uur'});
Y = reordercats(Y, {'0 uur'; '1 uur'; '2 uur'; '3 uur'; '4 uur'; '5 uur'; '6 uur'; '7 uur'; '8 uur'});

% 3tm4 hours after ALA application
    %MM
figure(7)
b1 = bar(X, [max_ALA_total_MM_630nm' MM_BGS_630_appl'], 0.8)
ylabel('amplitude')
xlabel('time after ALA application')
legend('measured ALA signal', 'measured BG signal')
title('Maximum amplitude ALA vs. BG measurements 630nm MM')
figure(8)
b2 = bar(X, [max_ALA_total_MM_670nm' MM_BGS_670_appl'], 0.8)
ylabel('amplitude')
xlabel('time after ALA application')
legend('measured ALA signal', 'measured BG signal')
title('Maximum amplitude ALA vs. BG measurements 670nm MM')
    %MS
figure(9)
b3 = bar(X, [max_ALA_total_MS_630nm' MS_BGS_630_appl'], 0.8)
ylabel('amplitude')
xlabel('time after ALA application')
legend('measured ALA signal', 'measured BG signal')
title('Maximum amplitude ALA vs. BG measurements 630nm MS')
figure(10)
b4 = bar(X, [max_ALA_total_MS_670nm' MS_BGS_670_appl'], 0.8)
ylabel('amplitude')
xlabel('time after ALA application')
legend('measured ALA signal', 'measured BG signal')
title('Maximum amplitude ALA vs. BG measurements 670nm MS')

% 4tm19 hours after ALA re-application
    %MM
figure(11)
b5 = bar(X, [max_ALA_total_MM_630nm_reapplied' MM_BGS_630_reappl'], 0.8)
ylabel('amplitude')
xlabel('time after ALA re-application')
legend('measured ALA signal', 'measured BG signal')
title('Maximum amplitude ALA vs. BG measurements reapplied 630nm MM')
figure(12)
b6 = bar(X, [max_ALA_total_MM_670nm_reapplied' MM_BGS_670_reappl'], 0.8)
ylabel('amplitude')
xlabel('time after ALA re-application')
legend('measured ALA signal', 'measured BG signal')
title('Maximum amplitude ALA vs. BG measurements reapplied 670nm MM')
    %MS
figure(13)
b7 = bar(X, [max_ALA_total_MS_630nm_reapplied' MS_BGS_630_reappl'], 0.8)
ylabel('amplitude')
xlabel('time after ALA re-application')
legend('measured ALA signal', 'measured BG signal')
title('Maximum amplitude ALA vs. BG measurements reapplied 630nm MS')
figure(14)
b8 = bar(X, [max_ALA_total_MS_670nm_reapplied' MS_BGS_670_reappl'], 0.8)
ylabel('amplitude')
xlabel('time after ALA re-application')
legend('measured ALA signal', 'measured BG signal')
title('Maximum amplitude ALA vs. BG measurements reapplied 670nm MS')

% 0tm9 hours after ALA removal
    %MM
figure(15)
b9 = bar(Y, [max_ALA_total_MM_630nm_pleister1' MM_BGS_630_removed'], 0.8)
ylabel('amplitude')
xlabel('time after ALA removal')
legend('measured ALA signal', 'measured BG signal')
title('Maximum amplitude ALA vs. BG measurements after ALA removal 630nm MM')
figure(16)
b10 = bar(Y, [max_ALA_total_MM_670nm_pleister1' MM_BGS_670_removed'], 0.8)
ylabel('amplitude')
xlabel('time after ALA removal')
legend('measured ALA signal', 'measured BG signal')
title('Maximum amplitude ALA vs. BG measurements after ALA removal 670nm MM')
    %MS
figure(17)
b11 = bar(Y, [max_ALA_total_MS_630nm_pleister1' MS_BGS_630_removed'], 0.8)
ylabel('amplitude')
xlabel('time after ALA removal')
legend('measured ALA signal', 'measured BG signal')
title('Maximum amplitude ALA vs. BG measurements after ALA removal 630nm MS')
figure(18)
b12 = bar(Y, [max_ALA_total_MS_670nm_pleister1' MS_BGS_670_removed'], 0.8)
ylabel('amplitude')
xlabel('time after ALA removal')
legend('measured ALA signal', 'measured BG signal')
title('Maximum amplitude ALA vs. BG measurements after ALA removal 670nm MS')


