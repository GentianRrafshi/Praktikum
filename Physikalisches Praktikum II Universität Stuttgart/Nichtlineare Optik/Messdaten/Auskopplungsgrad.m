%Messdaten
x=[10 20 30];
y=[0.95 0.74 0.63];


%Plot
hold all
plot(x,y,'.','MarkerSize',30);
set(gca,'FontSize',30);
axis([5 35 0.55 1])
 xlabel('Auskopplungsgrad OC','FontSize', 30);
 ylabel('Ausgangsleistung P in [W]','FontSize', 30);