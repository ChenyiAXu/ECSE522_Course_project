function Y = admittancePF(nfrom, nto, yb)
N = max(max(nfrom), max(nto));
Id = eye(N);
A = Id(1:N,nfrom) - Id(1:N, nto); %incident matrix 
Yb = diag(yb);  % stored in diagonal matrix Yb 
Y = A*Yb*A';
end