


function j=jacobiann(X)
p=6.673e-11;
delta_rho=-1500;
x=-50:1:49;
j1=[4*pi*p*delta_rho*(((X(1))*(X(2)))./((x.^2)+(X(2)^2)));((2*pi*p*delta_rho* X(1)^2 *(x.^2 + X(2)^2))...
    -((x.^2 + X(2)^2)*2*pi*p*delta_rho*X(2)* X(1)^2)/(x.^2 + X(2)^2).^2)];
j=j1';
end