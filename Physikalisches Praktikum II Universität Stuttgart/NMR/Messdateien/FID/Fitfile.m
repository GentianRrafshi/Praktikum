%%  Cleaning
clearvars
close all
clc
%  Load data
data_name_dict = ["FID50Glycerin.txt"];
%% 

for i = 1:numel(data_name_dict)
    M{i} = importdata(data_name_dict(i)); %#ok<SAGROW>
end

% Plot
hold on 
for i = 1:numel(M)
    
    
    x = M{i}.data(11500:40000,1);
    y = M{i}.data(11500:40000,2);
    plot(x,y)
    [pks,locs] = findpeaks(y,x,'MinPeakHeight',0.1,'MinPeakProminence',0.01);
     
    peaks{i} = pks; %#ok<SAGROW>
    locations{i} = locs; %#ok<SAGROW>
%     pause
end
shg

% Set up fittype and options.
ft = fittype( 'a*exp(-x/b)+c', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [3 4 0.4];

% Fit model to data.
[f, gof] = fit( x, y, ft, opts );

% Plot fit with data.

h = plot(x,f.a*exp(-x/f.b)+f.c,'LineWidth',2);
xlabel('Zeit in [ms]')
ylabel('U_{ind}(t) in [V]')
legend off;
grid on

