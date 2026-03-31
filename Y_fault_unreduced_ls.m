function Y2_prim =  Y_fault_unreduced_ls(Y1_prim, fault_bus)
keep = setdiff(1:size(Y1_prim,1), fault_bus);
Y2_prim = Y1_prim(keep, keep);
end %end of function