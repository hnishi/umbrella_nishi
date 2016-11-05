#!/bin/bash

#grompp_mpi_d -f IONS.mdp -c solv.gro -p topol.top -o ions.tpr
#genion_mpi_d -s ions.tpr -o solv_ions.gro -p topol.top -pname NA -nname CL -neutral -conc 0.1

#gmx grompp -f IONS.mdp -c solv.gro -p prm.top -o ions_mg.tpr
#gmx genion -s ions_mg.tpr -o solv_mg.gro -p prm.top -pname MG -nname CL -neutral -conc 0.01 <<< "SOL"

#gmx grompp -f IONS.mdp -c solv_mg.gro -p prm.top -o ions_mg_na.tpr
#gmx genion -s ions_mg_na.tpr -o solv_mg_na.gro -p prm.top -pname NA -nname CL -conc 0.15 <<< "SOL"

grompp -f IONS.mdp -c solv.gro -p prm.top -o ions_mg.tpr
#genion -s ions_mg.tpr -o solv_mg.gro -p prm.top -pname MG -nname CL -neutral -conc 0.01 <<< "SOL"
genion -s ions_mg.tpr -o solv_mg.gro -p prm.top -pname MG -pq 2 -np 128 <<< "SOL"

grompp -f IONS.mdp -c solv_mg.gro -p prm.top -o ions_mg_na.tpr
#genion -s ions_mg_na.tpr -o solv_mg_na.gro -p prm.top -pname NA -nname CL -conc 0.15 <<< "SOL"
genion -s ions_mg_na.tpr -o solv_mg_na.gro -p prm.top -pname NA -nname CL -neutral -conc 0.15 <<< "SOL"

#We are going to be conducting these simulations in the presence of 100 mM NaCl, on top of neutralizing counterions
