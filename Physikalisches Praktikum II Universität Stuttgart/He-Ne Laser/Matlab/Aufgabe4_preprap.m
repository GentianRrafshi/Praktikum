%%  Cleaning
clearvars
close all
clc

%% Curveplotting 

% Load data
 M1 = importdata('Filter1.csv'); 
x1=transpose(M1(1:3648));
y1=transpose(M1(3649:end));

 M2 = importdata('Filter2.csv'); 
x2=transpose(M2(1:3648));
y2=transpose(M2(3649:end));

 M3 = importdata('Filter3.csv'); 
x3=transpose(M3(1:3648));
y3=transpose(M3(3649:end));

 M4 = importdata('Filter4.csv'); 
x4=transpose(M4(1:3648));
y4=transpose(M4(3649:end));

 M5 = importdata('Filter5.csv'); 
x5=transpose(M5(1:3648));
y5=transpose(M5(3649:end));

 M6 = importdata('Filter6.csv'); 
x6=transpose(M6(1:3648));
y6=transpose(M6(3649:end));
%% actual plot
 hold all
plot(x1,y1)
plot(x2,y2)
plot(x3,y3)
plot(x4,y4)
plot(x5,y5)
plot(x6,y6)
