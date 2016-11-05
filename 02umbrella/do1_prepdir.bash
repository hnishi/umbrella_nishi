#!/bin/bash

temp_list="conf.list"
cdir=$(pwd)

pre_dir="/lfs/mtateno/hnishi/kek9/4thUS/70prep1P2D"
#tdir=${cdir}/md1_test
#tdir=${cdir}/md2_test
tdir=${cdir}/md1

mkdir -p $tdir
#template=MD_TEST.mdp.template
template=MD13_PRODUCTION.mdp.template

i=1
for temp in $(cat $temp_list | cut -f 1 -d " ");
do
  echo no${i}, conf: $temp, distance: $(cat conf.list | cut -f 2 -d " "| sed -n ${i}p) nm 
  mkdir -p ${tdir}/no${i}
  touch ${tdir}/no${i}/$(cat conf.list | cut -f 2 -d " "| sed -n ${i}p)nm
  #sed -e "s;298.00;$temp;g" MD2_UMBRELLA.mdp.template > ${tdir}/no${i}/MD2_UMBRELLA.mdp
  #grep $temp ${tdir}/no${i}/MD2_UMBRELLA.mdp
  #cp EQ3_NPT.mdp.template  ${tdir}/no${i}/EQ3_NPT.mdp
  cp $template  ${tdir}/no${i}/MD.mdp
  #cp ${pre_dir}/pullconfs/conf${temp}.gro  ${tdir}/no${i}/
  cp ${pre_dir}/pullconfs/conf${temp}.gro  ${tdir}/no${i}/in.gro
  cp ${pre_dir}/prm.top   ${tdir}/no${i}/
  cp ${pre_dir}/*.itp   ${tdir}/no${i}/
  cp ${pre_dir}/index.ndx   ${tdir}/no${i}/

  sleep 0.1s
  i=$(($i+1))
done

