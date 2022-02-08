%% Matlab skin MM Background COMET NL + known lifetime
clear all
close all
clc

%% Reading in files:
folder = fileparts(which(mfilename)); 
addpath(genpath(folder));

MM_BGS_1 = [];
MM_BGS_2 = [];
MM_BGS_3 = [];
MM_BGS_4 = [];
MM_BGS_5 = [];

for i = 2:1:6
    MM_BGS_2 = [MM_BGS_2, xlsread('NL_1011uur_BGS_meting2.xlsx', i, 'A2:A2001')];
    MM_BGS_3 = [MM_BGS_3, xlsread('NL_1134uur_MM_BGS_meting3.xlsx', i, 'A2:A2001')];
    MM_BGS_4 = [MM_BGS_4, xlsread('NL_1340uur_MM_BGS_meting4.xlsx', i, 'A2:A2001')];
    MM_BGS_5 = [MM_BGS_5, xlsread('NL_1532uur_MM_BGS_meting5.xlsx', i, 'A2:A2001')];
end

for j = 7:1:11
    MM_BGS_1 = [MM_BGS_1, xlsread('NL_0840uur_MM_Meting1_poging2', j, ' A2:A2001')];
end

% for i = 2:1:6
%     MM_BGS_2 = [MM_BGS_2, xlsread('NL_1014uur_MS_BGS_meting2.xlsx', i, 'A2:A2001')];
%     MM_BGS_3 = [MM_BGS_3, xlsread('NL_1138uur_MS_BGS_meting3.xlsx', i, 'A2:A2001')];
%     MM_BGS_4 = [MM_BGS_4, xlsread('NL_1342uur_MS_BGS_meting4.xlsx', i, 'A2:A2001')];
%     MM_BGS_5 = [MM_BGS_5, xlsread('NL_1535uur_MS_BGS_meting5.xlsx', i, 'A2:A2001')];
% end
% 
% for j = 7:1:11
%     MM_BGS_1 = [MM_BGS_1, xlsread('NL_8.50uur_Meting_1.xlsx', j, 'A2:A2001')];
% end

%% Voorbewerking (middeling + normalisatie)
% calculating mean of shots for BGS measurements
mean_MM_BGS_1 = -mean(MM_BGS_1(2:end, :), 2);
mean_MM_BGS_2 = -mean(MM_BGS_2(2:end, :), 2);
mean_MM_BGS_3 = -mean(MM_BGS_3(2:end, :), 2);
mean_MM_BGS_4 = -mean(MM_BGS_4(2:end, :), 2);
mean_MM_BGS_5 = -mean(MM_BGS_5(2:end, :), 2);

mean_MM_BGS_total = mean([mean_MM_BGS_1 mean_MM_BGS_2 mean_MM_BGS_3 mean_MM_BGS_4 mean_MM_BGS_5],2);

% defining amount of samples
samples = [1:1:length(mean_MM_BGS_1)];

% Implementing correction 
mean_correct = mean(mean_MM_BGS_total(end-4:end));
mean_correct_MM_BGS = mean_MM_BGS_total - mean_correct;
 
% Normalizing 
max_MM_BGS_correct  = max(mean_correct_MM_BGS)
MM_BGS_correct_norm = mean_correct_MM_BGS / max_MM_BGS_correct;

figure(2)
plot(samples, MM_BGS_correct_norm)
xlabel('time')
ylabel('lifetime')
title('corrected and normalized mean skin NL background measurement (MM)')
ylim([0 1])
 
%% changing name to BG
BGstart = (MM_BGS_correct_norm');

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

% figure(3)
% subplot(2,1,1)
% plot(PO2_in, lifetime_in)
% title('Lifetime\_in' )
% xlabel('PO2\_in')
% subplot(2,1,2)
% plot(PO2_in, ReciproqueTau)
% title('Reciproque Tau')
% xlabel('PO2\_in')

%Lifetime to mono-exponent
samples =[1:1:size(BGstart,2)];
for i=1: size(lifetime_in,2)
monoExp(i,:)=exp(-samples/lifetime_in(i)); %Every row is a mono-exp for a lifetime
end

% figure(4)
% plot(samples, monoExp(1,:),samples,monoExp(2,:),samples,monoExp(3,:),samples,monoExp(4,:),samples, monoExp(5,:),samples,monoExp(6,:),samples,monoExp(7,:),...
%     samples,monoExp(8,:),samples,monoExp(9,:),samples,monoExp(10,:),samples,monoExp(11,:),samples,monoExp(12,:),samples,monoExp(13,:),samples,monoExp(14,:),...
%     samples, monoExp(15,:),samples,monoExp(16,:),samples,monoExp(17,:),samples,monoExp(18,:),samples, monoExp(19,:),samples,monoExp(20,:),samples,monoExp(21,:),...
%     samples,monoExp(22,:),samples, monoExp(23,:),samples,monoExp(24,:),samples,monoExp(25,:),samples,monoExp(26,:))
% title('Mono-exponents based on lifetime_in' )
% xlabel('Samples')

%% Combine lifetime & Background (BG)
 % Scaling mono-exponent - BG
percBG=0.5;% Percentage of BG in simulatied signal 
percMonoExp=1-percBG; % %-monoExp in simulated signal

signal=NaN(size(monoExp));
for i = 1:size(monoExp,1)
   signal(i,:) = percBG*BGstart+percMonoExp*monoExp(i,:);
end
 % Plot an example
aLifetime=26; % random number to get an example
    figure(5)
    plot(samples,monoExp(aLifetime,:),'g',samples,BGstart,'b', samples,signal(aLifetime,:),'r')
    legend('monoExp', 'BGstart', 'Signal')
    title('MonoExp + BG + signal')
    ylim([0 1])

%% From mono-exp+BG to -> lifetime and PO2
lifetime_MM_BGS_new = zeros(1,size(lifetime_in,2));
lifetime_MM_BGS_input = zeros(1,size(lifetime_in,2));

for lifetimeNumber = [1:1:size(lifetime_in,2)]
    fitType=fittype('exp(-c*x)') ;
    x=samples';
    y= signal(lifetimeNumber,:)';
    fitCurve= fit(x,y,fitType,'StartPoint',[1/lifetime_in(lifetimeNumber)]);

    figure(6)
    plot(fitCurve, x, y)
    title('fit on combined signal')
    
    % determining lifetime
    lifetime_MM_BGS = coeffvalues(fitCurve);
    lifetime_MM_BGS_new(lifetimeNumber) = 1/lifetime_MM_BGS(1);
    
    lifetime_input = lifetime_in(lifetimeNumber);
    lifetime_MM_BGS_input(lifetimeNumber) = lifetime_input;
end

%% lifetime to PO2
PO2_skin_out =NaN(1, length(PO2_in));
for k = 1:length(PO2_in)
    PO2_skin_out(k) = (1/lifetime_MM_BGS_new(k) - 1/tauT0)/kq; 
end

%% plotting
figure(7)
plot(lifetime_MM_BGS_input, lifetime_MM_BGS_new, '-O')
xlabel('input lifetime')
ylabel('new lifetime')
xlim([0 200])
ylim([0 200])
title('new vs. input lifetimes for 40% background skin NL (MM)')
grid on

figure(8)
plot(PO2_in, PO2_skin_out, '-O')
xlabel('input PO2')
ylabel('new PO2')
xlim([0 250])
ylim([0 250])
title('new vs. input PO2 for 40% background skin NL (MM)')
grid on
