function [x_new, iter] = trapImplicit( ...
    x_old, P_m, E_mag, Y_red, H, D, ws, h, tol, maxIter)
% x_old   : machine state vector from the previous time step
% P_m     : mechanical input power of each generator
% E_mag   : internal voltage magnitude of each generator
% Y_red   : reduced network admittance matrix
% H       : inertia constant of each generator
% D       : damping coefficient of each generator
% ws      : rated synchronous angular speed
% h       : simulation step size
% tol     : Newton iteration convergence tolerance
% maxIter : maximum allowed Newton iterations
% x_new   : state vector at the new time step
% iter    : Newton iteration count
ng = length(E_mag);
delta_old = x_old(1:ng);
dw_old = x_old(ng+1:end);
%forward euler predictor 
delta_guess = delta_old + h * ws .* dw_old;
Pe_old = electricPower(E_mag, Y_red, delta_old);
dw_guess = dw_old + h * (P_m - Pe_old - D .*dw_old) ./ (2 * H);
x_current = [delta_guess; dw_guess];
for iter = 1 : maxIter
   
    F_trap_res = residualFunction(x_old, x_current, P_m, H, D, ws, h, Y_red, E_mag);
    jacobian = jacobianTrap(h, ws, H, E_mag, Y_red, x_current, D );
    dX = - jacobian\F_trap_res;
    %update guessed value
    
    x_current = x_current + dX;
    
    if max(abs(dX)) < tol
        break
    end
end %end for loop
x_new = x_current;

end %end of function
