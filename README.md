# Transient Stability Simulation Algorithm for a Multimachine System
## [Admittance Matrix](https://github.com/ChenyiAXu/ECSE522_Course_project/blob/main/admittancePF.m)
This function constructs the bus admittance matrix \(Y1\) for the power network using the branch connectivity and branch admittances.
## [Unredcued Prefault Admittance Matrix](https://github.com/ChenyiAXu/ECSE522_Course_project/blob/main/Y_prefault_unreduced.m)
This function forms the unreduced prefault admittance matrix \(Y1^{\prime\prime}\) by appending the internal impedance of the generator buses to the admittance matrix. Generator Index, internal impedance, and admittance matrix from power flow serve as the inputs. 
## [Unredcued Prefault Admittance Matrix with Load Shunts](https://github.com/ChenyiAXu/ECSE522_Course_project/blob/main/Y_prefault_unreduced_ls.m)
This function forms the unreduced prefault admittance matrix with loads \(Y1^{\prime}\). Unreduced prefault admittance matrix, load index, real power, reactive power, and voltage magnitudes are the inputs. For each load bus, an equivalent load admittance is calculated from the specified bus power and voltage magnitude, then inserted into the corresponding diagonal element of the admittance matrix. 
## [Unredcued Fault-on Admittance Matrix with Load Shunts]](https://github.com/ChenyiAXu/ECSE522_Course_project/blob/main/Y_fault_unreduced_ls.m)
This function forms the unreduced fault-on admittance matrix with load shunts, Y2'. The input arguments are Y1' and the faulted bus index. The fault-on network is obtained by removing the row and column corresponding to the faulted bus, which is equivalent to applying a solid three-phase fault at that bus. The resulting matrix retains all remaining network and generator internal nodes except the faulted bus.
## [Unredcued Post-fault Admittance Matrix with Load Shunts]](https://github.com/ChenyiAXu/ECSE522_Course_project/blob/main/Y_post_unreduced_ls.m)
This function forms the unreduced post-fault admittance matrix with load shunts, Y3'. The input arguments are Y1', the from-bus and to-bus of the disconnected branch, the branch admittance data, and the branch connection vectors. The function first identifies the line opened after fault clearing, then builds an adjustment matrix to remove that branch from the network. The off-diagonal mutual admittance terms associated with the opened line are removed, and the corresponding self-admittance terms on the two terminal buses are reduced accordingly. 
## [Kron Reduction](https://github.com/ChenyiAXu/ECSE522_Course_project/blob/main/kron_reudction.m)
This function performs Kron reduction on the unreduced admittance matrix to eliminate the non-generator buses and retain only the generator internal nodes. The inputs are the unreduced admittance matrix and the generator index vector.
## [Machine Internal Voltage](https://github.com/ChenyiAXu/ECSE522_Course_project/blob/main/machineVoltage.m)
The internal voltage is computed by adding the voltage drop across the generator internal reactance to the terminal voltage.
## [Electric Power](https://github.com/ChenyiAXu/ECSE522_Course_project/blob/main/electricPower.m)
This function computes the electrical power output of each generator from the reduced admittance matrix, generator internal voltage magnitudes, and rotor angles. The inputs are the internal voltage magnitudes, the reduced admittance matrix, and the rotor angle vector. 
## [Solution Routine](https://github.com/ChenyiAXu/ECSE522_Course_project/blob/main/solutionRoutine.m)
This function performs the main time-domain simulation of the multimachine system. The simulation time vector is first created and the state history is initialized. At each time step, the function selects the appropriate reduced admittance matrix depending on whether the system is in the prefault, fault-on, or post-fault interval. The machine states are then advanced by one time step using the implicit trapezoidal integration routine. The updated states and the number of iterations required for convergence are stored for each step.
The outputs are the simulation time vector, the full state history, and the iteration count history. This routine serves as the overall driver for the transient stability simulation.
### [Residual Function](https://github.com/ChenyiAXu/ECSE522_Course_project/blob/main/residualFunction.m)
This function forms the residual vector of the implicit trapezoidal discretization of the swing equations.

The state vector is divided into rotor angles and speed deviations. Electrical power is evaluated at both the previous state and the current state estimate using the reduced admittance matrix. The residual is then constructed from the trapezoidal integration formulas: the first half corresponds to the rotor angle equations, and the second half corresponds to the rotor speed equations.

This residual becomes zero when the current state satisfies the implicit trapezoidal update. It is therefore used within the nonlinear solver to determine the next time-step solution.
### [Jacobian Trapezoidal]()

### [Trapezoidal]()

## [Stability]()
