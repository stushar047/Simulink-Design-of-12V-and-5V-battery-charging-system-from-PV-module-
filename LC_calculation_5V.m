clear all;
close all;
clc;
T=[];
fs=40e3;
Ts=1/fs;
Io=2;
Vomax=5.05;
Vomin=2.5;
Vdmax=21.7;
V_ripple=0.5e-2;
R=2*(Vomax/Io);% Maximum Resistance Means Higher Critical Inductance
D=Vomin/Vdmax; %Minimum D means Max Lc
Lc=((R*Ts)*(1-D))*0.5; %Critical inductance
LL=10*Lc; % Inductor Value=324.2uH
del_Il=[.01:.001:.15];
for i=1:1:length(del_Il)
Lch(i)=((Vomax*(1-D)*Ts)/(del_Il(i)*Io));
end
plot(del_Il*100,(Lch*1e6))
xlabel('del IL')
ylabel('L in uH')
L=470e-6;%Chosen L value
rL=1.4e-3; % 12.4A current rating (datasheet)
% del_IL=((Vo*(1-D)*Ts)/L);
% RC=(V_ripple*Vo)/del_IL;
% CC=(1e-5)/RC;
% C=100e-6;
% rc=.0015;