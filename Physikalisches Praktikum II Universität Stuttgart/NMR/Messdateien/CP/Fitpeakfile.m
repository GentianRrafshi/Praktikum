%%  Cleaning
clearvars
close all
clc
%%  Load data
data_name_dict = ["Filter2.csv"];

for i = 1:numel(data_name_dict)
    M{i} = importdata(data_name_dict(i)); %#ok<SAGROW>
end

%% Plot
hold on 
for i = 1:numel(M)
    
    
    x = M{i}.data(1:end,1);
    y = M{i}.data(1:end,2);
    plot(x,y)
    [pks,locs] = findpeaks(y,x,'MinPeakHeight',0.2,'MinPeakProminence',0.25);
     
    peaks{i} = pks; %#ok<SAGROW>
    locations{i} = locs; %#ok<SAGROW>
%     pause
end
shg

[xData, yData] = prepareCurveData( locs, pks );

% Set up fittype and options.
ft = fittype( 'a*exp(-x/b)+c', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [7 60 0.3];

% Fit model to data.
[f, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
% figure( 'Name', 'untitled fit 1' );
h = plot(x,f.a*exp(-x/f.b)+f.c,'LineWidth',2);
xlabel('Zeit in [ms]')
ylabel('U_{ind}(t) in [V]')
legend off;
grid on

