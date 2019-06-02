%Messdaten

x=[1.0 1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8 1.9 2.0 2.1 2.2 2.3 2.4 2.5 2.6 2.7 2.8 2.9 3.0 3.1 3.2 3.3 3.4 3.5];

xa=[1.8 1.9 2.0 2.1 2.2 2.3 2.4 2.5 2.6 2.7 2.8 2.9 3.0 3.1 3.2 3.3 3.4 3.5];
ya=[0.35 0.6 10 13 16 20 23 26 29 31 34 37 40 43 46 49 52 55];

y1=[0.01 0.02 0.04 0.06 0.08 0.12 0.17 0.2 0.24 0.28 0.33 0.38 0.44 0.47 0.51 0.55 0.58 0.62 0.66 0.69 0.74 0.76 0.80 0.84 0.88 0.91];
y2=[0.35 0.35 0.35 0.35 0.35 0.35 0.35 0.35 0.35 0.6 10 13 16 20 23 26 29 31 34 37 40 43 46 49 52 55];
y3=[0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 1.5 1.8 2.2 2.7 3 3.7 4.5 5.5 6 6.5 8 9.7 10.5 11.5 13.5 14];
y4=(1/5)*[0.01 0.03 0.05 0.07 0.09 0.14 0.17 0.2 0.24 0.28 0.33 0.38 0.44 0.47 0.51 0.55 0.58 0.62 0.66 0.69 0.74 0.76 0.80 0.84 0.88 0.91];
%Plots

ax1 = subplot(1,2,1);
axis([1 4 0 1])
set(gca,'FontSize',30);
hold all
 plot(x,y1,'.','MarkerSize',30,'MarkerEdgeColor','b','MarkerFaceColor','b')
 [xData1, yData1] = prepareCurveData( x, y1 );
ft = fittype( 'poly1' );
[fitresult, gof] = fit( xData1, yData1, ft );
plot( fitresult);
 plot(x,y4,'.','MarkerSize',30,'MarkerEdgeColor','m','MarkerFaceColor','m')
 [xData, yData] = prepareCurveData( x, y4 );
ft = fittype( 'poly1' );
[fitresult, gof] = fit( xData, yData, ft);
h = plot( fitresult);
 xlabel('Diodenstrom I in [A]','FontSize', 30)
 ylabel('Ausgangsleistung P in [W]','FontSize', 30)
legend off

ax2 = subplot(1,2,2);
axis([1 4 0 60])
set(gca,'FontSize',30);
hold all
 plot(x,y2,'.','MarkerSize',30,'MarkerEdgeColor','g','MarkerFaceColor','g')
 [xData2, yData2] = prepareCurveData( xa, ya );
ft = fittype( 'poly1' );
[fitresult, gof] = fit( xData2, yData2, ft );
plot( fitresult);
 plot(x,y3,'.','MarkerSize',30,'MarkerEdgeColor','c','MarkerFaceColor','c')
 [xData3, yData3] = prepareCurveData( x, y3 );
ft = fittype( 'poly2' );
[fitresult, gof] = fit( xData3, yData3, ft );
h = plot( fitresult);
legend off
 xlabel('Diodenstrom I in [A]','FontSize', 30)
 ylabel('Ausgangsleistung P in [mW]','FontSize', 30)
hold off
