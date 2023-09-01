% Signalling model for toy network
% Normalized Hill differential equation modeling approach
clc
clear all
global tau1 tau2 tau3 tau4 tau5 n b k Amax Bmax Cmax Dmax Emax W
% Species A, B, C, D and E are represented by 1, 2, 3, 4 and 5 respectively
tau1=1; tau2=1 ; tau3 = 1; tau4 = 1; tau5 = 1;
EC50 = 0.5;
n = 1.4; % Hill coefficient
b = ((EC50^n)-1)/((2*(EC50^n))-1);
k = (b-1)^(1/n);
Amax=1 ; Bmax=1 ;Cmax = 1; Dmax = 1; Emax = 1; W = 1;
%% Solving the ode
tspan = linspace(10,30);
Cin = [1,0,0,0,0];
[t1,Con1] = ode45(@toy_fn1,tspan,Cin);
%% Solving the ode
tspan = linspace(30,50);
Cin = [0,0,real(Con1(end,3)),real(Con1(end,4)),real(Con1(end,5))];%[-1,1,1,-1,1];
[t2,Con2] = ode45(@toy_fn2,tspan,Cin);
%% Solving the ode
tspan = linspace(50,70);
Cin = [0,1,real(Con2(end,3)),real(Con2(end,4)),real(Con2(end,5))];
[t3,Con3] = ode45(@toy_fn3,tspan,Cin);
%% Solving the ode
tspan = linspace(70,90);
Cin = [0,0,0,1,0];%[0,0,0,1,0];%
[t4,Con4] = ode45(@toy_fn4,tspan,Cin);
%% Solving the ode
tspan = linspace(90,110);
Cin = [1,1,0,0,0];%[1,1,0,0,0];
[t5,Con5] = ode45(@toy_fn5,tspan,Cin);
%% post processing
plot(t1,Con1(:,3),'-k','LineWidth',1.1)
hold all
plot(t1,Con1(:,4),'--k','LineWidth',1.5)
plot(t1,Con1(:,5),':k','LineWidth',2)
plot(t2,Con2(:,3),'-k','LineWidth',1.1)
plot(t2,Con2(:,4),'--k','LineWidth',1.5)
plot(t2,Con2(:,5),':k','LineWidth',2)
% plot(t3,Con3(:,3),'-k','LineWidth',1.1)
% plot(t3,Con3(:,4),'--k','LineWidth',1.5)
% plot(t3,Con3(:,5),':k','LineWidth',2)
plot(t4,Con4(:,3),'-k','LineWidth',1.1)
plot(t4,Con4(:,4),'--k','LineWidth',1.5)
plot(t4,Con4(:,5),':k','LineWidth',2)
plot(t5,Con5(:,3),'-k','LineWidth',1.1)
plot(t5,Con5(:,4),'--k','LineWidth',1.5)
plot(t5,Con5(:,5),':k','LineWidth',2)
xlim([0 110]) 
ylim([-0.01 1.1])
xlabel('time(s)')
ylabel('fractional activation')
legend('C','D','E')