Re=0.06;
Ce=64800/12;
RL=1.4e-3;
RC=0.0015;
C=100e-6;
L=420e-6;
K=(Re*Ce*RC*C)/(RC*C*Ce+Re*C*Ce);
wz1=1/(Re*Ce);
wz2=1/(RC*C);
wpl=(C+Ce)/(RC*C*Ce+Re*C*Ce);
Num=[K (wz1+wz2)*K (wz1*wz2)*K];
Den=[L (RL+K+wpl)*L wz1*K+wz2*K+wpl*RL wz1*wz2*K];