function Y1_prim_prim = Y_prefault_unreduced(YPf, x_int, gen_index)
%YPf admittance matrix from power flow
%x_int internal impedance of generator
%gen_index index of generator node
ng = size(gen_index,1); %number of generators
nb = size(YPf,1); %number of network bus

y_int = 1./(1i*x_int); %internal admittance magnitude
nfrom = zeros(ng, 1);
for i = 1:ng
    nfrom(i, 1) = nb + i;
end 
nto = gen_index;
Y_gen = admittancePF(nfrom, nto, y_int);

Y1_prim_prim = zeros(nb + ng, nb + ng);
Y1_prim_prim(1:nb, 1:nb) = YPf;
Y1_prim_prim = Y1_prim_prim + Y_gen;
end %end function