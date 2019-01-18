L = 15; %miles - length of pipeline
W = 12.67; %lbm/sec - flowrate of limestone
a = 0.01; %ft. - average lump size of limestone before grinding
g = 32.17; %ft/sec^2 - acceleration due to gravity
gc = 32.17; % conversion between lbf and lbm lbmft/lbfsec^2
pw = 62.4; %lbm/ft3 - density of water 
mew = 7.392*10^-4;%lbm/(ft-sec) - viscosity of water
gamma = 168.5; %lbm/ft3 - limestone density

Qw=0; %ft^3/sec water flow rate
Ql=0; %
D=0; %ft - internal diameter of pipe
d=0; %ft - average limestone particle size after grinding
S=0; % specific gravity of the limestone

A = pi*D^2/4;
Q = Ql+Qw; %ft^3/sec total slurry flow rate
V = Q/A;
c = Ql/(Q); %volumetric conecntration of slurry
Pg = 218*W*(1/sqrt(d)-1/sqrt(a)); %ftlbf/sec - Power for grinding
Rw = pw*V*D/mew;
if Rw<=1e5
    fw = 0.3164/Rw^0.25;% friction factor of water
else
    fw = 0.0032+0.221*Rw^-0.237;% friction factor of water
end
CdRp2 = 4*g*pw*d^3*((gamma-pw)/(3*mew^2));
% Curve fit is from JMP 14
a = 0.421534;
b= 104.95427;
c = 0.5679997;
d = 508.55715;
f = 1.2131968;
Cd = a+b*exp(-c*log(CdRp2))+d*exp(-f*log(CdRp2));% average drag coefficient of the particles

p = pw + c*(gamma-pw); % density of slurry lbm/ft^3
changep = f*p*L*V^2/(D*2*gc);
Pf = changep*Q; %Friction power loss
Vc = (40*g*c*(S-1)*D/sqrt(Cd))^0.5;
f = fw*(pw/p+150*c*(pw/p)*((g*D*(S-1))/(V^2*sqrt(Cd))^1.5));
