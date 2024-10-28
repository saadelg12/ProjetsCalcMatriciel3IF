%COMPARATIF
% Chacune des méthodes (Jacobi, Gauss-Seidel et Relaxation) a ses propres avantages, inconvénients et facteurs d'efficacité. Voici une comparaison générale :
% 
% Jacobi :
% Avantages :
% Facile à implémenter.
% Peut être parallélisé (possibilité d'exécuter plusieurs parties du programme simultanément, plutôt que séquentiellement), 
% %afin d'améliorer les performances. , car chaque itération n'a pas de dépendance sur les itérations précédentes.
% Inconvénients :
% Souvent converge lentement, nécessitant un grand nombre d'itérations.
% La convergence n'est garantie que si la matrice A est strictement diagonalement dominante.
% Facteurs d'efficacité :
% La méthode de Jacobi peut être plus efficace lorsque la matrice A est diagonalement dominante
%Une matrice diagonalement dominante est une matrice où les éléments diagonaux sont plus grands en valeur absolue 
% que la somme des valeurs absolues des autres éléments de la même ligne. 


% Gauss-Seidel :
% Avantages :
% Généralement converge plus rapidement que la méthode de Jacobi.
% Peut être plus efficace pour des systèmes où la matrice A n'est pas diagonalement dominante.
% Inconvénients :
% Moins facilement parallélisable que la méthode de Jacobi car chaque itération dépend des itérations précédentes.
% Facteurs d'efficacité :
% La méthode de Gauss-Seidel peut être plus efficace lorsque la matrice A n'est pas diagonalement dominante.

% Relaxation (ou SOR - Successive Over-Relaxation) :
% Avantages :
% Peut accélérer la convergence par rapport à Jacobi et Gauss-Seidel en introduisant un paramètre d'oméga (w).
% Peut converger même si la matrice A n'est pas strictement diagonalement dominante.
% Inconvénients :
% Le choix du paramètre d'oméga (w) peut être délicat, et une valeur inappropriée peut conduire à une divergence.
% La convergence peut être sensible à la structure de la matrice A.
% Facteurs d'efficacité :
% La méthode de Relaxation est plus efficace lorsque le paramètre d'oméga (w) est bien choisi, ce qui dépend de la structure de la matrice A.
% Peut être plus efficace pour des systèmes où la matrice A n'est pas diagonalement dominante.

% En résumé, le choix de la méthode dépend des caractéristiques de la matrice du système linéaire que vous résolvez. 
% Si la matrice est diagonalement dominante, Jacobi peut être préférable. 
% Si la matrice n'est pas diagonalement dominante, Gauss-Seidel ou Relaxation peuvent être plus appropriés, avec Relaxation ayant un avantage potentiel en termes de convergence accélérée.
% 

%TESTS 1
%Cette matrice est strictement diagonalement dominante, ce qui est idéal pour la méthode de Jacobi.

% A1 = [10, -1, 2, 0;
%      -1, 11, -1, 3;
%      2, -1, 10, -1;
%      0, 3, -1, 8];
% B1 = [6; 25; -11; 15];
% e1 = 0.001;
% 
% disp(A1) ; 
% disp(B1) ; 
% 
% 
% disp("JACOBI") ; 
% [X1,m1] = jacobi(A1,B1,e1) ;
% disp('Solution approximative') ;
% disp(X1);
% disp('précision');
% disp(e1);
% disp('Nombre iterations');
% disp(m1);
% 
% disp("GS") ;
% [X1,m1] = GS(A1,B1,e1) ;
% disp('Solution approximative') ;
% disp(X1);
% disp('précision');
% disp(e1);
% disp('Nombre iterations');
% disp(m1);
% 
% disp("RELAXATION") ; 
% [X1,m1,w1] = relaxation(A1,B1,e1) ;
% disp('Solution approximative') ;
% disp(X1);
% disp('précision');
% disp(e1);
% disp('omega optimal') ; 
% disp(w1) ;
% disp('Nombre iterations');
% disp(m1);


% %TEST 2
% Cette matrice n'est pas strictement diagonalement dominante, 
% ce qui peut rendre la méthode de Gauss-Seidel plus efficace que la méthode de Jacobi.

% A2 = [4, 1, 0, 0;
%      1, 3, -1, 1;
%      2, -1, 2, -1;
%      0, 2, -1, 2];
% B2 = [1; 2; -1; 2];
% e2 = 0.001;
% 
% disp(A2) ; 
% disp(B2) ; 
% 
% 
% 
% disp("JACOBI") ; 
% [X2,m2] = jacobi(A2,B2,e2) ;
% disp('Solution approximative') ;
% disp(X2);
% disp('précision');
% disp(e2);
% disp('Nombre iterations');
% disp(m2);
% 
% disp("GS") ;
% [X2,m2] = GS(A2,B2,e2) ;
% disp('Solution approximative') ;
% disp(X2);
% disp('précision');
% disp(e2);
% disp('Nombre iterations');
% disp(m2);
% 
% disp("RELAXATION") ; 
% [X2,m2,w2] = relaxation(A2,B2,e2) ;
% disp('Solution approximative') ;
% disp(X2);
% disp('précision');
% disp(e2);
% disp('omega optimal') ; 
% disp(w2) ;
% disp('Nombre iterations');
% disp(m2);

% %TEST 3
% Relaxation meilleure.

A3 = [4, -1, 0, 0;
     -1, 3, 0.5, 0.25;
     1, -0.5, 3, -1;
     0.5, 0.25, -1, 4];
B3 = [15; 10; 10; 20];
e3 = 0.001;

disp(A3) ; 
disp(B3) ; 



disp("JACOBI") ; 
[X3,m3] = jacobi(A3,B3,e3) ;
disp('Solution approximative') ;
disp(X3);
disp('précision');
disp(e3);
disp('Nombre iterations');
disp(m3);

disp("GS") ;
[X3,m3] = GS(A3,B3,e3) ;
disp('Solution approximative') ;
disp(X3);
disp('précision');
disp(e3);
disp('Nombre iterations');
disp(m3);

disp("RELAXATION") ; 
[X3,m3,w3] = relaxation(A3,B3,e3) ;
disp('Solution approximative') ;
disp(X3);
disp('précision');
disp(e3);
disp('omega optimal') ; 
disp(w3) ;
disp('Nombre iterations');
disp(m3);



