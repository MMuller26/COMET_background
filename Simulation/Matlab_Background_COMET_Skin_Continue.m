%% Analysis of Continuous measurememnts skin MM and MS, 65 minutes, sampled at (1/30) hertz
clear all
close all
clc

%% Reading in files:
folder = fileparts(which(mfilename)); 
addpath(genpath(folder));

[~, continu_MM] = xlsread('measurements_16-12-2021_12;52;58.xlsx');
[~, continu_MS] = xlsread('measurements_16-12-2021_14;32;13.xlsx');

%% Data processing continuous skin MM measurement
% selecting the parameter column
Parameters = continu_MM(:,1);


% selecting the columns and rows of the raw data for the 130 good measurements
% MM
continu_MM_total = continu_MM(:,7:136);
continu_MM_raw = continu_MM_total(35:size(continu_MM_total, 1), :);
    % cell array to double
    continu_MM_raw = cellfun(@str2num, continu_MM_raw);
% MS
continu_MS_total = continu_MS(:,2:131);
continu_MS_raw = continu_MS_total(35:size(continu_MS_total, 1), :);
    % cell array to double
    continu_MS_raw = cellfun(@str2num, continu_MS_raw);

    
% defining amount of samples
samples = [1:1:length(continu_MM_raw)];

%% Calculating mean of 10 columns of raw data (5 minutes)
% MM
    % Define number of columns to average
    avg_cols = 10;
    % Use filter to calculate the moving average across EVERY combination of columns
    continu_MM_moving_avg = filter(ones(1,avg_cols)/avg_cols,1,continu_MM_raw,[],2);
    % Grab only the column averages that were actually wanted
    continu_MM_avg = continu_MM_moving_avg(:,avg_cols:avg_cols:end);
    
% MS
    % Use filter to calculate the moving average across EVERY combination of columns
    continu_MS_moving_avg = filter(ones(1,avg_cols)/avg_cols,1,continu_MS_raw,[],2);
    % Grab only the column averages that were actually wanted
    continu_MS_avg = continu_MS_moving_avg(:,avg_cols:avg_cols:end);

%% Plotting background over time MM
x = (samples(20:size(samples, 2))-20)';
RMSE_continu_MM_total = zeros(1,size(continu_MM_avg, 2));
RMSE_continu_MM_PO2_total = zeros(1,size(continu_MM_avg, 2));

for i = 1:1:size(continu_MM_avg, 2)

    % Defining y
    y_continu_MM = continu_MM_avg(20:size(continu_MM_avg, 1), i);

    % Implementing correction
    mean_correct = mean(y_continu_MM(end-4:end));
    y_continu_MM_correct = y_continu_MM - mean_correct;

    % Normalizing 
    max_y_continu_MM_correct = max(y_continu_MM_correct);
    y_continu_MM_correct_norm = y_continu_MM_correct / max_y_continu_MM_correct;

    norm_continu_MM = y_continu_MM_correct_norm;  

    figure(1)
    plot(x, norm_continu_MM)
    ylim([0 1])
    legend
    hold on

    % Combining with mono exponent by different percentages
    percBG=0.9; % Percentage of BG in simulatied signal

    % changing name to BG
    BGstart = (norm_continu_MM');

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
    lifetime_continu_MM_new = zeros(1,size(lifetime_in,2));
    lifetime_continu_MM_input = zeros(1,size(lifetime_in,2));

    for lifetimeNumber = [1:1:size(lifetime_in,2)]
        fitType=fittype('exp(-c*x)') ;
        x=samples';
        y= signal(lifetimeNumber,:)';
        fitCurve= fit(x,y,fitType,'StartPoint',[1/lifetime_in(lifetimeNumber)]);

        % determining lifetime
        lifetime_continu_MM = coeffvalues(fitCurve);
        lifetime_continu_MM_new(lifetimeNumber) = 1/lifetime_continu_MM;

        lifetime_input = lifetime_in(lifetimeNumber);
        lifetime_continu_MM_input(lifetimeNumber) = lifetime_input;
    end

    % lifetime to PO2
    PO2_continu_MM_out = NaN(1, length(PO2_in));
    for m = 1:length(PO2_in)
        PO2_continu_MM_out(m) = (1/lifetime_continu_MM_new(m) - 1/tauT0)/kq; 
    end
    
    % plotten
    figure(2)
    plot(lifetime_continu_MM_input, lifetime_continu_MM_new, '-O')
    xlabel('input lifetime')
    ylabel('new lifetime')
    title('new vs. input lifetimes for 90% background last continues measurements MM')
    grid on
    xlim([0 200])
    ylim([0 200])
    legend
    hold on

    figure(3)
    plot(PO2_in, PO2_continu_MM_out, '-O')
    xlabel('input PO2')
    ylabel('new PO2')
    title('new vs. input PO2 for 90% background last continues measurements MM')
    grid on
    xlim([0 250])
    ylim([0 250])
    legend
    hold on
    
    % calculating root mean squared error 
    RMSE_continu_MM = sqrt(mean((lifetime_continu_MM_new-lifetime_continu_MM_input).^2));
    RMSE_continu_MM_total(i) = RMSE_continu_MM;

    RMSE_continu_MM_PO2 = sqrt(mean((PO2_continu_MM_out-PO2_in).^2));
    RMSE_continu_MM_PO2_total(i) = RMSE_continu_MM_PO2;
end

% %% bar graph of RMSE continues MM
% figure(4)
% groups = categorical({'0-5 min.'; '5-10 min.'; '10-15 min.'; '15-20 min.'; '20-25 min.'; '25-30 min.'; '30-35 min.'; '35-40 min.'; '40-45 min.';'45-50 min.'; '50-55 min.'; '55-60 min.'; '60-65 min.'});
% bar(groups, RMSE_continu_MM_total)
% xlabel('passed time during continues measurement')
% ylabel('RMSE predicted vs. input lifetime')
% title('RMSE of predicted vs. input lifetime for different time in continues measurement MM')

%% Plotting background over time MS
RMSE_continu_MS_total = zeros(1, size(continu_MS_avg, 2));
RMSE_continu_MS_PO2_total = zeros(1, size(continu_MS_avg, 2));

for i = 1:1:size(continu_MS_avg, 2)
        
    % Defining y
    y_continu_MS = continu_MS_avg(20:size(continu_MS_avg, 1), i);

    % Implementing correction
    mean_correct = mean(y_continu_MS(end-4:end));
    y_continu_MS_correct = y_continu_MS - mean_correct;

    % Normalizing 
    max_y_continu_MS_correct = max(y_continu_MS_correct);
    y_continu_MS_correct_norm = y_continu_MS_correct / max_y_continu_MS_correct;

    norm_continu_MS = y_continu_MS_correct_norm;  
         
    figure(5)
    plot(x, norm_continu_MS)
    ylim([0 1])
    legend
    hold on

    % Combining with mono exponent by different percentages
    percBG=0.9; % Percentage of BG in simulatied signal

    % changing name to BG
    BGstart = (norm_continu_MS');

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
    lifetime_continu_MM_new = zeros(1,size(lifetime_in,2));
    lifetime_continu_MM_input = zeros(1,size(lifetime_in,2));

    for lifetimeNumber = [1:1:size(lifetime_in,2)]
        fitType=fittype('exp(-c*x)') ;
        x=samples';
        y= signal(lifetimeNumber,:)';
        fitCurve= fit(x,y,fitType,'StartPoint',[1/lifetime_in(lifetimeNumber)]);

        % determining lifetime
        lifetime_continu_MS = coeffvalues(fitCurve);
        lifetime_continu_MS_new(lifetimeNumber) = 1/lifetime_continu_MS;

        lifetime_input = lifetime_in(lifetimeNumber);
        lifetime_continu_MS_input(lifetimeNumber) = lifetime_input;
    end
    
    % lifetime to PO2
    PO2_continu_MS_out = NaN(1, length(PO2_in));
    for m = 1:length(PO2_in)
        PO2_continu_MS_out(m) = (1/lifetime_continu_MS_new(m) - 1/tauT0)/kq; 
    end

    %plotten
    figure(6)
    plot(lifetime_continu_MS_input, lifetime_continu_MS_new, '-O')
    xlabel('input lifetime')
    ylabel('new lifetime')
    title('new vs. input lifetimes for 90% background last continues measurements MS')
    grid on
    xlim([0 200])
    ylim([0 200])
    legend
    hold on

    figure(7)
    loglog(PO2_in, PO2_continu_MS_out, '-O')
    xlabel('input PO2')
    ylabel('new PO2')
    title('new vs. input PO2 for 90% background last continues measurements MS')
    grid on
    xlim([0 250])
    ylim([0 250])
    legend
    hold on
    
    % calculating root mean squared error 
    RMSE_continu_MS = sqrt(mean((lifetime_continu_MS_new-lifetime_continu_MS_input).^2));
    RMSE_continu_MS_total(i) = RMSE_continu_MS;
    
    RMSE_continu_MS_PO2 = sqrt(mean((PO2_continu_MS_out-PO2_in).^2));
    RMSE_continu_MS_PO2_total(i) = RMSE_continu_MS_PO2;
end

% %% bar graph of RMSE continues MS
% figure(8)
% groups = categorical({'0-5 min.'; '5-10 min.'; '10-15 min.'; '15-20 min.'; '20-25 min.'; '25-30 min.'; '30-35 min.'; '35-40 min.'; '40-45 min.';'45-50 min.'; '50-55 min.'; '55-60 min.'; '60-65 min.'});
% bar(groups, RMSE_continu_MS_total)
% xlabel('passed time during continues measurement')
% ylabel('RMSE predicted vs. input lifetime')
% title('RMSE of predicted vs. input lifetime for different time in continues measurement MS')

%%
figure(9)
time = linspace(0, 65, 13);
plot(time, RMSE_continu_MS_total)
hold on
plot(time, RMSE_continu_MM_total)
ylim([40 55])
xlim([0 65])
legend('MS', 'MM')
ylabel('RMSE')
xlabel('time passed in minutes')
title('RMSE for prediction vs. input lifetime over time 90% background')

figure(10)
plot(time, RMSE_continu_MS_PO2_total)
hold on
plot(time, RMSE_continu_MM_PO2_total)
legend('MS', 'MM')
ylabel('RMSE')
xlabel('time passed in minutes')
title('RMSE for prediction vs. input PO2 over time 90% background')