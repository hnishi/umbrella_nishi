#grompp_mpi_d -f IONS.mdp -c solv_mg_na.gro -p prm.top -o min1.tpr
#mpirun -np 2 mdrun_mpi_d -v -deffnm min1 

#qsub q_min.sh
#grompp_mpi_d -f EQ1_NPT.mdp -c min1.gro -p topol.top -o eq1_npt.tpr
#mpirun -np 8 mdrun_mpi_d -v -deffnm eq1_npt 

qsub q_min_eq.sh

#Because these procedures are time-consuming, they are likely best run in parallel, i.e.:
#gmx mdrun -nt X -deffnm npt
#In the above command, "X" represents the desired number of threads over which the parallel calculation is conducted.


