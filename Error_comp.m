clear all;
Vs=17;
R=2.7407;
T=[];
L=420e-6;%Chosen L value
rL=1.4e-3; % 12.4A current rating (datasheet)
C=100e-6;
rc=.0015;
for f=10.^(0:.01:5)
s=j*2*pi*f;
B=L*C*(s.^2*(1+rc/R)+s*(rc/L+1/(R*C)+rL/L+(rc*rL)/(R*L))+(1/(L*C)+rL/(R*L*C)));
T=[T,(Vs*[1+s*C*rc]/B)];   
end
GFL=20*log10(T);
F=10.^(0:.01:5);
figure(1)
subplot(2,1,1)
plot(log10(F),[20*log10(abs(T))],'-r')
subplot(2,1,2)
plot(log10(F),[rad2deg(angle(T))],'-g')
f=3.5e3;
s=j*2*pi*f;
B=L*C*(s.^2*(1+rc/R)+s*(rc/L+1/(R*C)+rL/L+(rc*rL)/(R*L))+(1/(L*C)+rL/(R*L*C)));
T=Vs*[1+s*C*rc]/B;
GFL=20*log10(abs(T));
AFL=rad2deg(angle(T));
% PWM
GPWM=20*log10(1/5);
GTot=GFL+GPWM;
GainL=10.^(-GTot/20);
theta_comp=45-(AFL);
K=(tand((theta_comp)/2));
R1=680;
R22=(R1*GainL);
C1=K/(2*pi*f*R2);
C2=1/(K*2*pi*f*R2);