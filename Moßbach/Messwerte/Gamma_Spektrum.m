%%  Cleaning
clearvars
close all
clc

%% Curveplotting 

% Load data
 M = importdata('Gamma_Spektrum.ws5'); 
y=transpose(M.data(2:(end-1),2));
 s=size(y,2);
 x=linspace(0,s,s);

 %actual plot
 hold all
plot(x,y)
plot([38 38],get(gca, 'ylim'),':')
plot([94 94],get(gca, 'ylim'),':')
plot([135 135],get(gca, 'ylim'),':')
plot([543 543],get(gca, 'ylim'),':')
plot([727 727],get(gca, 'ylim'),':')
xlabel ('Energie [keV]','FontSize', 20)
ylabel ('Ereignisse pro Kanal','FontSize', 20)
set(gca,'FontSize',15);
xlim([0,s]);
    xticks([38 94 135 543 727])
    xticklabels([6.8 14.4 23.3 90 123])
    