%%  Cleaning
clearvars
close all
clc
%%  Load data
data_name_dict = ["0,1000.txt","0,2000.txt","0,3000.txt","0,4000.txt","0,5000.txt",...
                  "0,6000.txt","0,7000.txt","0,8000.txt","0,9000.txt","1,0000.txt",...
                  "1,1000.txt","1,2000.txt"];
%
for i = 1:numel(data_name_dict)
    M{i} = importdata(data_name_dict(i)); %#ok<SAGROW>
end

%% Plot
hold on 
for i = 1:numel(M)
       
    x = M{i}.data(1:150:end,1);
    y = M{i}.data(1:150:end,2);
    plot(x,y)
    
end
%

xn=[100.0843  200.3803  300.1723  400.4683  500.2603  600.0523  700.3483];
yn=[-3.0576    -2.3835    -2.0223    -1.3240    -1.1126    -0.6252    -0.2263];
 
[xData, yData] = prepareCurveData( xn, yn );

% Set up fittype and options.
ft = fittype( 'a*(1-2*exp(-x/t))+c', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [3 1 1300];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.

h = plot( fitresult, xData, yData );
xlabel('Zeit in [ms]')
ylabel('U_{ind}(t) in [V]')
legend off
grid on

fitresult