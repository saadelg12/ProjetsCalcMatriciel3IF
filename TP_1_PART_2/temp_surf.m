function X = temp_surf() %Recrée U0 de la partie 1

open GaussSeidel.m;


A = zeros(500) ;
B = zeros(500,1);
LigneA = 1;
for ligne = 0:19
    for colonne = 0:24
        
        if ligne ==0 || (ligne ==9 && colonne < 13) || (ligne ==10 && colonne < 13) || ligne ==19 || (ligne <11 && colonne == 24)
            A(LigneA, LigneA) = 1 ;
            B(LigneA) = 100 ;
        elseif (colonne == 20 || colonne == 21)&&(ligne == 4 || ligne == 5) || (colonne == 9 || colonne == 10)&&(ligne == 14 || ligne == 15)
            A(LigneA, LigneA) = 1 ;
            B(LigneA) = 500 ;
        elseif ligne >= 1 && ligne <= 8 && colonne ==0
            A(LigneA, LigneA) = -4 ;
            
            A(LigneA, LigneA+18) = 1 ;
            A(LigneA, LigneA+1) = 1 ;
            A(LigneA, LigneA+25) = 1 ;
            A(LigneA, LigneA-25) = 1 ;
            
        elseif ligne >= 1 && ligne <= 9 && colonne ==18
            A(LigneA, LigneA) = -5 ;
            
            A(LigneA, LigneA-1) = 1 ;
            A(LigneA, LigneA+1) = 1 ;
            A(LigneA, LigneA+25) = 1 ;
            A(LigneA, LigneA-25) = 1 ;
            A(LigneA, LigneA-18) = 1 ;
            
        elseif ligne >= 13 && ligne <= 18 && colonne ==0
            A(LigneA, LigneA) = -4 ;
            
            A(LigneA, LigneA+24) = 1 ;
            A(LigneA, LigneA+1) = 1 ;
            A(LigneA, LigneA+25) = 1 ;
            A(LigneA, LigneA-25) = 1 ;
        elseif  ligne >= 13 && ligne <= 18 && colonne == 24
            A(LigneA, LigneA) = -4 ;
            A(LigneA, LigneA-24) = 1 ;
            A(LigneA, LigneA-1) = 1 ;
            A(LigneA, LigneA+25) = 1 ;
            A(LigneA, LigneA-25) = 1 ;
        else 
            A(LigneA, LigneA) = -4 ;
            A(LigneA, LigneA+1) = 1 ;
            A(LigneA, LigneA-1) = 1 ;
            A(LigneA, LigneA+25) = 1 ;
            A(LigneA, LigneA-25) = 1 ;
        end
            
        LigneA = LigneA +1;
    end
    
end

X = GaussSeidel(A,B,1000);

end