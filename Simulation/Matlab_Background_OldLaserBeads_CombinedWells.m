%% COMBINED WELLS: analysis of old laser data ptf4 beads (OxNano) in decreasing concentration vs. pbs, empty and medium
clear all
close all
clc

%% Reading in files:
folder = fileparts(which(mfilename)); 
addpath(genpath(folder));

[~, ~, OL_C1_PBS] = xlsread('Test9_C1_pbs_Plaat1_LP80.xlsx');
[~, ~, OL_C2_PBS] = xlsread('Test9_C2_pbs_Plaat1_LP80.xlsx');

OL_C1_PBS= cell2mat(OL_C1_PBS(1:2000,:));
OL_C2_PBS = cell2mat(OL_C2_PBS(1:2000,:));
%OL_C2_PBS = [zeros(2000, 3) OL_C2_PBS];

[~, ~, OL_C6_leeg] = xlsread('Test9_C6_leeg_Plaat1_LP80.xlsx');
[~, ~, OL_D6_leeg] = xlsread('Test9_D6_leeg_Plaat1_LP80.xlsx');

OL_C6_leeg = cell2mat(OL_C6_leeg(1:2000,:));
OL_D6_leeg = cell2mat(OL_D6_leeg(1:2000,:));
%OL_D6_leeg = [zeros(2000, 3) OL_D6_leeg];

[~, ~, OL_D1_medium] = xlsread('Test9_D1_medium_Plaat1_LP80.xlsx');
[~, ~, OL_D2_medium] = xlsread('Test9_D2_medium_Plaat1_LP80.xlsx');

OL_D1_medium = cell2mat(OL_D1_medium(1:2000,:));
OL_D2_medium = cell2mat(OL_D2_medium(1:2000,:));
%OL_D2_medium = [zeros(2000, 3) OL_D2_medium];

[~, ~, OL_C_beads] = xlsread('Test9_C1C2C3_beads_Plaat2_LP80.xlsx');
[~, ~, OL_D_beads] = xlsread('Test9_D1D2D3_beads_Plaat2_LP80.xlsx');

OL_C_beads = cell2mat(OL_C_beads(1:2000,:));
OL_D_beads = cell2mat(OL_D_beads(1:2000,:));


%% Plotting after combining wells (+ correction and normalization)
total_OL_PBS = [];
total_OL_leeg = [];
total_OL_medium = [];
total_OL_beads = [];

for i = 1:3:size(OL_C2_PBS,2)    
    
    % Averaging over 3 measurements
     mean_OL_C1_PBS = mean(OL_C1_PBS(:, i:i+2),2);
     mean_OL_C2_PBS = mean(OL_C2_PBS(:, i:i+2),2);
     
     mean_OL_C6_leeg = mean(OL_C6_leeg(:, i:i+2),2);
     mean_OL_D6_leeg = mean(OL_D6_leeg(:, i:i+2),2);
     
     mean_OL_D1_medium = mean(OL_D1_medium(:, i:i+2),2);
     mean_OL_D2_medium = mean(OL_D2_medium(:, i:i+2),2);
     
     mean_OL_C_beads = mean(OL_C_beads(:, i:i+2),2);
     mean_OL_D_beads = mean(OL_D_beads(:, i:i+2),2);
     
    % Averaging wells with same substance
     mean_OL_PBS = mean([mean_OL_C1_PBS mean_OL_C2_PBS], 2);
     mean_OL_leeg = mean([mean_OL_C6_leeg mean_OL_D6_leeg], 2);
     mean_OL_medium = mean([mean_OL_D1_medium mean_OL_D2_medium], 2);
     mean_OL_beads = mean([mean_OL_C_beads mean_OL_D_beads], 2);
    
    % Correcting and normalizing
     mean_beads_correct = mean(mean_OL_beads(end-4:end));
     y_OL_beads = mean_OL_beads - mean_beads_correct;
     [~, index_beads_max] = max(y_OL_beads);
     correct_OL_beads = y_OL_beads(index_beads_max:end);
  
     mean_PBS_correct = mean(mean_OL_PBS(end-4:end));
     y_OL_PBS = mean_OL_PBS - mean_PBS_correct;
     correct_OL_PBS = y_OL_PBS(index_beads_max:end);
     
     mean_leeg_correct = mean(mean_OL_leeg(end-4:end));
     y_OL_leeg = mean_OL_leeg - mean_leeg_correct;
     correct_OL_leeg = y_OL_leeg(index_beads_max:end);
     
     mean_medium_correct = mean(mean_OL_medium(end-4:end));
     y_OL_medium = mean_OL_medium - mean_medium_correct;
     correct_OL_medium = y_OL_medium(index_beads_max:end);
     
     % Making vectors same length
     padded_OL_PBS = [correct_OL_PBS; zeros(2000-length(correct_OL_PBS),1)];
     padded_OL_leeg = [correct_OL_leeg; zeros(2000-length(correct_OL_leeg),1)];
     padded_OL_medium = [correct_OL_medium; zeros(2000-length(correct_OL_medium),1)];
     padded_OL_beads = [correct_OL_beads; zeros(2000-length(correct_OL_beads),1)];
         
         % Making matrix of padded outcomes
         total_OL_PBS = [total_OL_PBS padded_OL_PBS];
         total_OL_leeg = [total_OL_leeg padded_OL_leeg];
         total_OL_medium = [total_OL_medium padded_OL_medium];
         total_OL_beads = [total_OL_beads padded_OL_beads];

end

% %%
% mean_OL_PBS = mean(OL_C1_PBS(:,1:3),2);
% mean_OL_leeg = mean(OL_C6_leeg(:,1:3),2);
% mean_OL_medium = mean(OL_D1_medium(:,1:3),2);
% mean_OL_C_beads_f = mean(OL_C_beads(:, 1:3),2);
% mean_OL_D_beads_f = mean(OL_D_beads(:, 1:3),2);
% mean_OL_beads =mean([mean_OL_C_beads_f mean_OL_D_beads_f], 2);
% 
%  % Correcting and normalizing
%      mean_beads_correct = mean(mean_OL_beads(end-4:end));
%      y_OL_beads = mean_OL_beads - mean_beads_correct;
%      [~, index_beads_max] = max(y_OL_beads);
%      correct_OL_beads = y_OL_beads(index_beads_max:end);
%   
%      mean_PBS_correct = mean(mean_OL_PBS(end-4:end));
%      y_OL_PBS = mean_OL_PBS - mean_PBS_correct;
%      correct_OL_PBS = y_OL_PBS(index_beads_max:end);
%      
%      mean_leeg_correct = mean(mean_OL_leeg(end-4:end));
%      y_OL_leeg = mean_OL_leeg - mean_leeg_correct;
%      correct_OL_leeg = y_OL_leeg(index_beads_max:end);
%      
%      mean_medium_correct = mean(mean_OL_medium(end-4:end));
%      y_OL_medium = mean_OL_medium - mean_medium_correct;
%      correct_OL_medium = y_OL_medium(index_beads_max:end);
%      
%      % Making vectors same length
%      padded_OL_PBS = [correct_OL_PBS; zeros(2000-length(correct_OL_PBS),1)];
%      padded_OL_leeg = [correct_OL_leeg; zeros(2000-length(correct_OL_leeg),1)];
%      padded_OL_medium = [correct_OL_medium; zeros(2000-length(correct_OL_medium),1)];
%      padded_OL_beads = [correct_OL_beads; zeros(2000-length(correct_OL_beads),1)];
%      
% total_OL_PBS = [padded_OL_PBS total_OL_PBS];
% total_OL_leeg = [padded_OL_leeg total_OL_leeg];
% total_OL_medium = [padded_OL_medium total_OL_medium];
% total_OL_beads = [padded_OL_beads total_OL_beads];

%%  Plotting combination of wells
 samples = [1:1:size(total_OL_beads, 1)]';

 for n = 1:1:size(total_OL_PBS,2)
     figure(1)
     plot(samples, total_OL_PBS(:,n))
     title('raw data of PBS measurements')
     legend
     ylim([0 1])
     hold on    

     figure(2)
     plot(samples, total_OL_leeg(:,n))
     title('raw data of empty measurements')
     legend
     ylim([0 1])
     hold on    

     figure(3)
     plot(samples, total_OL_medium(:,n))
     title('raw data of medium measurements')
     legend
     ylim([0 1])
     hold on    

     figure(4)
     plot(samples, total_OL_beads(:,n))
     title('raw data of decreasing concentration of beads measurements')
     legend
     ylim([0 1.8])
     hold on 
     
 end

%% plotting per measurement moment and concentration of beads

for j = 1:size(total_OL_PBS,2)
    
    figure(j+4)
    plot(samples,total_OL_PBS(:,j))
    hold on
    plot(samples, total_OL_leeg(:,j))
    plot(samples,total_OL_medium(:,j))
    plot(samples,total_OL_beads(:,j))
    legend('PBS', 'empty', 'medium', 'beads')
    title(sprintf('background signaal vs. beads concentration: %0.3f mg/ml', 5.4/(3^(j-1))))
    ylim([0 1.8])
    hold off
    
end

%% Verhouding amplitude DF en background (medium) bepalen
X = categorical({'5.4mg/ml'; '1.8mg/ml'; '0.6mg/ml'});%; '0.2mg/ml'; '0.06mg/ml'; '0.02mg/ml'});
X = reordercats(X,{'5.4mg/ml'; '1.8mg/ml'; '0.6mg/ml'});%; '0.2mg/ml'; '0.06mg/ml'; '0.02mg/ml'});

figure(11)
b = bar(X, [total_OL_beads(1,:)' total_OL_medium(1,:)'], 0.8)
ylim([0 2])
legend('measured beads signal', 'measured medium signal')
title('Maximum amplitude beads vs. medium measurements')
xtips1 = b(1).XEndPoints;
ytips1 = b(1).YEndPoints;
labels1 = string(round(b(1).YData,2));
text(xtips1,ytips1,labels1,'HorizontalAlignment','center',...
    'VerticalAlignment','bottom')
xtips2 = b(2).XEndPoints;
ytips2 = b(2).YEndPoints;
labels2 = string(round(b(2).YData,2));
text(xtips2,ytips2,labels2,'HorizontalAlignment','center',...
    'VerticalAlignment','bottom')

%% Andere weergave verhoudingen amplitudes
figure(12)
ba = bar(X, [(total_OL_beads(1,:)-total_OL_medium(1,:))' total_OL_medium(1,:)'], 'stacked', 'FaceColor','flat');
ba(1).CData = [0 0.4470 0.7410];
ba(2).CData = [0.8500 0.3250 0.0980];
ylim([0 2])
legend('true beads signal', 'medium background signal')

   