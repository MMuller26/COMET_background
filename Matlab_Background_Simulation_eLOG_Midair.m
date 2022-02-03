%% COMET background effect simulation logarithmic approach
% 2 feb 2022 - Myrte Schoenmakers & Marjolein Muller
% Simulate influence of background signal on "DF-signal" -> created as mono-exponent

clear all
close all
clc

%% Loading files:
folder = fileparts(which(mfilename)); 
addpath(genpath(folder));

[~, mid_air] = xlsread('COMET_BG_30xluchtledige_measurements_02-12-2021_09;59;50.xlsx');
percBG=0.1; % Percentage of BG in simulatied signal

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

%% Mid-air correction and normalization
% Defining x and y
x = (samples(20:size(samples, 2))-20)';
y_mid_air = mean_mid_air_raw_1Hz(20:size(mean_mid_air_raw_1Hz, 1)); 

% Implementing correction
mean_correct = mean(y_mid_air(end-4:end));
y_mid_air_correct = y_mid_air - mean_correct;

% Normalizing 
max_y_mid_air_correct = max(y_mid_air_correct)
y_mid_air_correct_norm = y_mid_air_correct / max_y_mid_air_correct;

norm_mid_air = y_mid_air_correct_norm;

figure(2)
plot(x,y_mid_air_correct_norm)
title('corrected and normalized mean mid-air COMET background measurement')
ylim([0 1])

%% changing name to BG
BGstart = (y_mid_air_correct_norm');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Start simulation -- Create PO2 list and it convert to lifetimes
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
aLifetime=1; % random number to get an example
    figure(5)
    plot(samples,monoExp(aLifetime,:),'g',samples,BGstart,'b', samples,signal(aLifetime,:),'r')
    legend('monoExp', 'BGstart', 'Signal')
    title('MonoExp + BG + signal')
    ylim([0 1])
    
%% Change mono-exponent to logarithmic scale
lifetime_mid_air_out = zeros(1,size(lifetime_in,2));
lifetime_mid_air_in = zeros(1,size(lifetime_in,2));
lnSignal=NaN(size(signal));

for lifetimeNumber = 1:1:size(signal,1)
    lnSignal(lifetimeNumber,:)=log(signal(lifetimeNumber,:));
end

figure(6)
subplot(2,1,1)
plot(samples, signal(1,:), samples, monoExp(1,:), samples, BGstart)
legend('signal example','monoExp', 'BGS')
title('Example of a signal combined from the shown monoExp and BGS' )
xlabel('Samples')
subplot(2,1,2)
plot(samples, lnSignal(1,:))
title('Example of ln of the signal shown above')
xlabel('Samples')
legend('signal example')

%% Fit to lnSignal
lifetime_out=NaN(1,size(lnSignal,1));

for i = 1:1:size(lnSignal,1)
    c = polyfit(samples,lnSignal(i,:),1);
    linFit=polyval(c,samples);
         
    figure(7)
    plot(samples,linFit,samples,lnSignal(i,:))
    legend('linear fit' , 'Signal')
    xlabel('samples' )
    
    lifetime_out(i)=-1/c(1);
end

%linfit verandert wel tijdens loop.
% fit is perfect
%% lifetime to PO2
PO2_mid_air_out =NaN(1, length(PO2_in));
for k = 1:length(PO2_in)
    PO2_mid_air_out(k) = (1/lifetime_in(k) - 1/tauT0)/kq; 
end

%% Compare lifetime_in with lifetime_out (and for PO2)
figure(100)
plot(lifetime_in, lifetime_out, '-O')
xlabel('Lifetime in')
ylabel('Lifetime out')
xlim([0 200])
ylim([0 200])
title('lifetime in vs. out for 0% background mid-air')
grid on

figure(101)
plot(PO2_in, PO2_mid_air_out, '-O')
xlabel('PO2 in')
ylabel('PO2 out')
xlim([0 250])
ylim([0 250])
title('PO2 in vs. out for 0% background mid-air')
grid on

