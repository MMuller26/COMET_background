%% Matlab skin MM 2Hz Background COMET + known lifetime
clear all
close all
clc

%% Reading in files:
folder = fileparts(which(mfilename)); 
addpath(genpath(folder));

[~, skinMM] = xlsread('HuidMM_30xaanlsuitend_15xPauze10sfZonderdruk_15xPauze10sMetdruk_measurements_02-12-2021_10;20;09.xlsx'); 
percBG=0.5;% Percentage of BG in simulatied signal

%% COMET background measurement 2 Hz without pressure on skin MM
MM_2Hz_NoPress = skinMM(:,2:31);
MM_raw_2Hz_NoPress = MM_2Hz_NoPress(35:size(MM_2Hz_NoPress, 1), :);
    % removing measurement column 2 because of missing data
    MM_raw_2Hz_NoPress(:,2) = [];
    % cell array to double
    MM_raw_2Hz_NoPress = cellfun(@str2num, MM_raw_2Hz_NoPress);

% defining amount of samples
samples = [1:1:length(MM_raw_2Hz_NoPress)];

% plotting data MM_raw_2Hz_NoPress
for i =1:size(MM_raw_2Hz_NoPress,2)
    figure(1)
plot(samples,MM_raw_2Hz_NoPress(:,i))
title('MM raw data without pressure 2Hz')
hold on
end

% plotting mean of MM_raw_2Hz_NoPress
mean_MM_raw_2Hz_NoPress = mean(MM_raw_2Hz_NoPress, 2);
plot(samples, mean_MM_raw_2Hz_NoPress, '-g', 'LineWidth', 2)
hold off
    %fprintf('%d\n',round(mean_MM_raw_2Hz_NoPress(:,1)));



% Defining x and y
x = (samples(20:size(samples, 2))-20)';
y_MM_2Hz = mean_MM_raw_2Hz_NoPress(20:size(mean_MM_raw_2Hz_NoPress, 1));

% Implementing correction
mean_correct = mean(y_MM_2Hz(end-4:end));
y_MM_2Hz_correct = y_MM_2Hz - mean_correct;

% Normalizing 
max_y_MM_2Hz_correct = max(y_MM_2Hz_correct)
y_MM_2Hz_correct_norm = y_MM_2Hz_correct / max_y_MM_2Hz_correct;

figure(2)
plot(x,y_MM_2Hz_correct_norm)
title('corrected and normalized mean skin COMET background measurement')
ylim([0 1])

%% changing name to BG
BGstart = (y_MM_2Hz_correct_norm');

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
lifetime_skin_2Hz_new = zeros(1,size(lifetime_in,2));
lifetime_skin_2Hz_input = zeros(1,size(lifetime_in,2));

for lifetimeNumber = [1:1:size(lifetime_in,2)]
    fitType=fittype('exp(-c*x)') ;
    x=samples';
    y= signal(lifetimeNumber,:)';
    fitCurve= fit(x,y,fitType,'StartPoint',[1/lifetime_in(lifetimeNumber)]);

    figure(6)
    plot(fitCurve, x, y)
    title('fit on combined signal')
    
    % determining lifetime
    lifetime_skin_2Hz = coeffvalues(fitCurve);
    lifetime_skin_2Hz_new(lifetimeNumber) = 1/lifetime_skin_2Hz(1);
    
    lifetime_input = lifetime_in(lifetimeNumber);
    lifetime_skin_2Hz_input(lifetimeNumber) = lifetime_input;
end

%% lifetime to PO2
PO2_skin_out =NaN(1, length(PO2_in));
for k = 1:length(PO2_in)
    PO2_skin_out(k) = (1/lifetime_skin_2Hz_new(k) - 1/tauT0)/kq; 
end

%% plotting
figure(7)
plot(lifetime_skin_2Hz_input, lifetime_skin_2Hz_new, '-O')
xlabel('input lifetime')
ylabel('new lifetime')
xlim([0 200])
ylim([0 200])
title('new vs. input lifetimes for 10% background skin 2Hz')
grid on

figure(8)
plot(PO2_in, PO2_skin_out, '-O')
xlabel('input PO2')
ylabel('new PO2')
xlim([0 250])
ylim([0 250])
title('new vs. input PO2 for 10% background skin 2Hz')
grid on