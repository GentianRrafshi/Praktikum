%%  Cleaning
clearvars
close all
clc
%%  Load data
data_name_dict = ["0,1000.txt","0,2000.txt","0,3000.txt","0,4000.txt","0,5000.txt",...
                  "0,6000.txt","0,7000.txt","0,8000.txt","0,9000.txt","1,0000.txt",...
                  "1,1000.txt","1,2000.txt","1,3000.txt"];

for i = 1:numel(data_name_dict)
    M{i} = importdata(data_name_dict(i)); %#ok<SAGROW>
end

%% Plot
hold on 
for i = 1:numel(M)
    
    
    x = M{i}.data(1:150:end,1);
    y = M{i}.data(1:150:end,2);
    plot(x,y)
    [pks,locs] = findpeaks(y,x,'MinPeakHeight',0.3,'MinPeakProminence',0.05);
     
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

   xn([1,2,3,8,13])=[];
   yn([1,2,3,8,13])=[];


%
for i = 1:4
    yn(i)=-yn(i);
end
 
[xData, yData] = prepareCurveData( xn, yn );



% Set up fittype and options.
ft = fittype( 'a*(1-2*exp(-x/t))+c', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.860089651552925 0.514657381467371 0.141886338627215];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.

h = plot( fitresult, xData, yData );
xlabel('Zeit in [ms]')
ylabel('U_{ind}(t) in [V]')
legend off
grid on

