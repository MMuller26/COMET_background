%% Analysis of old laser data pdp (palladium porforine) in decreasing concentration vs. empty, pbs and medium wells
clear all
close all
clc

% bespreken:
       % Waarom is bij PBS, leeg en medium ook minder snelle afname?
       % Startpunt (signaal pdp later dan pbs, medium en leeg) corrigeren?
       % Normaliseren?
       % Hoe weergeven? 

%% Reading in files:
folder = fileparts(which(mfilename)); 
addpath(genpath(folder));

[~, ~, OL_C1_PBS_LP60] = xlsread('Test1213_C1_pbs_Plaat1_LP80.xlsx');
[~, ~, OL_C2_PBS_LP60] = xlsread('Test1213_C2_pbs_Plaat1_LP80.xlsx');

OL_C1_PBS_LP60 = cell2mat(OL_C1_PBS_LP60(101:2100, 1:18));
OL_C2_PBS_LP60 = cell2mat(OL_C2_PBS_LP60(101:2100, 1:18));

[~, ~, OL_C6_leeg_LP60] = xlsread('Test1213_C6_leeg_Plaat1_LP80.xlsx');
[~, ~, OL_D6_leeg_LP60] = xlsread('Test1213_D6_leeg_Plaat1_LP80.xlsx');

OL_C6_leeg_LP60 = cell2mat(OL_C6_leeg_LP60(101:2100, 1:18));
OL_D6_leeg_LP60 = cell2mat(OL_D6_leeg_LP60(101:2100, 1:18));

[~, ~, OL_D1_medium_LP60] = xlsread('Test1213_D1_medium_Plaat1_LP80.xlsx');
[~, ~, OL_D2_medium_LP60] = xlsread('Test1213_D2_medium_Plaat1_LP80.xlsx');

OL_D1_medium_LP60 = cell2mat(OL_D1_medium_LP60(101:2100, 1:18));
OL_D2_medium_LP60 = cell2mat(OL_D2_medium_LP60(101:2100, 1:18));

[~, ~, OL_A_pdp_LP60] = xlsread('Test1213_A1A2A3A4A5A6_pdp_Plaat2_LP80.xlsx');
[~, ~, OL_B_pdp_LP60] = xlsread('Test1213_B1B2B3B4B5B6_pdp_Plaat2_LP80.xlsx');

OL_A_pdp_LP60 = cell2mat(OL_A_pdp_LP60(101:2100, :));
OL_B_pdp_LP60 = cell2mat(OL_B_pdp_LP60(101:2100, :));

%% Calculating mean over every 3 columns
mean3_OL_C1_PBS_LP60 = [];
mean3_OL_C2_PBS_LP60 = [];

mean3_OL_C6_leeg_LP60 = [];
mean3_OL_D6_leeg_LP60 = [];

mean3_OL_D1_medium_LP60 = [];
mean3_OL_D2_medium_LP60 = [];

mean3_OL_A_pdp_LP60 = [];
mean3_OL_B_pdp_LP60 = [];

for j = 1:3:size(OL_C1_PBS_LP60,2)
    mean_OL_C1_PBS_LP60 = mean(OL_C1_PBS_LP60(:, j:j+2),2);
    %norm_OL_C1_PBS_LP60 = mean_OL_C1_PBS_LP60/ max(mean_OL_C1_PBS_LP60);
    mean3_OL_C1_PBS_LP60 = [mean3_OL_C1_PBS_LP60, mean_OL_C1_PBS_LP60];
    mean_OL_C2_PBS_LP60 = mean(OL_C2_PBS_LP60(:, j:j+2),2);
    %norm_OL_C2_PBS_LP60 = mean_OL_C2_PBS_LP60/ max(mean_OL_C2_PBS_LP60);
    mean3_OL_C2_PBS_LP60 = [mean3_OL_C2_PBS_LP60, mean_OL_C2_PBS_LP60];
    
    mean_OL_C6_leeg_LP60 = mean(OL_C6_leeg_LP60(:, j:j+2),2);
    %norm_OL_C6_leeg_LP60 = mean_OL_C6_leeg_LP60/ max(mean_OL_C6_leeg_LP60);
    mean3_OL_C6_leeg_LP60 = [mean3_OL_C6_leeg_LP60, mean_OL_C6_leeg_LP60];
    mean_OL_D6_leeg_LP60 = mean(OL_D6_leeg_LP60(:, j:j+2),2);
    %norm_OL_D6_leeg_LP60 = mean_OL_D6_leeg_LP60/ max(mean_OL_D6_leeg_LP60);
    mean3_OL_D6_leeg_LP60 = [mean3_OL_D6_leeg_LP60, mean_OL_D6_leeg_LP60];
    
    mean_OL_D1_medium_LP60 = mean(OL_D1_medium_LP60(:, j:j+2),2);
    %norm_OL_D1_medium_LP60 = mean_OL_D1_medium_LP60/ max(mean_OL_D1_medium_LP60);
    mean3_OL_D1_medium_LP60 = [mean3_OL_D1_medium_LP60, mean_OL_D1_medium_LP60];
    mean_OL_D2_medium_LP60 = mean(OL_D2_medium_LP60(:, j:j+2),2);
    %norm_OL_D2_medium_LP60 = mean_OL_D2_medium_LP60/ max(mean_OL_D2_medium_LP60);
    mean3_OL_D2_medium_LP60 = [mean3_OL_D2_medium_LP60, mean_OL_D2_medium_LP60];
    
    mean_OL_A_pdp_LP60 = mean(OL_A_pdp_LP60(:, j:j+2),2);
    %norm_OL_A_pdp_LP60 = mean_OL_A_pdp_LP60/ max(mean_OL_A_pdp_LP60);
    mean3_OL_A_pdp_LP60 = [mean3_OL_A_pdp_LP60, mean_OL_A_pdp_LP60];
    mean_OL_B_pdp_LP60 = mean(OL_B_pdp_LP60(:, j:j+2),2);
    %norm_OL_B_pdp_LP60 = mean_OL_B_pdp_LP60/ max(mean_OL_B_pdp_LP60);
    mean3_OL_B_pdp_LP60 = [mean3_OL_B_pdp_LP60, mean_OL_B_pdp_LP60];
end

%% Plotting raw data per well
% defining amount of samples
samples = [1:1:size(mean3_OL_C1_PBS_LP60, 1)]';

% plotting data straight fiber
for k =1:size(mean3_OL_C1_PBS_LP60,2)
     figure(1)
     plot(samples,mean3_OL_C1_PBS_LP60(:,k))
     title('raw data of PBS measurements well C1')
     legend
     hold on
   
     figure(2)
     plot(samples,mean3_OL_C2_PBS_LP60(:,k))
     title('raw data of PBS measurements well C2')
     legend
     hold on
     
     figure(3)
     plot(samples,mean3_OL_C6_leeg_LP60(:,k))
     title('raw data of empty measurements well C6')
     legend
     hold on
     
     figure(4)
     plot(samples,mean3_OL_D6_leeg_LP60(:,k))
     title('raw data of empty measurements well D6')
     legend
     hold on 
     
     figure(5)
     plot(samples,mean3_OL_D1_medium_LP60(:,k))
     title('raw data of medium measurements well D1')
     legend
     hold on
          
     figure(6)
     plot(samples,mean3_OL_D2_medium_LP60(:,k))
     title('raw data of medium measurements well D2')
     legend
     hold on
     
     figure(7)
     plot(samples,mean3_OL_A_pdp_LP60(:,k))
     title('raw data of pdp measurements well A, decreasing concentrations')
     legend
     hold on
      
     figure(8)
     plot(samples,mean3_OL_B_pdp_LP60(:,k))
     title('raw data of pdp measurements well B, decreasing concentrations')
     legend
     hold on
end

%% Averaging wells with same substance
for l = 1:size(mean3_OL_C1_PBS_LP60, 2)
    mean_PBS_LP60(:,l) = mean([mean3_OL_C1_PBS_LP60(:,l) mean3_OL_C2_PBS_LP60(:, l)], 2);
    mean_leeg_LP60(:,l) = mean([mean3_OL_C6_leeg_LP60(:,l) mean3_OL_D6_leeg_LP60(:, l)], 2);
    mean_medium_LP60(:,l) = mean([mean3_OL_D1_medium_LP60(:,l) mean3_OL_D2_medium_LP60(:, l)], 2);
    mean_pdp_LP60(:,l) = mean([mean3_OL_A_pdp_LP60(:,l) mean3_OL_B_pdp_LP60(:, l)], 2);
end

%% plotting raw data with average of 2 wells
for m = 1:size(mean_PBS_LP60,2)
    figure(9)
    plot(samples,mean_PBS_LP60(:,m))
    title('raw data of PBS measurements')
    legend
    hold on
    
    figure(10)
    plot(samples,mean_leeg_LP60(:,m))
    title('raw data of empty measurements')
    legend
    hold on
    
    figure(11)
    plot(samples,mean_medium_LP60(:,m))
    title('raw data of medium measurements')
    legend
    hold on
    
    figure(12)
    plot(samples,mean_pdp_LP60(:,m))
    title('raw data of decreasing concentration of pdp measurements')
    legend
    hold on
end

%% plotting per measurement moment and concentration of pdp
for n = 1:size(mean_PBS_LP60,2)
    figure(n+13)
    plot(samples,mean_PBS_LP60(:,n))
    hold on
    plot(samples,mean_leeg_LP60(:,n))
    plot(samples,mean_medium_LP60(:,n))
    plot(samples,mean_pdp_LP60(:,n))
    legend('PBS', 'empty', 'medium', 'pdp')
    title(sprintf('background signaal vs. pdp concentration: %0.1f', 270/(3^(n-1))))
    hold off
end
%% Delete rows with 0's NIET VAN TOEPASSING OP SELECTIE, even hier bewaard
% row_C1_LP60_zeros = [];
% row_C2_LP60_zeros = [];
% 
% row_C6_LP60_zeros = [];
% row_D6_LP60_zeros = [];
% 
% row_D1_LP60_zeros = [];
% row_D2_LP60_zeros = [];
% 
% for i = 1:size(OL_C1_PBS_LP60,2)
%     index_C1_LP60_zeros = find(OL_C1_PBS_LP60(:,i) == 0);
%     row_C1_LP60_zeros = [row_C1_LP60_zeros , index_C1_LP60_zeros];
%     index_C2_LP60_zeros = find(OL_C2_PBS_LP60(:,i) == 0);
%     row_C2_LP60_zeros = [row_C2_LP60_zeros , index_C2_LP60_zeros];
%     
%     index_C6_LP60_zeros = find(OL_C6_leeg_LP60(:,i) == 0);
%     row_C6_LP60_zeros = [row_C6_LP60_zeros , index_C6_LP60_zeros];
%     index_D6_LP60_zeros = find(OL_D6_leeg_LP60(:,i) == 0);
%     row_D6_LP60_zeros = [row_D6_LP60_zeros , index_D6_LP60_zeros];
%     
%     index_D1_LP60_zeros = find(OL_D1_medium_LP60(:,i) == 0);
%     row_D1_LP60_zeros = [row_D1_LP60_zeros , index_D1_LP60_zeros];
%     index_D2_LP60_zeros = find(OL_D2_medium_LP60(:,i) == 0);
%     row_D2_LP60_zeros = [row_D2_LP60_zeros , index_D2_LP60_zeros];
% end
%     
% OL_C1_PBS_LP60(row_C2_LP60_zeros,:) = []; %hier voor het gemak zelfde rijen als bij C1 weggehaald zodat ze goed te vergelijken zijn
% OL_C2_PBS_LP60(row_C2_LP60_zeros,:) = [];
