%Messwerte
x=[2.5 5 7.5 10 10.5 11 11.5];
y=[0.941 0.939 0.943 0.94 0.46 0.39 0.1];

%Plot
hold all
plot(x,y,'.','MarkerSize',30)
set(gca,'FontSize',30);
xL = get(gca,'XLim');
ax=line(xL,[0.94075 0.94075],'Color','r','LineStyle',':','LineWidth',1);
 xlabel('Abstand l in [cm]','FontSize', 30)
 ylabel('Ausgangsleistung P in [W]','FontSize', 30)