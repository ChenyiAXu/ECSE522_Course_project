function F_trap_res = residualFunction(x_old, x_current, P_m, H, D, ws, h, Y_red, E_mag)
F_trap_res = zeros(length(x_old), 1); %initialize output variable
ng = length(E_mag); % # of generators 
%initialization
interk = zeros(ng, 1);
interk1 = zeros(ng, 1);

delta_k = x_old(1:ng); %old angle 
dw_k    = x_old(ng+1:2*ng); %old delta w

delta_k1 = x_current(1:ng); %current angle
dw_k1    = x_current(ng+1:2*ng); %current delta w

Pe_k  = electricPower(E_mag, Y_red, delta_k); %old electric power
Pe_k1 = electricPower(E_mag, Y_red, delta_k1); %new electric power

%F_trap_res 1:ng for angle 
for i = 1 : ng
    F_trap_res(i) = delta_k1(i) - delta_k(i) - (h/2)*(ws*(dw_k1(i) + dw_k(i)));
end

%F_trap_res ng+1 : end for delta omgega
for a = ng + 1 : length(F_trap_res)
    j = a - ng; % corresponding generator number 
    interk(j) = (P_m(j) - Pe_k(j) -D(j)*dw_k(j))/(2*H(j));
    interk1(j) = (P_m(j) - Pe_k1(j) -D(j)*dw_k1(j))/(2*H(j));
   
    F_trap_res(a) = dw_k1(j) - dw_k(j) - (h/2) * (interk(j) + interk1(j));
end 

end