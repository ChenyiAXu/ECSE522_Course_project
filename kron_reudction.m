function Y_reduced = kron_reudction(Y_unreduced, index_gen)
%Index_gen generator index vector 
%total number of nodes include internal node
numberNodes = length(Y_unreduced);
ng = length(index_gen);

k = numberNodes - ng ;
Ynn = Y_unreduced(1:k, 1:k);
Yng = Y_unreduced(1:k, k+1 :end);
Ygn = Y_unreduced(k+1:end, 1:k);
Ygg = Y_unreduced(k+1:end, k+1 :end);

Y_middle = linsolve(Ynn, Yng);
Y_reduced = Ygg - Ygn * Y_middle;
end %end function