function [min, max] = p31a()
%Renvoie 2 tableaux de valeurs propres min et max

[A,B]=Tambour;
min=diag(zeros(50));
max=diag(zeros(20));


% ---------- Minima ------------
vp=inv(A);
for i=1:50
    [vp, l]=supMax(vp);
   min(i)=1/l;
end

% ---------- Maxima ------------
vp=A;
for i=1:20
    [vp, l]=supMax(vp);
    max(i)=l;
end

