function Y1_prim = Y_prefault_unreduced_ls(Y_prim_prim, load_index, P, Q, V_mag)
nodes = size(Y_prim_prim, 1);
Y_ls = zeros(nodes, nodes);
nloadBus = length(load_index);

%find load Y
P_load    = P(load_index);
Q_load    = Q(load_index);
Vmag_load = V_mag(load_index);
S_conj = conj(P_load + 1i*Q_load);
Y_load = S_conj ./ (Vmag_load .^2);
for i = 1:nloadBus
    Y_ls(load_index(i),load_index(i))= Y_load(i);
end %end for loop

Y1_prim = Y_prim_prim + Y_ls;
end %end of function