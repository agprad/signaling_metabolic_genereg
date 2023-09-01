function dc = toy_fn5(t,Con)
global tau1 tau2 tau3 tau4 tau5 n b k Amax Bmax Cmax Dmax Emax W
% Concentration profile----------------------------------------------------
C = Con;
C(1) = 1;
C(2) = 1;
dc(1)=0;
dc(2)=0;
factB = (b*C(2)^n)/((k^n)+(C(2)^n));
factC = (b*C(3)^n)/((k^n)+(C(3)^n));
factD = (b*C(4)^n)/((k^n)+(C(4)^n));
finhibD= 1-(C(2)*C(4)^n)/(k^n+C(4)^n);
factA = (b*C(1)^n)/((k^n)+(C(1)^n));
factE = (b*C(5)^n)/((k  ^n)+(C(5)^n));
dc(3) = (1/tau3)*(((W*factA+W*factE-W*factA*W*factE)*(Cmax-C(3))));
dc(4) = (1/tau4)*((W*factB)*(Dmax-C(4))); 
dc(5) = (1/tau5)*(W*factC*finhibD*Emax-C(5));
dc=dc';
end