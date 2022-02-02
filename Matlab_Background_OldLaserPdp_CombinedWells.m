%% COMBINED WELLS: analysis of old laser data pdp (palladium porforine) in decreasing concentration vs. pbs, empty and medium
clear all
close all
clc

%% Reading in files:
folder = fileparts(which(mfilename)); 
addpath(genpath(folder));

[~, ~, OL_C1_PBS] = xlsread('Test1213_C1_pbs_Plaat1_LP80.xlsx');
[~, ~, OL_C2_PBS] = xlsread('Test1213_C2_pbs_Plaat1_LP80.xlsx');

OL_C1_PBS= cell2mat(OL_C1_PBS(101:2100, 1:18));
OL_C2_PBS = cell2mat(OL_C2_PBS(101:2100, 1:18));

[~, ~, OL_C6_leeg] = xlsread('Test1213_C6_leeg_Plaat1_LP80.xlsx');
[~, ~, OL_D6_leeg] = xlsread('Test1213_D6_leeg_Plaat1_LP80.xlsx');

OL_C6_leeg = cell2mat(OL_C6_leeg(101:2100, 1:18));
OL_D6_leeg = cell2mat(OL_D6_leeg(101:2100, 1:18));

[~, ~, OL_D1_medium] = xlsread('Test1213_D1_medium_Plaat1_LP80.xlsx');
[~, ~, OL_D2_medium] = xlsread('Test1213_D2_medium_Plaat1_LP80.xlsx');

OL_D1_medium = cell2mat(OL_D1_medium(101:2100, 1:18));
OL_D2_medium = cell2mat(OL_D2_medium(101:2100, 1:18));

[~, ~, OL_A_pdp] = xlsread('Test1213_A1A2A3A4A5A6_pdp_Plaat2_LP80.xlsx');
[~, ~, OL_B_pdp] = xlsread('Test1213_B1B2B3B4B5B6_pdp_Plaat2_LP80.xlsx');

OL_A_pdp = cell2mat(OL_A_pdp(101:2100, :));
OL_B_pdp = cell2mat(OL_B_pdp(101:2100, :));

%% Plotting after combining wells (+ correction and normalization)
total_OL_PBS = [];
total_OL_leeg = [];
total_OL_medium = [];
total_OL_pdp = [];

for i = 1:3:size(OL_A_pdp,2)    
    
    % Averaging over 3 measurements
     mean_OL_C1_PBS = mean(OL_C1_PBS(:, i:i+2),2);
     mean_OL_C2_PBS = mean(OL_C2_PBS(:, i:i+2),2);
     
     mean_OL_C6_leeg = mean(OL_C6_leeg(:, i:i+2),2);
     mean_OL_D6_leeg = mean(OL_D6_leeg(:, i:i+2),2);
     
     mean_OL_D1_medium = mean(OL_D1_medium(:, i:i+2),2);
     mean_OL_D2_medium = mean(OL_D2_medium(:, i:i+2),2);
     
     mean_OL_A_pdp = mean(OL_A_pdp(:, i:i+2),2);
     mean_OL_B_pdp = mean(OL_B_pdp(:, i:i+2),2);
     
    % Averaging wells with same substance
     mean_OL_PBS = mean([mean_OL_C1_PBS mean_OL_C2_PBS], 2);
     mean_OL_leeg = mean([mean_OL_C6_leeg mean_OL_D6_leeg], 2);
     mean_OL_medium = mean([mean_OL_D1_medium mean_OL_D2_medium], 2);
     mean_OL_pdp = mean([mean_OL_A_pdp mean_OL_B_pdp], 2);
    
    % Correcting and normalizing
     mean_pdp_correct = mean(mean_OL_pdp(end-4:end));
     y_OL_pdp = mean_OL_pdp - mean_pdp_correct;
     [~, index_pdp_max] = max(y_OL_pdp);
     correct_OL_pdp = y_OL_pdp(index_pdp_max:end);
  
     mean_PBS_correct = mean(mean_OL_PBS(end-4:end));
     y_OL_PBS = mean_OL_PBS - mean_PBS_correct;
     correct_OL_PBS = y_OL_PBS(index_pdp_max:end);
     
     mean_leeg_correct = mean(mean_OL_leeg(end-4:end));
     y_OL_leeg = mean_OL_leeg - mean_leeg_correct;
     correct_OL_leeg = y_OL_leeg(index_pdp_max:end);
     
     mean_medium_correct = mean(mean_OL_medium(end-4:end));
     y_OL_medium = mean_OL_medium - mean_medium_correct;
     correct_OL_medium = y_OL_medium(index_pdp_max:end);
     
     % Making vectors same length
     padded_OL_PBS = [correct_OL_PBS; zeros(2000-length(correct_OL_PBS),1)];
     padded_OL_leeg = [correct_OL_leeg; zeros(2000-length(correct_OL_leeg),1)];
     padded_OL_medium = [correct_OL_medium; zeros(2000-length(correct_OL_medium),1)];
     padded_OL_pdp = [correct_OL_pdp; zeros(2000-length(correct_OL_pdp),1)];

         % Plotting combination of wells
         samples = [1:1:size(padded_OL_pdp, 1)]';

         figure(1)
         plot(samples, padded_OL_PBS)
         title('raw data of PBS measurements')
         legend
         ylim([0 0.8])
         hold on    

         figure(2)
         plot(samples, padded_OL_leeg)
         title('raw data of empty measurements')
         legend
         ylim([0 0.8])
         hold on    

         figure(3)
         plot(samples, padded_OL_medium)
         title('raw data of medium measurements')
         legend
         ylim([0 0.8])
         hold on    

         figure(4)
         plot(samples, padded_OL_pdp)
         title('raw data of decreasing concentration of pdp measurements')
         legend
         ylim([0 2])
         hold on 
         
         % Making matrix of padded outcomes
         total_OL_PBS = [total_OL_PBS padded_OL_PBS];
         total_OL_leeg = [total_OL_leeg padded_OL_leeg];
         total_OL_medium = [total_OL_medium padded_OL_medium];
         total_OL_pdp = [total_OL_pdp padded_OL_pdp];

end

%% plotting per measurement moment and concentration of pdp

for j = 1:size(total_OL_PBS,2)
    
    figure(j+4)
    plot(samples,total_OL_PBS(:,j))
    hold on
    plot(samples, total_OL_leeg(:,j))
    plot(samples,total_OL_medium(:,j))
    plot(samples,total_OL_pdp(:,j))
    legend('PBS', 'empty', 'medium', 'pdp')
    title(sprintf('background signaal vs. pdp concentration: %0.1f µM', 270/(3^(j-1))))
    ylim([0 1.8])
    hold off
    
end

%% Verhouding amplitude DF en background (medium) bepalen
X = categorical({'270µM'; '90µM'; '30µM'; '10µM'; '3.3µM'; '1.1µM'});
X = reordercats(X,{'270µM'; '90µM'; '30µM'; '10µM'; '3.3µM'; '1.1µM'});

figure(11)
b = bar(X, [total_OL_pdp(1,:)' total_OL_medium(1,:)'], 0.8)
ylim([0 2])
legend('measured pdp signal', 'measured medium signal')
title('Maximum amplitude pdp vs. medium measurements')
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
ba = bar(X, [(total_OL_pdp(1,:)-total_OL_medium(1,:))' total_OL_medium(1,:)'], 'stacked', 'FaceColor','flat');
ba(1).CData = [0 0.4470 0.7410];
ba(2).CData = [0.8500 0.3250 0.0980];
ylim([0 2])
legend('true pdp signal', 'medium background signal')

   