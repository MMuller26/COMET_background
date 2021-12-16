%% Combined lifetime plots different backgrounds
close all
clear all
clc

%% mid-air backgrounds
load('mid_air_10_background.mat')
mid_air_10 = lifetime_mid_air_new;

load('mid_air_20_background.mat')
mid_air_20 = lifetime_mid_air_new;

load('mid_air_30_background.mat')
mid_air_30 = lifetime_mid_air_new;

load('mid_air_40_background.mat')
mid_air_40 = lifetime_mid_air_new;

load('mid_air_50_background.mat')
mid_air_50 = lifetime_mid_air_new;

load('lifetime_in.mat')

figure(1)
plot(lifetime_in, mid_air_10, '-o', lifetime_in, mid_air_20, '-o', lifetime_in, mid_air_30, '-o', lifetime_in, mid_air_40, '-o', lifetime_in, mid_air_50, '-o')
legend('10% background', '20% background', '30% background', '40% background', '50% background')
xlabel('input lifetime')
ylabel('new lifetime')
xlim([0 200])
ylim([0 200])
title('new vs. input lifetime for 10-50% background COMET mid-air')

%% skin backgrounds
load('skin_10_background.mat')
skin_10 = lifetime_skin_2Hz_new;

load('skin_20_background.mat')
skin_20 = lifetime_skin_2Hz_new;

load('skin_30_background.mat')
skin_30 = lifetime_skin_2Hz_new;

load('skin_40_background.mat')
skin_40 = lifetime_skin_2Hz_new;

load('skin_50_background.mat')
skin_50 = lifetime_skin_2Hz_new;

figure(2)
loglog(lifetime_in, skin_10, '-o', lifetime_in, skin_20, '-o', lifetime_in, skin_30, '-o', lifetime_in, skin_40, '-o', lifetime_in, skin_50, '-o')
legend('10% background', '20% background', '30% background', '40% background', '50% background')
xlabel('input lifetime')
ylabel('new lifetime')
xlim([0 200])
ylim([0 200])
title('new vs. input lifetime for 10-50% background COMET skin')

%% old laser backgrounds
load('OL_10_background.mat')
OL_10 = lifetime_OL_new;

load('OL_20_background.mat')
OL_20 = lifetime_OL_new;

load('OL_30_background.mat')
OL_30 = lifetime_OL_new;

load('OL_40_background.mat')
OL_40 = lifetime_OL_new;

load('OL_50_background.mat')
OL_50 = lifetime_OL_new;

figure(3)
plot(lifetime_in, OL_10, '-o', lifetime_in, OL_20, '-o', lifetime_in, OL_30, '-o', lifetime_in, OL_40, '-o', lifetime_in, OL_50, '-o')
legend('10% background', '20% background', '30% background', '40% background', '50% background')
xlabel('input lifetime')
ylabel('new lifetime')
xlim([0 200])
ylim([0 200])
title('new vs. input lifetime for 10-50% background old laser PBS')

%% Comparing new lifetimes of mid-air, skin and PBS for 10% and 50% backgrounds

figure(4)
plot(lifetime_in, mid_air_10, '-o', lifetime_in, skin_10, '-o', lifetime_in, OL_10, '-o')
legend('COMET-mid-air', 'COMET-skin', 'OldLaser-PBS')
xlabel('input lifetime')
ylabel('new lifetime')
xlim([0 200])
ylim([0 200])
title('new vs. input lifetime for 3 backgrounds of 10%')

figure(5)
plot(lifetime_in, mid_air_50, '-o', lifetime_in, skin_50, '-o', lifetime_in, OL_50, '-o')
legend('COMET-mid-air', 'COMET-skin', 'OldLaser-PBS')
xlabel('input lifetime')
ylabel('new lifetime')
xlim([0 200])
ylim([0 200])
title('new vs. input lifetime for 3 backgrounds of 50%')