%% Analysis of old laser data pdp (palladium porforine) in decreasing concentration after normalization
clear all
close all
clc

%% Reading in files:
folder = fileparts(which(mfilename)); 
addpath(genpath(folder));

[~, ~, OL_A_pdp_LP60] = xlsread('Test1213_A1A2A3A4A5A6_pdp_Plaat2_LP80.xlsx');
[~, ~, OL_B_pdp_LP60] = xlsread('Test1213_B1B2B3B4B5B6_pdp_Plaat2_LP80.xlsx');

OL_A_pdp_LP60 = cell2mat(OL_A_pdp_LP60(101:2100, :));
OL_B_pdp_LP60 = cell2mat(OL_B_pdp_LP60(101:2100, :));


%% Plotting after calculating mean over every 3 columns, correcting, normalizing

for i = 1:3:size(OL_A_pdp_LP60,2)    
    
    % Averaging over 3 measurements, correcting startingpoint, height and normalizing
     mean_OL_A_pdp_LP60 = mean(OL_A_pdp_LP60(:, i:i+2),2);
     mean_A_correct = mean(mean_OL_A_pdp_LP60(end-4:end));
     y_OL_A_pdp_LP60 = mean_OL_A_pdp_LP60 - mean_A_correct;
     norm_OL_A_pdp_LP60 = y_OL_A_pdp_LP60/ max(y_OL_A_pdp_LP60);
     [~, index_A_max] = max(norm_OL_A_pdp_LP60);
     norm_OL_A_pdp_LP60 = norm_OL_A_pdp_LP60(index_A_max:end);

     mean_OL_B_pdp_LP60 = mean(OL_B_pdp_LP60(:, i:i+2),2);
     mean_B_correct = mean(mean_OL_B_pdp_LP60(end-4:end));
     y_OL_B_pdp_LP60 = mean_OL_B_pdp_LP60 - mean_B_correct;
     norm_OL_B_pdp_LP60 = y_OL_B_pdp_LP60/ max(y_OL_B_pdp_LP60);
     [~, index_B_max] = max(norm_OL_B_pdp_LP60);
     norm_OL_B_pdp_LP60 = norm_OL_B_pdp_LP60(index_B_max:end);
    
        % Plotting individual wells
         samples_A = [1:1:size(norm_OL_A_pdp_LP60, 1)]';

         figure(1)
         plot(samples_A,norm_OL_A_pdp_LP60)
         title('raw data of pdp measurements well A, decreasing concentrations')
         legend
         ylim([0 1])
         hold on

         samples_B = [1:1:size(norm_OL_B_pdp_LP60, 1)]';
         
         figure(2)
         plot(samples_B,norm_OL_B_pdp_LP60)
         title('raw data of pdp measurements well B, decreasing concentrations')
         legend
         ylim([0 1])
         hold on
         
end

%% Plotting after combining wells (+ correction and normalization)

for i = 1:3:size(OL_A_pdp_LP60,2)    
    
    % Averaging over 3 measurements
     mean_OL_A_pdp_LP60 = mean(OL_A_pdp_LP60(:, i:i+2),2);
     mean_OL_B_pdp_LP60 = mean(OL_B_pdp_LP60(:, i:i+2),2);
     
    % Averaging wells with same substance
     mean_OL_pdp_LP60 = mean([mean_OL_A_pdp_LP60 mean_OL_B_pdp_LP60], 2);
    
    % Correcting and normalizing
     mean_pdp_correct = mean(mean_OL_pdp_LP60(end-4:end));
     y_OL_pdp_LP60 = mean_OL_pdp_LP60 - mean_pdp_correct;
     norm_OL_pdp_LP60 = y_OL_pdp_LP60/ max(y_OL_pdp_LP60);
     [~, index_pdp_max] = max(norm_OL_pdp_LP60);
     norm_OL_pdp_LP60 = norm_OL_pdp_LP60(index_pdp_max:end);

     % Plotting combination of wells
     samples_pdp = [1:1:size(norm_OL_pdp_LP60, 1)]';
     
     figure(3)
     plot(samples_pdp,norm_OL_pdp_LP60)
     title('raw data of decreasing concentration of pdp measurements')
     legend
     ylim([0 1])
     hold on    
     
end