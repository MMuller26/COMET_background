%% Analysis of Continuous measurememnts mid-air and aluminium, 65 minutes, sampled at once per minute
clear all
close all
clc

%% Reading in files:
folder = fileparts(which(mfilename)); 
addpath(genpath(folder));

[~, continu_mid_air] = xlsread('measurements_23-12-2021_11;14;27.xlsx');
[~, continu_alum] = xlsread('measurements_23-12-2021_12;38;37.xlsx');

%% Data processing continuous skin MM measurement
% selecting the parameter column
Parameters = continu_mid_air(:,1);


% selecting the columns and rows of the raw data for the 130 good measurements
% MM
continu_mid_air_total = continu_mid_air(:,5:69);
continu_mid_air_raw = continu_mid_air_total(35:size(continu_mid_air_total, 1), :);
    % cell array to double
    continu_mid_air_raw = cellfun(@str2num, continu_mid_air_raw);
% MS
continu_alum_total = continu_alum(:,5:69);
continu_alum_raw = continu_alum_total(35:size(continu_alum_total, 1), :);
    % cell array to double
    continu_alum_raw = cellfun(@str2num, continu_alum_raw);

    
% defining amount of samples
samples = [1:1:length(continu_mid_air_raw)];

%% Calculating mean of 5 columns of raw data (5 minutes)
% mid-air
    % Define number of columns to average
    avg_cols = 5;
    % Use filter to calculate the moving average across EVERY combination of columns
    continu_mid_air_moving_avg = filter(ones(1,avg_cols)/avg_cols,1,continu_mid_air_raw,[],2);
    % Grab only the column averages that were actually wanted
    continu_mid_air_avg = continu_mid_air_moving_avg(:,avg_cols:avg_cols:end);
    
% aluminium
    % Use filter to calculate the moving average across EVERY combination of columns
    continu_alum_moving_avg = filter(ones(1,avg_cols)/avg_cols,1,continu_alum_raw,[],2);
    % Grab only the column averages that were actually wanted
    continu_alum_avg = continu_alum_moving_avg(:,avg_cols:avg_cols:end);

%% Plotting background over time mid-air
x = (samples(20:size(samples, 2))-20)';
RMSE_continu_mid_air_total = zeros(1,size(continu_mid_air_avg, 2));
RMSE_continu_mid_air_PO2_total = zeros(1,size(continu_mid_air_avg, 2));

for i = 1:1:size(continu_mid_air_avg, 2)

    % Defining y
    y_continu_mid_air = continu_mid_air_avg(20:size(continu_mid_air_avg, 1), i);

    % Implementing correction
    mean_correct = mean(y_continu_mid_air(end-4:end));
    y_continu_mid_air_correct = y_continu_mid_air - mean_correct;

    % Normalizing 
    max_y_continu_mid_air_correct = max(y_continu_mid_air_correct);
    y_continu_mid_air_correct_norm = y_continu_mid_air_correct / max_y_continu_mid_air_correct;

    norm_continu_mid_air = y_continu_mid_air_correct_norm;  

    figure(1)
    plot(x, norm_continu_mid_air)
    ylim([0 1])
    legend
    hold on

    % Combining with mono exponent by different percentages
    percBG=0.9; % Percentage of BG in simulatied signal

    % changing name to BG
    BGstart = (norm_continu_mid_air');

    % Stern-Volmer
    % SV_eq_PO2 = (1/tauT1 - 1/tauT0)/kq; %Calculate PO2 based on lifetime
    % SV_eq_tauT1 = tauT0/(PO2*kg+1); %Calculate lifetime based on PO2
    tauT0 = 200; %micro sec. 
    kq = 398e-6; %mmHg^-1microS^-1 (nu in microsec, e-6 om in microsec te rekenen)

    %Create mono-exponent
    PO2_in = [0:10:250]; %mmHg
    lifetime_in=NaN(1, length(PO2_in));
    
    for j=1:length(PO2_in)
        %   lifetime_in(i) = tauT0/(tauT0*PO2_in(i)*kq+1);
        lifetime_in(j)=1/(PO2_in(j)*kq+1/tauT0);
        ReciproqueTau(j)=PO2_in(j)*kq+1/tauT0;
    end

    %Lifetime to mono-exponent
    samples =[1:1:size(BGstart,2)];
    
    for k=1: size(lifetime_in,2)
        monoExp(k,:)=exp(-samples/lifetime_in(k)); %Every row is a mono-exp for a lifetime
    end

    % Combine lifetime & Background (BG)
    % Scaling mono-exponent - BG
    percMonoExp=1-percBG; % %-monoExp in simulated signal

    signal=NaN(size(monoExp));
    
    for l = 1:size(monoExp,1)
        signal(l,:) = percBG*BGstart+percMonoExp*monoExp(l,:);
    end

    % From mono-exp+BG to -> lifetime and PO2
    lifetime_continu_mid_air_new = zeros(1,size(lifetime_in,2));
    lifetime_continu_mid_air_input = zeros(1,size(lifetime_in,2));

    for lifetimeNumber = [1:1:size(lifetime_in,2)]
        fitType=fittype('exp(-c*x)') ;
        x=samples';
        y= signal(lifetimeNumber,:)';
        fitCurve= fit(x,y,fitType,'StartPoint',[1/lifetime_in(lifetimeNumber)]);

        % determining lifetime
        lifetime_continu_mid_air = coeffvalues(fitCurve);
        lifetime_continu_mid_air_new(lifetimeNumber) = 1/lifetime_continu_mid_air;

        lifetime_input = lifetime_in(lifetimeNumber);
        lifetime_continu_mid_air_input(lifetimeNumber) = lifetime_input;
    end
    
    % lifetime to PO2
    PO2_continu_mid_air_out =NaN(1, length(PO2_in));
    for m = 1:length(PO2_in)
        PO2_continu_mid_air_out(m) = (1/lifetime_continu_mid_air_new(m) - 1/tauT0)/kq; 
    end
    
    %plotten
    figure(2)
    plot(lifetime_continu_mid_air_input, lifetime_continu_mid_air_new, '-O')
    xlabel('input lifetime')
    ylabel('new lifetime')
    title('new vs. input lifetimes for 90% background last continues measurements mid-air')
    grid on
    xlim([0 200])
    ylim([0 200])
    legend
    hold on

    figure(3)
    plot(PO2_in, PO2_continu_mid_air_out, '-O')
    xlabel('input PO2')
    ylabel('new PO2')
    title('new vs. input PO2 for 90% background last continues measurements mid-air')
    grid on
    xlim([0 250])
    ylim([0 250])
    legend
    hold on
    
    % calculating root mean squared error 
    RMSE_continu_mid_air = sqrt(mean((lifetime_continu_mid_air_new-lifetime_continu_mid_air_input).^2));
    RMSE_continu_mid_air_total(i) = RMSE_continu_mid_air;
    
    RMSE_continu_mid_air_PO2 = sqrt(mean((PO2_continu_mid_air_out-PO2_in).^2));
    RMSE_continu_mid_air_PO2_total(i) = RMSE_continu_mid_air_PO2;
end

%% Plotting background over time aluminium
RMSE_continu_alum_total = zeros(1,size(continu_alum_avg, 2));
RMSE_continu_alum_PO2_total = zeros(1,size(continu_alum_avg, 2));

for i = 1:1:size(continu_alum_avg, 2)

    % Defining y
    y_continu_alum = continu_alum_avg(20:size(continu_alum_avg, 1), i);

    % Implementing correction
    mean_correct = mean(y_continu_alum(end-4:end));
    y_continu_alum_correct = y_continu_alum - mean_correct;

    % Normalizing 
    max_y_continu_alum_correct = max(y_continu_alum_correct);
    y_continu_alum_correct_norm = y_continu_alum_correct / max_y_continu_alum_correct;

    norm_continu_alum = y_continu_alum_correct_norm;  

    figure(4)
    plot(x, norm_continu_alum)
    ylim([0 1])
    legend
    hold on

    % Combining with mono exponent by different percentages
    percBG=0.9; % Percentage of BG in simulatied signal

    % changing name to BG
    BGstart = (norm_continu_alum');

    % Stern-Volmer
    % SV_eq_PO2 = (1/tauT1 - 1/tauT0)/kq; %Calculate PO2 based on lifetime
    % SV_eq_tauT1 = tauT0/(PO2*kg+1); %Calculate lifetime based on PO2
    tauT0 = 200; %micro sec. 
    kq = 398e-6; %mmHg^-1microS^-1 (nu in microsec, e-6 om in microsec te rekenen)

    %Create mono-exponent
    PO2_in = [0:10:250]; %mmHg
    lifetime_in=NaN(1, length(PO2_in));
    
    for j=1:length(PO2_in)
        %   lifetime_in(i) = tauT0/(tauT0*PO2_in(i)*kq+1);
        lifetime_in(j)=1/(PO2_in(j)*kq+1/tauT0);
        ReciproqueTau(j)=PO2_in(j)*kq+1/tauT0;
    end

    %Lifetime to mono-exponent
    samples =[1:1:size(BGstart,2)];
    
    for k=1: size(lifetime_in,2)
        monoExp(k,:)=exp(-samples/lifetime_in(k)); %Every row is a mono-exp for a lifetime
    end

    % Combine lifetime & Background (BG)
    % Scaling mono-exponent - BG
    percMonoExp=1-percBG; % %-monoExp in simulated signal

    signal=NaN(size(monoExp));
    
    for l = 1:size(monoExp,1)
        signal(l,:) = percBG*BGstart+percMonoExp*monoExp(l,:);
    end

    % From mono-exp+BG to -> lifetime and PO2
    lifetime_continu_alum_new = zeros(1,size(lifetime_in,2));
    lifetime_continu_alum_input = zeros(1,size(lifetime_in,2));

    for lifetimeNumber = [1:1:size(lifetime_in,2)]
        fitType=fittype('exp(-c*x)') ;
        x=samples';
        y= signal(lifetimeNumber,:)';
        fitCurve= fit(x,y,fitType,'StartPoint',[1/lifetime_in(lifetimeNumber)]);

        % determining lifetime
        lifetime_continu_alum = coeffvalues(fitCurve);
        lifetime_continu_alum_new(lifetimeNumber) = 1/lifetime_continu_alum;

        lifetime_input = lifetime_in(lifetimeNumber);
        lifetime_continu_alum_input(lifetimeNumber) = lifetime_input;
    end
    
    % lifetime to PO2
    PO2_continu_alum_out =NaN(1, length(PO2_in));
    for m = 1:length(PO2_in)
        PO2_continu_alum_out(m) = (1/lifetime_continu_alum_new(m) - 1/tauT0)/kq; 
    end
    
    %plotten
    figure(5)
    plot(lifetime_continu_alum_input, lifetime_continu_alum_new, '-O')
    xlabel('input lifetime')
    ylabel('new lifetime')
    title('new vs. input lifetimes for 90% background last continues measurements aluminium')
    grid on
    xlim([0 200])
    ylim([0 200])
    legend
    hold on

    figure(6)
    plot(PO2_in, PO2_continu_alum_out, '-O')
    xlabel('input PO2')
    ylabel('new PO2')
    title('new vs. input PO2 for 90% background last continues measurements aluminium')
    grid on
    xlim([0 250])
    ylim([0 250])
    legend
    hold on
    
    % calculating root mean squared error 
    RMSE_continu_alum = sqrt(mean((lifetime_continu_alum_new-lifetime_continu_alum_input).^2));
    RMSE_continu_alum_total(i) = RMSE_continu_alum;
    
    RMSE_continu_alum_PO2 = sqrt(mean((PO2_continu_alum_out-PO2_in).^2));
    RMSE_continu_alum_PO2_total(i) = RMSE_continu_alum_PO2;
end

%%
figure(7)
time = linspace(0, 65, 13);
plot(time, RMSE_continu_mid_air_total)
hold on
plot(time, RMSE_continu_alum_total)
legend('mid-air', 'aluminium')
ylabel('RMSE')
xlabel('time passed in minutes')
title('RMSE for prediction vs. input lifetime over time 90% background')

figure(8)
plot(time, RMSE_continu_mid_air_PO2_total)
hold on
plot(time, RMSE_continu_alum_PO2_total)
legend('mid-air', 'aluminium')
ylabel('RMSE')
xlabel('time passed in minutes')
title('RMSE for prediction vs. input PO2 over time 90% background')
