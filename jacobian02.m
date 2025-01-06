

function j=jacobian02(X)
t=0:0.002:0.1;
 

d1=sin((2*pi*X(2)*t)+X(3));
d2=X(1)*cos((2*pi*t)+X(3));
d3=X(1)*cos((2*pi*X(2)*t)+1);
 
j1=[d1;d2;d3];
j=j1';

end




% t=0:0.002:0.1;
% syms s1 A F phi
% s1=A*sin((2*pi*F*t)+phi);
% 
% d1=diff(s1,A)
% d2=diff(s1,F)
% d3=diff(s1,phi)