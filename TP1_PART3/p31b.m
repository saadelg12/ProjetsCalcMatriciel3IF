function [l] = p31b(c)
%Recherche valeur propre la + proche de c et affiche la vibration associée


[A,B]=Tambour;

%---------- Proche de c ------
[m, l]=supMax(inv(A-c*eye(600)));
l=c+1/l ;
[vp,p]=vPmax(inv(A-c*eye(600)));
% vp=reshape(vp, 40, 15);
% figure(1);
% surf(vp);
