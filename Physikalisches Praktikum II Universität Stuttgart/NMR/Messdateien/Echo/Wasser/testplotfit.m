%%  Cleaning
clearvars
close all
clc
%%  Load data
data_name_dict = ["0,0125s.txt","0,0250s.txt","0,0375s.txt","0,0500s.txt","0,0625s.txt",...
                  "0,0750s.txt","0,0875s.txt","0,1000s.txt","0,1125s.txt","0,1125s.txt",...
                  "0,1250s.txt","0,1375s.txt","0,1500s.txt"];

for i = 1:numel(data_name_dict)
    M{i} = importdata(data_name_dict(i)); %#ok<SAGROW>
end

%% Plot
hold on 
for i = 1:numel(M)
    
    
    x = M{i}.data(1:150:end,1);
    y = M{i}.data(1:150:end,2);
    plot(x,y)
    [pks,locs] = findpeaks(y,x,'MinPeakHeight',0.2,'MinPeakProminence',0.05);
     
    peaks{i} = pks; %#ok<SAGROW>
    locations{i} = locs; %#ok<SAGROW>

end



xn = [];
yn = [];
for i = 1:numel(peaks)
%     scatter((locations{i}(2)),peaks{i}(2))
    xn = [xn (locations{i}(end))]; %#ok<AGROW>
    yn = [yn (peaks{i}(end))];  %#ok<AGROW>
end

[xData, yData] = prepareCurveData( xn, yn );

% Set up fittype and options.
ft = fittype( 'a*exp(-x/t)+c', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [5 -1 600];

% Fit model to data.
[f, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.

h = plot(xn,f.a*exp(-xn/f.t)+f.c,'LineWidth',2);
xlabel('Zeit in [ms]')
ylabel('U_{ind}(t) in [V]')
legend off
grid on

