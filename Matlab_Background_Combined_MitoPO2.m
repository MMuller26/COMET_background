%% Combined PO2 plots different backgrounds
close all
clear all
clc

%% mid-air backgrounds PO2
load('mid_air_0_mitoPO2.mat')
load('PO2_in.mat')

mid_air_0_PO2 = PO2_mid_air_out;
RMSE_mid_air_0_PO2 = sqrt(mean((mid_air_0_PO2-PO2_in).^2));

load('mid_air_10_mitoPO2.mat')
mid_air_10_PO2 = PO2_mid_air_out;
RMSE_mid_air_10_PO2 = sqrt(mean((mid_air_10_PO2-PO2_in).^2));

load('mid_air_20_mitoPO2.mat')
mid_air_20_PO2 = PO2_mid_air_out;
RMSE_mid_air_20_PO2 = sqrt(mean((mid_air_20_PO2-PO2_in).^2));

load('mid_air_30_mitoPO2.mat')
mid_air_30_PO2 = PO2_mid_air_out;
RMSE_mid_air_30_PO2 = sqrt(mean((mid_air_30_PO2-PO2_in).^2));

load('mid_air_40_mitoPO2.mat')
mid_air_40_PO2 = PO2_mid_air_out;
RMSE_mid_air_40_PO2 = sqrt(mean((mid_air_40_PO2-PO2_in).^2));

load('mid_air_50_mitoPO2.mat')
mid_air_50_PO2 = PO2_mid_air_out;
RMSE_mid_air_50_PO2 = sqrt(mean((mid_air_50_PO2-PO2_in).^2));

figure(1)
plot(PO2_in, mid_air_0_PO2, '-o', PO2_in, mid_air_10_PO2, '-o', PO2_in, mid_air_20_PO2, '-o', PO2_in, mid_air_30_PO2, '-o', PO2_in, mid_air_40_PO2, '-o', PO2_in, mid_air_50_PO2, '-o')
legend('0% background', '10% background', '20% background', '30% background', '40% background', '50% background')
xlabel('input PO2')
ylabel('new PO2')
xlim([0 250])
ylim([0 250])
title('new vs. input PO2 for 10-50% background COMET mid-air')

%% skin backgrounds PO2
load('skin_0_mitoPO2.mat')
skin_0_PO2 = PO2_skin_out;
RMSE_skin_0_PO2 = sqrt(mean((skin_0_PO2-PO2_in).^2));

load('skin_10_mitoPO2.mat')
skin_10_PO2 = PO2_skin_out;
RMSE_skin_10_PO2 = sqrt(mean((skin_10_PO2-PO2_in).^2));

load('skin_20_mitoPO2.mat')
skin_20_PO2 = PO2_skin_out;
RMSE_skin_20_PO2 = sqrt(mean((skin_20_PO2-PO2_in).^2));

load('skin_30_mitoPO2.mat')
skin_30_PO2 = PO2_skin_out;
RMSE_skin_30_PO2 = sqrt(mean((skin_30_PO2-PO2_in).^2));

load('skin_40_mitoPO2.mat')
skin_40_PO2 = PO2_skin_out;
RMSE_skin_40_PO2 = sqrt(mean((skin_40_PO2-PO2_in).^2));

load('skin_50_mitoPO2.mat')
skin_50_PO2 = PO2_skin_out;
RMSE_skin_50_PO2 = sqrt(mean((skin_50_PO2-PO2_in).^2));


figure(2)
plot(PO2_in, skin_0_PO2, '-o', PO2_in, skin_10_PO2, '-o', PO2_in, skin_20_PO2, '-o', PO2_in, skin_30_PO2, '-o', PO2_in, skin_40_PO2, '-o', PO2_in, skin_50_PO2, '-o')
legend('0% background', '10% background', '20% background', '30% background', '40% background', '50% background')
xlabel('input PO2')
ylabel('new PO2')
xlim([0 250])
ylim([0 250])
title('new vs. input PO2 for 10-50% background COMET skin')
 
%% old laser backgrounds PO2
load('OL_0_mitoPO2.mat')
OL_0_PO2 = PO2_OL_out;
RMSE_OL_0_PO2 = sqrt(mean((OL_0_PO2-PO2_in).^2));

load('OL_10_mitoPO2.mat')
OL_10_PO2 = PO2_OL_out;
RMSE_OL_10_PO2 = sqrt(mean((OL_10_PO2-PO2_in).^2));

load('OL_20_mitoPO2.mat')
OL_20_PO2 = PO2_OL_out;
RMSE_OL_20_PO2 = sqrt(mean((OL_20_PO2-PO2_in).^2));

load('OL_30_mitoPO2.mat')
OL_30_PO2 = PO2_OL_out;
RMSE_OL_30_PO2 = sqrt(mean((OL_30_PO2-PO2_in).^2));

load('OL_40_mitoPO2.mat')
OL_40_PO2 = PO2_OL_out;
RMSE_OL_40_PO2 = sqrt(mean((OL_40_PO2-PO2_in).^2));

load('OL_50_mitoPO2.mat')
OL_50_PO2 = PO2_OL_out;
RMSE_OL_50_PO2 = sqrt(mean((OL_50_PO2-PO2_in).^2));

figure(3)
plot(PO2_in, OL_0_PO2, '-o', PO2_in, OL_10_PO2, '-o', PO2_in, OL_20_PO2, '-o', PO2_in, OL_30_PO2, '-o', PO2_in, OL_40_PO2, '-o', PO2_in, OL_50_PO2, '-o')
legend('0% background', '10% background', '20% background', '30% background', '40% background', '50% background')
xlabel('input PO2')
ylabel('new PO2')
xlim([0 250])
ylim([0 250])
title('new vs. input PO2 for 10-50% background old laser PBS')
 
%% Comparing new PO2 of mid-air, skin and PBS for 10% and 50% backgrounds

figure(4)
plot(PO2_in, mid_air_10_PO2, '-o', PO2_in, skin_10_PO2, '-o', PO2_in, OL_10_PO2, '-o')
legend('COMET-mid-air', 'COMET-skin', 'OldLaser-PBS')
xlabel('input PO2')
ylabel('new PO2')
xlim([0 250])
ylim([0 250])
title('new vs. input PO2 for 3 backgrounds of 10%')

figure(5)
plot(PO2_in, mid_air_50_PO2, '-o', PO2_in, skin_50_PO2, '-o', PO2_in, OL_50_PO2, '-o')
legend('COMET-mid-air', 'COMET-skin', 'OldLaser-PBS')
xlabel('input PO2')
ylabel('new PO2')
xlim([0 250])
ylim([0 250])
title('new vs. input PO2 for 3 backgrounds of 50%')

%% Barchart of RMSE of different set-ups lifetimes

background = categorical({'10%'; '20%'; '30%'; '40%'; '50%'});
bars = [RMSE_mid_air_10_PO2 RMSE_skin_10_PO2 RMSE_OL_10_PO2; RMSE_mid_air_20_PO2 RMSE_skin_20_PO2 RMSE_OL_20_PO2; RMSE_mid_air_30_PO2 RMSE_skin_30_PO2 RMSE_OL_30_PO2; RMSE_mid_air_40_PO2 RMSE_skin_40_PO2 RMSE_OL_40_PO2; RMSE_mid_air_50_PO2 RMSE_skin_50_PO2 RMSE_OL_50_PO2];
 
figure(6)
bar(background, bars)
legend('CMT mid-air', 'CMT skin', 'old laser PBS')
xlabel('percentage of background signal')
ylabel('RMSE predicted vs. input PO2')
title('RMSE of predicted vs. input PO2 for different setups and percentages of background signal')

prc0 = [RMSE_mid_air_0_PO2, RMSE_skin_0_PO2, RMSE_OL_0_PO2]';
prc10 = [RMSE_mid_air_10_PO2, RMSE_skin_10_PO2, RMSE_OL_10_PO2]';
prc20 = [RMSE_mid_air_20_PO2, RMSE_skin_20_PO2, RMSE_OL_20_PO2]';
prc30 = [RMSE_mid_air_30_PO2, RMSE_skin_30_PO2, RMSE_OL_30_PO2]';
prc40 = [RMSE_mid_air_40_PO2, RMSE_skin_40_PO2, RMSE_OL_40_PO2]';
prc50 = [RMSE_mid_air_50_PO2, RMSE_skin_50_PO2, RMSE_OL_50_PO2]';

T = table({'CMT mid-air', 'CMT skin', 'old laser PBS'}', round(prc0), prc10, prc20, prc30, prc40, prc50)
T.Properties.VariableNames = {'RMSE with background %', '0%', '10%', '20%', '30%', '40%', '50%'}

