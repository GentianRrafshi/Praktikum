x = [ -2 -1 0 1 2];
y = [0.08194 0.1375 0.1628 0.1419 0.08194];

[xData, yData] = prepareCurveData( x, y );

% Set up fittype and options.
ft = fittype( 'gauss1' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0];
opts.StartPoint = [0.1628 1 1.24482548539815];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
hold all
plot(x,y,'.','MarkerSize',30)
set(gca,'FontSize',20);
h = plot( fitresult, xData, yData );
legend off
% Label axes
xlabel('Index für Eigenfrequenz \nu_p','FontSize', 20)
ylabel('Leistung P [mW]','FontSize', 20)
grid on


