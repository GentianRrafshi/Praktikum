%%  Cleaning
clearvars
close all
clc
%%  Load data
data_name_dict = ["0,0050s.txt","0,0100s.txt","0,0150s.txt","0,0200s.txt","0,0250s.txt","0,0300s.txt"...
                  "0,0350s.txt","0,0400s.txt","0,0450s.txt","0,0500s.txt","0,0550s.txt","0,0600s.txt"];
                  

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
opts.StartPoint = [14 0.7742 360];

% Fit model to data.
[f, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.

h = plot(xn,f.a*exp(-xn/f.t)+f.c,'LineWidth',2);
xlabel('Zeit in [ms]')
ylabel('U_{ind}(t) in [V]')
legend off
grid on

