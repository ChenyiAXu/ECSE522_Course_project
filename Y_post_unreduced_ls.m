function Y3_prim =  Y_post_unreduced_ls(Y1_prim, nf_from, nf_to, yb, nfrom, nto)

idx = find( (nfrom == nf_from & nto == nf_to) | ...
            (nfrom == nf_to   & nto == nf_from) );
branch_open = yb(idx);

Y_adjust = zeros(length(Y1_prim), length(Y1_prim));
Y_adjust(nf_from, nf_to) = -branch_open;
Y_adjust(nf_to, nf_from) = -branch_open;

Y_adjust(nf_from, nf_from) = branch_open;
Y_adjust(nf_to, nf_to) = branch_open;

Y3_prim = Y1_prim - Y_adjust;
end