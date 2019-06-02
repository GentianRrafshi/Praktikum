 %%  Cleaning
clearvars
close all
clc

%% Curveplotting 'Resonatorlänge_Leistung_1.txt'


% Load data
 M = importdata('Resonatorlänge_Leistung_1.txt'); 
 x=M.data(1:end,3);
 y=M.data(1:end,4);

 %Plot
hold all
plot(x,y,'.','MarkerSize',30)
set(gca,'FontSize',20);
xL = get(gca,'XLim');
ax=line(xL,[4.21 4.21],'Color','r','LineStyle',':','LineWidth',1);
 xlabel('Abstand l in [cm]','FontSize', 20)
 ylabel('Ausgangsleistung P in [mW]','FontSize', 20)
 
 %% Curveplotting 'Resonatorlänge_Leistung_2.txt'

% Load data
 M = importdata('Resonatorlänge_Leistung_2.txt'); 
 x=M.data(1:end,3);
 y=M.data(1:end,4);

 %Plot
hold all
plot(x,y,'.','MarkerSize',30)
set(gca,'FontSize',20);
xL = get(gca,'XLim');
ax=line(xL,[2.87 2.87],'Color','r','LineStyle',':','LineWidth',1);
xlabel('Abstand l in [cm]','FontSize', 20)
 ylabel('Ausgangsleistung P in [mW]','FontSize', 20)
 
  %% Curveplotting 'Röhrenabstand_Leistung_1.txt'

% Load data
 M = importdata('Röhrenabstand_Leistung_1.txt'); 
 x=M.data(1:end,1);
 y=M.data(1:end,2);

 %Plot
hold all
plot(x,y,'.','MarkerSize',30)
set(gca,'FontSize',20);
xlabel('Abstand l in [cm]','FontSize', 20)
 ylabel('Ausgangsleistung P in [mW]','FontSize', 20)
 
   %% Curveplotting 'Röhrenabstand_Leistung_2.txt'

% Load data
 M = importdata('Röhrenabstand_Leistung_2.txt'); 
 x=M.data(1:end,1);
 y=M.data(1:end,2);

 %Plot
hold all
plot(x,y,'.','MarkerSize',30)
set(gca,'FontSize',20);
xlabel('Abstand l in [cm]','FontSize', 20)
 ylabel('Ausgangsleistung P in [mW]','FontSize', 20)
 
    %% Curveplotting 'Strom_Leitsung_1.txt'

% Load data
 M = importdata('Strom_Leitsung_1.txt'); 
 x=M.data(1:end,1);
 y=M.data(1:end,2);

 %Plot
hold all
plot(x,y,'.','MarkerSize',30)
set(gca,'FontSize',20);
xL = get(gca,'XLim');
ax=line(xL,[4.519 4.519],'Color','r','LineStyle',':','LineWidth',1);
xlabel('Strom I in [mA]','FontSize', 20)
ylabel('Ausgangsleistung P in [mW]','FontSize', 20)
 
     %% Curveplotting 'Strom_Leitsung_2.txt'

% Load data
 M = importdata('Strom_Leitsung_2.txt'); 
 x=M.data(1:end,1);
 y=M.data(1:end,2);

 %Plot
hold all
plot(x,y,'.','MarkerSize',30)
set(gca,'FontSize',20);
xL = get(gca,'XLim');
ax=line(xL,[2.63 2.63],'Color','r','LineStyle',':','LineWidth',1);
xlabel('Strom I in [mA]','FontSize', 20)
 ylabel('Ausgangsleistung P in [mW]','FontSize', 20)