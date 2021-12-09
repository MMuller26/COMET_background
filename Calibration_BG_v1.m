%% MM
clear all
close all
clc
%% Input values
filename = "20211123_avg_monoExp+BG27-47"; % in LV gemaakt. BG OL exp.2021-05 HR
percBG=0.3; % Percentage of BG in simulatied signal 

%% Load BG
BGall = importdata(filename);
BGstart = BGall(40:size(BGall,2));

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

figure(1)
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

figure(2)
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
    figure(3)
    plot(samples,monoExp(aLifetime,:),'g',samples,BGstart,'b', samples,signal(aLifetime,:),'r')
    legend('monoExp', 'BGstart', 'Signal')
    title('MonoExp + BG + signal')

%% From mono-exp+BG to -> lifetime and PO2

%Fit lifetime
lifetimeNumber=1;
fitType=fittype('b*exp(-c*x)') ;
x=samples';
y=signal(lifetimeNumber,:)';
fitCurve= fit(x,y,fitType,'StartPoint',[1;1/lifetime_in(lifetimeNumber)]);
% input values: 1 for b (want dat gebruiken wij ook bij maken mono-exponent
% hierboven). & voor c ook precies goede indicatie o.b.v. maken
% monoexponent. Je ziet heel sterk verslechtering naarmate PO2 toeneemt..
% Waarom?

figure(4)
plot(fitCurve,samples', signal(1,:)')

%%
x=[1,2,4,6,8]';
y=[100,140,160,170,175].';
g = fittype('a-b*exp(-c*x)');
f0 = fit(x,y,g,'StartPoint',[[ones(size(x)), -exp(-x)]\y; 1]);
xx = linspace(1,8,50);
plot(x,y,'o',xx,f0(xx),'r-');
%Lifetime to PO2
