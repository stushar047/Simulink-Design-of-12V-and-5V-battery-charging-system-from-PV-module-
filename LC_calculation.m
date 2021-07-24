clear all;
close all;
clc;
T=[];
fs=40e3;
Ts=1/fs;
Vo=14.8;
Io=5.4;
Vomin=14.6;
Vomax=14.8;
Vdmax=21.7;
V_ripple=0.5e-2;
R=Vomax/Io;% Maximum Resistance Means Higher Critical Inductance
D=Vomin/Vdmax; %Minimum D means Max Lc
Lc=((R*Ts)*(1-D))*0.5; %Critical inductance
LL=10*Lc; % Inductor Value=324.2uH
del_Il=[.01:.001:.1];
for i=1:1:length(del_Il)
Lch(i)=((Vomax*(1-D)*Ts)/(del_Il(i)*Io));
end
plot(del_Il*100,(Lch*1e6))
xlabel('del IL')
ylabel('L in uH')
L=420e-6;%Chosen L value
rL=1.4e-3; % 12.4A current rating (datasheet)
del_IL=((Vomax*(1-D)*Ts)/L);
RC=(V_ripple*Vomax)/del_IL;
CC=(1e-5)/RC;
C=100e-6;
rc=.0015;