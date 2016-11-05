#!/bin/bash
#PBS -q large    
#PBS -l select=24:ncpus=16:mpiprocs=16
#PBS -N 4th_71_27 
#PBS -m ae
#PBS -l walltime=720:00:00

cd $PBS_O_WORKDIR

#grompp -v -f MD1.mdp -c eq2.gro -p prm.top -o md1
#mpijob /lfs/mtateno/chika/program/all/gromacsMPI/bin/mdrun_mpi -v -deffnm md1
#mpijob /lfs/mtateno/chika/program/all/gromacsMPI/bin/mdrun_mpi -v -deffnm md1 -cpi md1.cpt
#mpijob /lfs/mtateno/chika/program/all/gromacsMPI/bin/mdrun_mpi -v -deffnm md2 -pf md2_pullf.xvg -px md2_pullx.xvg 

cdir=/lfs/mtateno/hnishi/kek9/4thUS/71umbrella/md1
log=4th_71_27.log

#for i in {1..14}
#for i in {15..27}
for i in {16..27}
do
    echo "@@@@@@ no$i "
    cd ${cdir}/no${i}
    pwd
    mpijob /lfs/mtateno/chika/program/all/gromacsMPI/bin/mdrun_mpi -v -deffnm md -pf md_pullf.xvg -px md_pullx.xvg > $log 2>&1
done
#mpirun -np 8 mdrun_mpi_d -deffnm md1
#The estimate for PME load will dictate how many processors should be dedicated to the PME calculation, and how many for the PP calculations. Refer to the GROMACS 4 publication and the manual for details. For a cubic box, the optimal setup will have a PME load of 0.25 (3:1 PP:PME - we're in luck!); for a dodecahedral box, the optimal PME load is 0.33 (2:1 PP:PME). When executing mdrun, the program should automatically determine the best number of processors to assign for the PP and PME calculations. Thus, make sure you indicate an appropriate number of nodes for your calculation (the value of -np X), so that you can get the best performance. For this system, I achieved roughly 14 ns/day performance on 24 CPU's (18 PP, 6 PME).
