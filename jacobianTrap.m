function jacobian = jacobianTrap(h, ws, H, E_mag, Y_red, x_current, D )
%h step size
%ws rated speed
%E_mag magnitude of internal voltage
%Y_red reduced admittance matrix 
%x_current vector for current delta and dw
%D damping

Ymag = abs(Y_red);
theta = angle(Y_red);

ng = length(E_mag);
delta_k1 = x_current(1:ng);

J = eye(ng);  % ∂Fδ/∂δ

multiplier = -(h*ws/2);
N = multiplier * eye(ng);  % ∂Fδ/∂dw

M = zeros(ng, ng);  % ∂Fdw/∂δ
L = eye(ng);  % ∂Fdw/∂dw

%M 
for i = 1 : ng
    constant = h/(4*H(i));
    terms = zeros(ng, 1);

    for j = 1 :ng
         terms(j) = E_mag(i) * E_mag(j) * Ymag(i,j) * ...
               sin(theta(i,j) - delta_k1(i) + delta_k1(j));
    end %end for j

    for j = 1 : ng
        if i == j
            M(i,j) = constant * (sum(terms) - terms(i));
        else
            M(i,j) = -constant * terms(j);
        end 
    end
end %end for i 

%L
for i = 1:ng
    L(i,i) = 1 + (h* D(i))/(4*H(i));
end %end for 

jacobian = [J N; M L];
end