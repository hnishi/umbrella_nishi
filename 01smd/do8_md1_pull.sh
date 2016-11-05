#grompp_mpi_d -f MD1_PULL.mdp -c eq1_npt.gro -p topol.top -n index.ndx -t eq1_npt.cpt -o md1_pull.tpr
#mpirun -np 8 mdrun_mpi_d -deffnm md1_pull -px md1_pullx.xvg -pf  md1_pullf.xvg

qsub q_pull.sh
