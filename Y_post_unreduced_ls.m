function Y3_prim =  Y_post_unreduced_ls(Y1_prim, nf_from, nf_to, yb, nfrom, nto)
% Y1_prim : unreduced prefault admittance matrix with load shunts
% nf_from : sending bus index of the branch opened after fault clearing
% nf_to   : receiving bus index of the branch opened after fault clearing
% yb      : vector of branch admittances
% nfrom   : vector of sending bus indices for all branches
% nto     : vector of receiving bus indices for all branches
% Y3_prim : unreduced post-fault admittance matrix with load shunts
idx = find( (nfrom == nf_from & nto == nf_to) | ...
            (nfrom == nf_to   & nto == nf_from) );
branch_open = yb(idx);

Y_adjust = zeros(length(Y1_prim), length(Y1_prim));
Y_adjust(nf_from, nf_to) = -branch_open;
Y_adjust(nf_to, nf_from) = -branch_open;
%diagonal
Y_adjust(nf_from, nf_from) = branch_open;
Y_adjust(nf_to, nf_to) = branch_open;

Y3_prim = Y1_prim - Y_adjust;
end
