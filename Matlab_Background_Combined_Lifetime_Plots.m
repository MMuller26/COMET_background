%% Combined lifetime plots different backgrounds
close all
clear all
clc

%% mid-air backgrounds lifetimes (515 nm?)
load('mid_air_10_background.mat')
load('lifetime_in.mat')

mid_air_10 = lifetime_mid_air_new;
RMSE_mid_air_10 = sqrt(mean((mid_air_10-lifetime_in).^2));

load('mid_air_20_background.mat')
mid_air_20 = lifetime_mid_air_new;
RMSE_mid_air_20 = sqrt(mean((mid_air_20-lifetime_in).^2));

load('mid_air_30_background.mat')
mid_air_30 = lifetime_mid_air_new;
RMSE_mid_air_30 = sqrt(mean((mid_air_30-lifetime_in).^2));

load('mid_air_40_background.mat')
mid_air_40 = lifetime_mid_air_new;
RMSE_mid_air_40 = sqrt(mean((mid_air_40-lifetime_in).^2));

load('mid_air_50_background.mat')
mid_air_50 = lifetime_mid_air_new;
RMSE_mid_air_50 = sqrt(mean((mid_air_50-lifetime_in).^2));

figure(1)
plot(lifetime_in, lifetime_in, '-o', lifetime_in, mid_air_10, '-o', lifetime_in, mid_air_20, '-o', lifetime_in, mid_air_30, '-o', lifetime_in, mid_air_40, '-o', lifetime_in, mid_air_50, '-o')
legend('0% background', '10% background', '20% background', '30% background', '40% background', '50% background')
xlabel('input lifetime')
ylabel('new lifetime')
xlim([0 200])
ylim([0 200])
title('new vs. input lifetime for 10-50% background COMET mid-air')

%% skin backgrounds lifetimes (515nm?)
load('skin_10_background.mat')
skin_10 = lifetime_skin_2Hz_new;
RMSE_skin_10 = sqrt(mean((skin_10-lifetime_in).^2));

load('skin_20_background.mat')
skin_20 = lifetime_skin_2Hz_new;
RMSE_skin_20 = sqrt(mean((skin_20-lifetime_in).^2));

load('skin_30_background.mat')
skin_30 = lifetime_skin_2Hz_new;
RMSE_skin_30 = sqrt(mean((skin_30-lifetime_in).^2));

load('skin_40_background.mat')
skin_40 = lifetime_skin_2Hz_new;
RMSE_skin_40 = sqrt(mean((skin_40-lifetime_in).^2));

load('skin_50_background.mat')
skin_50 = lifetime_skin_2Hz_new;
RMSE_skin_50 = sqrt(mean((skin_50-lifetime_in).^2));

figure(2)
plot(lifetime_in, lifetime_in, '-o', lifetime_in, skin_10, '-o', lifetime_in, skin_20, '-o', lifetime_in, skin_30, '-o', lifetime_in, skin_40, '-o', lifetime_in, skin_50, '-o')
legend('0% background', '10% background', '20% background', '30% background', '40% background', '50% background')
xlabel('input lifetime')
ylabel('new lifetime')
xlim([0 200])
ylim([0 200])
title('new vs. input lifetime for 10-50% background COMET skin')

%% old laser backgrounds lifetimes (620nm?)
load('OL_10_background.mat')
OL_10 = lifetime_OL_new;
RMSE_OL_10 = sqrt(mean((OL_10-lifetime_in).^2));

load('OL_20_background.mat')
OL_20 = lifetime_OL_new;
RMSE_OL_20 = sqrt(mean((OL_20-lifetime_in).^2));

load('OL_30_background.mat')
OL_30 = lifetime_OL_new;
RMSE_OL_30 = sqrt(mean((OL_30-lifetime_in).^2));

load('OL_40_background.mat')
OL_40 = lifetime_OL_new;
RMSE_OL_40 = sqrt(mean((OL_40-lifetime_in).^2));

load('OL_50_background.mat')
OL_50 = lifetime_OL_new;
RMSE_OL_50 = sqrt(mean((OL_50-lifetime_in).^2));

figure(3)
plot(lifetime_in, lifetime_in, '-o', lifetime_in, OL_10, '-o', lifetime_in, OL_20, '-o', lifetime_in, OL_30, '-o', lifetime_in, OL_40, '-o', lifetime_in, OL_50, '-o')
legend('0% background', '10% background', '20% background', '30% background', '40% background', '50% background')
xlabel('input lifetime')
ylabel('new lifetime')
xlim([0 200])
ylim([0 200])
title('new vs. input lifetime for 10-50% background old laser PBS')

%% new laser backgrounds lifetimes MM 630 nm
load('NL_10_background_MM.mat')
NL_10_MM = lifetime_MM_BGS_new;
RMSE_NL_10_MM = sqrt(mean((NL_10_MM -lifetime_in).^2));

load('NL_20_background_MM.mat')
NL_20_MM = lifetime_MM_BGS_new;
RMSE_NL_20_MM = sqrt(mean((NL_20_MM -lifetime_in).^2));

load('NL_30_background_MM.mat')
NL_30_MM = lifetime_MM_BGS_new;
RMSE_NL_30_MM = sqrt(mean((NL_30_MM -lifetime_in).^2));

load('NL_40_background_MM.mat')
NL_40_MM = lifetime_MM_BGS_new;
RMSE_NL_40_MM = sqrt(mean((NL_40_MM -lifetime_in).^2));

load('NL_50_background_MM.mat')
NL_50_MM = lifetime_MM_BGS_new;
RMSE_NL_50_MM = sqrt(mean((NL_50_MM -lifetime_in).^2));

figure(4)
plot(lifetime_in, lifetime_in, '-o', lifetime_in, NL_10_MM, '-o', lifetime_in, NL_20_MM, '-o', lifetime_in, NL_30_MM, '-o', lifetime_in, NL_40_MM, '-o', lifetime_in, NL_50_MM, '-o')
legend('0% background', '10% background', '20% background', '30% background', '40% background', '50% background')
xlabel('input lifetime')
ylabel('new lifetime')
xlim([0 200])
ylim([0 200])
title('new vs. input lifetime for 10-50% background New laser skin 630nm')

%% new laser backgrounds lifetimes MM 670nm
load('NL_10_background_MM_670.mat')
NL_10_MS = lifetime_MM_BGS_new;
RMSE_NL_10_MS = sqrt(mean((NL_10_MS -lifetime_in).^2));

load('NL_20_background_MM_670.mat')
NL_20_MS = lifetime_MM_BGS_new;
RMSE_NL_20_MS = sqrt(mean((NL_20_MS -lifetime_in).^2));

load('NL_30_background_MM_670.mat')
NL_30_MS = lifetime_MM_BGS_new;
RMSE_NL_30_MS = sqrt(mean((NL_30_MS -lifetime_in).^2));

load('NL_40_background_MM_670.mat')
NL_40_MS = lifetime_MM_BGS_new;
RMSE_NL_40_MS = sqrt(mean((NL_40_MS -lifetime_in).^2));

load('NL_50_background_MM_670.mat')
NL_50_MS = lifetime_MM_BGS_new;
RMSE_NL_50_MS = sqrt(mean((NL_50_MS -lifetime_in).^2));

figure(5)
plot(lifetime_in, lifetime_in, '-o', lifetime_in, NL_10_MS, '-o', lifetime_in, NL_20_MS, '-o', lifetime_in, NL_30_MS, '-o', lifetime_in, NL_40_MS, '-o', lifetime_in, NL_50_MS, '-o')
legend('0% background', '10% background', '20% background', '30% background', '40% background', '50% background')
xlabel('input lifetime')
ylabel('new lifetime')
xlim([0 200])
ylim([0 200])
title('new vs. input lifetime for 10-50% background New laser skin 670 nm')
%% Comparing new lifetimes of mid-air, skin and PBS for 10% and 50% backgrounds

figure(6)
plot(lifetime_in, mid_air_10, '-o', lifetime_in, skin_10, '-o', lifetime_in, OL_10, '-o', lifetime_in, NL_10_MM, '-o', lifetime_in, NL_10_MS, '-o')
legend('COMET-mid-air', 'COMET-skin', 'OldLaser-PBS', 'NL-skin-630nm', 'NL-skin-670nm')
xlabel('input lifetime')
ylabel('new lifetime')
xlim([0 200])
ylim([0 200])
title('new vs. input lifetime for 5 backgrounds of 10%')

figure(7)
plot(lifetime_in, mid_air_50, '-o', lifetime_in, skin_50, '-o', lifetime_in, OL_50, '-o', lifetime_in, NL_50_MM, '-o', lifetime_in, NL_50_MS, '-o')
legend('COMET-mid-air', 'COMET-skin', 'OldLaser-PBS', 'NL-skin-630nm', 'NL-skin-670nm')
xlabel('input lifetime')
ylabel('new lifetime')
xlim([0 200])
ylim([0 200])
title('new vs. input lifetime for 5 backgrounds of 50%')

%% Barchart of RMSE of different set-ups lifetimes

background = categorical({'10%'; '20%'; '30%'; '40%'; '50%'});
bars = [RMSE_mid_air_10 RMSE_skin_10 RMSE_OL_10 RMSE_NL_10_MM RMSE_NL_10_MS; RMSE_mid_air_20 RMSE_skin_20 RMSE_OL_20 RMSE_NL_20_MM RMSE_NL_20_MS; RMSE_mid_air_30 RMSE_skin_30 RMSE_OL_30 RMSE_NL_30_MM RMSE_NL_30_MS; RMSE_mid_air_40 RMSE_skin_40 RMSE_OL_40 RMSE_NL_40_MM RMSE_NL_40_MS; RMSE_mid_air_50 RMSE_skin_50 RMSE_OL_50 RMSE_NL_50_MM RMSE_NL_50_MS];

figure(8)
bar(background, bars)
legend('CMT mid-air (515nm)', 'CMT skin (515nm)', 'old laser PBS (620nm)', 'NL skin (670nm)', 'NL skin (630nm)')
xlabel('percentage of background signal')
ylabel('RMSE predicted vs. input lifetime')
title('RMSE of predicted vs. input lifetime for different setups and percentages of background signal')

prc10 = [RMSE_mid_air_10, RMSE_skin_10, RMSE_OL_10, RMSE_NL_10_MM, RMSE_NL_10_MS]';
prc20 = [RMSE_mid_air_20, RMSE_skin_20, RMSE_OL_20, RMSE_NL_20_MM, RMSE_NL_20_MS]';
prc30 = [RMSE_mid_air_30, RMSE_skin_30, RMSE_OL_30, RMSE_NL_30_MM, RMSE_NL_30_MS]';
prc40 = [RMSE_mid_air_40, RMSE_skin_40, RMSE_OL_40, RMSE_NL_40_MM, RMSE_NL_40_MS]';
prc50 = [RMSE_mid_air_50, RMSE_skin_50, RMSE_OL_50, RMSE_NL_40_MM, RMSE_NL_40_MS]';

T = table({'CMT mid-air', 'CMT skin', 'old laser PBS', 'NL skin 630nm', 'NL skin 670nm'}', prc10, prc20, prc30, prc40, prc50)
T.Properties.VariableNames = {'RMSE with background %', '10%', '20%', '30%', '40%', '50%'}

