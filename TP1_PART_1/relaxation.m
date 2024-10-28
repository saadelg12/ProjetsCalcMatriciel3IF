function [X,m,w] = relaxation(A,B,e)
%Méthode de Relaxation
%   Paramètres : 
%   A : Matrice A
%   B : Vecteur B 
%   X : Vecteur X tel que A.X = B
%   m : Nombre d'itérations souhaitées
%   e : Précision souhaitée
%   n : Taille de la matrice
%   D,U,L : diagonale, triangulaire sup, triangulaire inf, de la matrice
%   w : omega optimal
%   P : matrice pi

n = size(A,1) ; % size(A,1) donne le nombre de lignes et size(A,2) donne le nombre de lignes

X0 = diag(rand(n)) ; % On initialise le vecteur X0
X = diag(zeros(n)) ;  % On initialise le vecteur X
P = rand(n) ;
m = 0 ;  % On initialise le nombre d'itérations

D = diag(diag(A)) ;
U = triu(A) - D ;
L = tril(A) - D ;
w = 0 ; % On initialise omega
rayon = 0 ; % On initialise le rayon 
rayonOptimal = 1 ; % On initialise le rayon optimal


%Détermination de w optimal
for omega=0 : 0.01 : 2
    P = (D + omega*L) \ ((1-omega)*D - omega*U) ;
    rayon = max(abs(eig(P))) ;
    if rayon <= rayonOptimal 
        rayonOptimal = rayon ;
        w = omega ;
    end
end

P = inv(D + w*L)*((1-w)*D - w*U) ;
beta = inv(D+L*w)*w*B ;

%Iterations 

while max(abs(A*X - B)) >= e % Tant que la solution approximative n'est pas dans l'intervalle de tolérance de la solution courante
    X = P*X0 + beta ;
    m = m+1 ;
    X0 = X ; 
end

% disp('Solution approximative') ;
% disp(X);
% disp('précision');
% disp(e);
% disp('omega optimal') ; 
% disp(w) ;
% disp('Nombre iterations');
% disp(m);

end
