
clc
clear all
close all
x=-50:1:49;
z=10;
r=5;
p=6.673e-11;
delta_rho=-1500;

r0=1;
z0=30;
X=[r0;z0];

g1=2*pi*p*delta_rho*(((X(1)^2)*(X(2)))./((x.^2)+(X(2)^2))); 
g=g1';  %forward = d_cal

med=mean(x);
noise=med*0.05*randn(length(g),1);
g_obs=g+noise;

%%  Levenberg-Marquardt method
lambda=100;
for i=1:10
[g]=forward(X);
delta_d=g_obs-g;
j=jacobiann(X);
    delta_m=inv((j'*j)+(lambda*eye))*(j'*delta_d);
X=delta_m+X;
lambda=lambda/2;

    if (norm(j)<0.00001)
        break
    end
end
disp(delta_m)
