


function [g]=forward(X)
x=-50:1:49;
p=6.673e-11;
delta_rho=-1500;
g1=2*pi*p*delta_rho*(((X(1)^2)*(X(2)))./((x.^2)+(X(2)^2))); 
g=g1';  %forward = d_cal

med=mean(x);
noise=med*0.05*randn(length(g),1);
g_obs=g+noise;

end