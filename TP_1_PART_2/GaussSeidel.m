function Xs = GaussSeidel(A,B,lim)
    n = size(B);
    n = n(1);
    Xs = ones(n(1),1);
    D = diag(diag(A));
    

    for m = 1:lim
        prevX = Xs;
        for i = 1:n
            SN = 0;
            SM = 0;
            for j = 1:i-1
                SM = SM + A(i,j)*prevX(j);
            end
            for j = i+1:n
                SN = SN + A(i,j)*prevX(j);
            end
            Xs(i) = (B(i) - SM - SN)/D(i,i);
        end
    end
    
end