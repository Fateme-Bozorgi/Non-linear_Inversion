


function [s]=forward02(X)
F=100;
A=1000;
phi=2.5;
dt=0.002;
fs=1/dt;
t=0:dt:0.1;
s1=A*sin((2*pi*F*t)+phi);
s=s1';
M=mean(s1);
noise=M*0.05*randn(size(s1));
s_obs=s1+noise;



end