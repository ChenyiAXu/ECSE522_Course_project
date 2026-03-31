function [E_mag, E_ang] = machineVoltage(P, Q, V_mag, V_ang, x_int, gen_index)
Pg = P(gen_index);
Qg = Q(gen_index);
V = V_mag .* exp(1j * deg2rad(V_ang));
Vg = V(gen_index);

Sg = Pg + 1i*(Qg);
Ig = conj(Sg ./ Vg);
E = Vg + 1i * x_int .* Ig;
E_mag = abs(E);
E_ang = angle(E);
end %end function