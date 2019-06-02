%Messdaten
x=[1.9 2.0 2.1 2.2 2.3 2.4 2.5 2.6 2.7 2.8 2.9 3.0 3.1 3.2 3.3 3.4 3.5];
y=[1.7 3.4 4.5 5.6 6.4 7.1 7.5 8.6 9.1 9.6 10.3 10.3 11.3 11.8 12.4 12.61 12.8];

%Messdaten
hold all
plot(x,y,'.','MarkerSize',30)
xlabel('Diodenstrom I in [A]','FontSize', 30)
set(gca,'FontSize',30); 
ylabel('Repititionsrate f in [kHz]','FontSize', 30)

