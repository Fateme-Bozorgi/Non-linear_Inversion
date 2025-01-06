

clc;
close all;
clear all;
F=100;
A=1000;
phi=2.5;
dt=0.002;
fs=1/dt;
t=0:dt:0.1;
s1=A*sin((2*pi*F*t)+phi);
M=mean(s1);
noise=M*0.05*randn(size(s1));
s2=s1+noise;

%% FFT
ff=fft(s1);
ff=abs(ff);
N=length(ff);
ff=ff(1:N/2);
xff=(0:N/2-1).*fs/N;
figure(1);
subplot(3,1,1),plot(t,s1);
xlabel('Time(s)'), ylabel('Amplitude');title('synthetic Signal');
subplot(3,1,2),plot(t,s2);
xlabel('Time(s)'), ylabel('Amplitude');title('synthetic Signal+Noise');
subplot(3,1,3),plot(t,noise);
xlabel('Time(s)'), ylabel('Amplitude');title('A(Gaussian) noise sequence');
figure(2)
plot(xff,ff);
xlabel('Frequency(Hz)'), ylabel('Amplitude');title('Amplitude spectrum');

%% part2--Levenberg-Marquardt method
A0=25;
F0=100;
phi0=3;
X=[A0;F0;phi0];

s1=A*sin((2*pi*F*t)+phi);
s=s1';
M=mean(s);
noise=M*0.05*randn(size(s));
s_obs=s+noise;

lambda=100;
for i=1:10
[g]=forward02(X);
delta_d=s_obs-s;
j=jacobian02(X);
    delta_m=inv((j'*j)+(lambda*eye))*(j'*delta_d);
X=delta_m+X;
lambda=lambda/2;

    if (norm(j)<0.0001)
        break
    end

end
disp(delta_m)


