function Y2_prim =  Y_fault_unreduced_ls(Y1_prim, fault_bus)
%Y1_prime: prefault unreduced admittance matrix with load shunt
%fault_bus: faulted bus index
keep = setdiff(1:size(Y1_prim,1), fault_bus);
Y2_prim = Y1_prim(keep, keep);
end %end of function
