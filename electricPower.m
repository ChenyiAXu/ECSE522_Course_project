function Pe = electricPower(E_mag, Y_red, delta)
% E_mag : vector of internal voltage magnitudes |E'|
% Y_red : reduced admittance matrix
% delta : vector of rotor angles
% Pe    : vector of electrical power outputs
ng = length(E_mag); %number of generators
theta = angle(Y_red); 
Ymag = abs(Y_red);
Pe = zeros(ng, 1);
for i = 1 : ng
    for j = 1 : ng
        Pe(i) = Pe(i) + E_mag(i) * E_mag(j) * Ymag(i,j) * cos(theta(i,j) - delta(i) + delta(j));
    end  %end for loop j
end %end of for loop i
end %end of function