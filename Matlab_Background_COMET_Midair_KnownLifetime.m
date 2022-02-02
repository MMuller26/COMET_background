%% Mid-air background COMET + known lifetime
clear all
close all
clc

%% Input values
folder = fileparts(which(mfilename)); 
addpath(genpath(folder));

[~, mid_air] = xlsread('COMET_BG_30xluchtledige_measurements_02-12-2021_09;59;50.xlsx');
percBG=0.5; % Percentage of BG in simulatied signal

%% Data processing mid-air measurement
% selecting the parameter column
Parameters = mid_air(:,1);

% selecting the columns and rows of the raw data for the 30 good measurements (sampled at 1 Hz)
mid_air_1Hz = mid_air(:,5:34);
mid_air_raw_1Hz = mid_air_1Hz(35:size(mid_air_1Hz, 1), :);
    % removing column 7 of mid_air_raw_1Hz because of missing data
    mid_air_raw_1Hz(:,7) = [];
    % cell array to double
    mid_air_raw_1Hz = cellfun(@str2num, mid_air_raw_1Hz);

% defining amount of samples
samples = [1:1:length(mid_air_raw_1Hz)];

% plotting data mid-air measurement
for i =1:size(mid_air_raw_1Hz,2)
    figure(1)
plot(samples,mid_air_raw_1Hz(:,i))
title('raw data of mid-air measurement at 1Hz')
hold on
end

% plotting mean of mid_air_raw_1Hz
mean_mid_air_raw_1Hz = mean(mid_air_raw_1Hz, 2);
plot(samples, mean_mid_air_raw_1Hz, '-g', 'LineWidth', 2)
hold off
    %fprintf('%d\n',round(mean_mid_air_raw_1Hz(:,1)));

% Defining x and y
x = (samples(20:size(samples, 2))-20)';
y_mid_air = mean_mid_air_raw_1Hz(20:size(mean_mid_air_raw_1Hz, 1)); 

% Implementing correction
mean_correct = mean(y_mid_air(end-4:end));
y_mid_air_correct = y_mid_air - mean_correct;

% Normalizing 
max_y_mid_air_correct = max(y_mid_air_correct)
y_mid_air_correct_norm = y_mid_air_correct / max_y_mid_air_correct;

figure(2)
plot(x,y_mid_air_correct_norm)
title('corrected and normalized mean mid-air COMET background measurement')
ylim([0 1])

%% changing name to BG
BGstart = (y_mid_air_correct_norm');

%% From PO2 to lifetime 
% %% Stern-Volmer
    % SV_eq_PO2 = (1/tauT1 - 1/tauT0)/kq; %Calculate PO2 based on lifetime
    % SV_eq_tauT1 = tauT0/(PO2*kg+1); %Calculate lifetime based on PO2
tauT0 = 200; %micro sec. 
kq = 398e-6; %mmHg^-1microS^-1 (nu in microsec, e-6 om in microsec te rekenen)

    %Create mono-exponent
PO2_in = [0:10:250]; %mmHg
lifetime_in=NaN(1, length(PO2_in));
for i=1:length(PO2_in)
%     lifetime_in(i) = tauT0/(tauT0*PO2_in(i)*kq+1);
lifetime_in(i)=1/(PO2_in(i)*kq+1/tauT0);
   ReciproqueTau(i)=PO2_in(i)*kq+1/tauT0;
end

figure(3)
subplot(2,1,1)
plot(PO2_in, lifetime_in)
title('Lifetime\_in' )
xlabel('PO2\_in')
subplot(2,1,2)
plot(PO2_in, ReciproqueTau)
title('Reciproque Tau')
xlabel('PO2\_in')

%Lifetime to mono-exponent
samples =[1:1:size(BGstart,2)];
for i=1: size(lifetime_in,2)
monoExp(i,:)=exp(-samples/lifetime_in(i)); %Every row is a mono-exp for a lifetime
end

figure(4)
plot(samples, monoExp(1,:),samples,monoExp(2,:),samples,monoExp(3,:),samples,monoExp(4,:),samples, monoExp(5,:),samples,monoExp(6,:),samples,monoExp(7,:),...
    samples,monoExp(8,:),samples,monoExp(9,:),samples,monoExp(10,:),samples,monoExp(11,:),samples,monoExp(12,:),samples,monoExp(13,:),samples,monoExp(14,:),...
    samples, monoExp(15,:),samples,monoExp(16,:),samples,monoExp(17,:),samples,monoExp(18,:),samples, monoExp(19,:),samples,monoExp(20,:),samples,monoExp(21,:),...
    samples,monoExp(22,:),samples, monoExp(23,:),samples,monoExp(24,:),samples,monoExp(25,:),samples,monoExp(26,:))
title('Mono-exponents based on lifetime_in' )
xlabel('Samples')

%% Combine lifetime & Background (BG)
 % Scaling mono-exponent - BG
percMonoExp=1-percBG; % %-monoExp in simulated signal

signal=NaN(size(monoExp));
for i = 1:size(monoExp,1)
   signal(i,:) = percBG*BGstart+percMonoExp*monoExp(i,:);
end
 % Plot an example
aLifetime=5; % random number to get an example
    figure(5)
    plot(samples,monoExp(aLifetime,:),'g',samples,BGstart,'b', samples,signal(aLifetime,:),'r')
    legend('monoExp', 'BGstart', 'Signal')
    title('MonoExp + BG + signal')
    ylim([0 1])

%% From mono-exp+BG to -> lifetime and PO2
lifetime_mid_air_new = zeros(1,size(lifetime_in,2));
lifetime_mid_air_input = zeros(1,size(lifetime_in,2));

for lifetimeNumber = [1:1:size(lifetime_in,2)]
    fitType=fittype('exp(-c*x)') ;
    x=samples';
    y= signal(lifetimeNumber,:)';
    fitCurve= fit(x,y,fitType,'StartPoint',[1/lifetime_in(lifetimeNumber)]);

    figure(6)
    plot(fitCurve, x, y)
    title('fit on combined signal')
    xlabel('samples')
    
    % determining lifetime
    lifetime_mid_air = coeffvalues(fitCurve);
    lifetime_mid_air_new(lifetimeNumber) = 1/lifetime_mid_air(1);
    
    lifetime_input = lifetime_in(lifetimeNumber);
    lifetime_mid_air_input(lifetimeNumber) = lifetime_input;
end

figure(7)
plot(lifetime_mid_air_input, lifetime_mid_air_new, '-O')
xlabel('input lifetime')
ylabel('new lifetime')
xlim([0 200])
ylim([0 200])
title('new vs. input lifetimes for 50% background mid-air')
grid on

figure(8)
loglog(lifetime_mid_air_input, lifetime_mid_air_new, '-O')
xlabel('input lifetime')
ylabel('new lifetime')
xlim([0 200])
ylim([0 200])
title('new vs. input lifetimes for 50% background mid-air')
grid on