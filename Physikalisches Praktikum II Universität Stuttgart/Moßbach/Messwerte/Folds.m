%%  Cleaning
clearvars
close all
clc

%% Curveplotting für K4

% Load data
 M = importdata('K4.ws5'); 

 y=transpose(M.data(2:(end+1)/2,2));
 s=size(y,2);
 x=linspace(0,s,s);

 %actual plot
 hold on
    plot(x,y,':')
    set(gca, 'YTickLabel', get(gca, 'YTick'));
    xticks([0 21.33 42.67 64 86.33 106.67 128])
    xticklabels((-1)*[-3 -2 -1 0 1 2 3])
% LorentzFit
[xData, yData] = prepareCurveData( x, y );

% Set up fittype and options.
ft = fittype( 'P1./((x - A).^2 + P2) + P1./((x - B).^2+ P2) + Z', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [67 185 -20 10 4000];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
plot(fitresult);
legend off;
% Label axes
xlabel ('Geschwindigkeit v [mm/s]','FontSize', 20)
ylabel ('Ereignisse pro Kanal','FontSize', 20)
set(gca,'FontSize',20);
xlim([0,s])
grid on

fitresult

%% Curveplotting für FeSo4

% Load data
 M = importdata('FeSo4fold.ws5'); 

 y=transpose(M.data(2:(end-1),2));
 s=size(y,2);
 x=linspace(0,s,s);

 %actual plot
 hold on
    plot(x,y,':')
    set(gca, 'YTickLabel', get(gca, 'YTick'));
    xticks([0 12.6 25.2 37.8 50.4 63 75.6 88.2 100.8 113.4 126])
    xticklabels((-1)*[-5 -4 -3 -2 -1 0 1 2 3 4 5])

% LorentzFit
[xData, yData] = prepareCurveData( x, y );
% Set up fittype and options.
ft = fittype( 'P01./((x - A).^2 + P02) + P03./((x - B).^2+ P04) +Z', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [26 70 -15 5 -15 15 16500];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
plot(fitresult);
plot([25 25],get(gca, 'ylim'),':m')
plot([70 70],get(gca, 'ylim'),':m')
legend off;
% Label axes
xlabel ('Geschwindigkeit v [mm/s]','FontSize', 20)
ylabel ('Ereignisse pro Kanal','FontSize', 20)
set(gca,'FontSize',20);
xlim([0,s])
grid on

fitresult

%% Curveplotting für Eisen

% Load data
 M = importdata('Eisen.ws5'); 

 y=transpose(M.data(2:((end)/2+1) , 2));
 s=size(y,2);
 x=linspace(0,s,s);

 %actual plot
 hold on
    plot(x,y,':')
    set(gca, 'YTickLabel', get(gca, 'YTick'));
    xticks([0 7 14 21 28 35 42 49 56 64 71 78 85 92 99 106 113 120 128])
    xticklabels((-1)*[-9 -8 -7 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6 7 8 9])
% LorentzFit
[xData, yData] = prepareCurveData( x, y );

% Set up fittype and options.
ft = fittype( 'P01./((x - A).^2 + P02) + P03./((x - B).^2 + P04)+ P05./((x - C).^2 + P06) + P01./((x - D).^2 + P02) + P03./((x - E).^2+ P04) + P05./((x - F).^2 + P06) + Z', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [22 39 55 69 89 110 -15 10 -15 10 -15 10 10500];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
plot(fitresult);
legend off;
% Label axes
xlabel ('Geschwindigkeit v [mm/s]','FontSize', 20)
ylabel ('Ereignisse pro Kanal','FontSize', 20)
set(gca,'FontSize',20);
xlim([0,s])
grid on

fitresult