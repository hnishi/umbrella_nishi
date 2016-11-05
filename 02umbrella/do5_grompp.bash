#!/bin/bash

temp_list="conf.list"
#tdir="/lfs/mtateno/hnishi/kek9/4thUS/18umbrella/md1_test"
#tdir="/lfs/mtateno/hnishi/kek9/4thUS/18umbrella/md2_test"
tdir="/lfs/mtateno/hnishi/kek9/4thUS/71umbrella/md1"

tag="md"
rm ${tdir}/${tag}_*.dat

i=1
for fn in $(cat $temp_list | awk '{print $1}') 
do 
    echo $fn
    cd ${tdir}/no$i
    pwd
    #grompp_mpi_d -f MD2_UMBRELLA.mdp -c eq2_npt.gro -p topol.top -n index.ndx -o md2.tpr #-maxwarn 1
    #grompp -f MD2_UMBRELLA.mdp -c in.gro -t in.cpt -p prm.top -o md.tpr #-maxwarn 1
    grompp -f MD.mdp -c in.gro  -p prm.top -n index.ndx -o md.tpr -maxwarn 1
    
    cd ${tdir}
    echo ${tdir}/no${i}/md.tpr >> ${tdir}/${tag}_tpr.dat
    echo ${tdir}/no${i}/md_pullx.xvg >> ${tdir}/${tag}_pullx.dat
    echo ${tdir}/no${i}/md_pullf.xvg >> ${tdir}/${tag}_pullf.dat

    sleep 0.1s
    i=$(($i+1))
done

ls -l ${tdir}/no*/*tpr |wc


