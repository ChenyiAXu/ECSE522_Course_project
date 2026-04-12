function [t, x_hist, iter_hist] = solutionRoutine( ...
    x0, P_m, E_mag, ...
    Y_prefault, Y_fault, Y_postfault, ...
    H, D, ws, h, t_final, t_fault, t_clear, ...
    tol, maxIter)
% x0          : initial machine state vector
% P_m         : mechanical input power of each generator
% E_mag       : internal voltage magnitude of each generator
% Y_prefault  : reduced admittance matrix for the prefault network
% Y_fault     : reduced admittance matrix for the fault-on network
% Y_postfault : reduced admittance matrix for the post-fault network
% H           : inertia constant of each generator
% D           : damping coefficient of each generator
% ws          : rated synchronous angular speed
% h           : simulation time step
% t_final     : end time of the simulation
% t_fault     : time at which the fault is applied
% t_clear     : time at which the fault is cleared
% tol         : Newton iteration convergence tolerance
% maxIter     : maximum allowed Newton iterations per step
% t           : simulation time vector
% x_hist      : history of the full state vector
% iter_hist   : Newton iteration count history
ng = length(E_mag);
t = 0 : h : t_final; %total time steps with h being the step size
Nsteps = length(t) - 1;
x_hist = zeros(2*ng, Nsteps+1);
iter_hist = zeros(1, Nsteps);

x_hist(:,1) = x0;

for k = 1 : Nsteps
    tk = t(k);
    if tk < t_fault
        Y_red = Y_prefault;
    elseif tk < t_clear
        Y_red = Y_fault;
    else
        Y_red = Y_postfault;
    end % end of if loop
    x_old = x_hist(:, k);
    %advance one step in time
  
    [x_new, iter] = trapImplicit( ...
    x_old, P_m, E_mag, Y_red, H, D, ws, h, tol, maxIter);
    x_hist(:, k+1) = x_new;
    iter_hist(k) = iter;
end %end for loop

end 
