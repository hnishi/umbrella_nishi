#!/bin/bash
#tdir="/lfs/mtateno/hnishi/kek9/4thUS/pull_dynamics/02umbrella/md2_umbrella"
#tdir="/lfs/mtateno/hnishi/kek9/4thUS/pull_dynamics/02umbrella/md3_umbrella"
#tdir="/lfs/mtateno/hnishi/kek9/4thUS/02umnrella/md2_mdx"
#tdir="/lfs/mtateno/hnishi/kek9/4thUS/02umnrella/md11"
#tdir="/lfs/mtateno/hnishi/kek9/4thUS/02umnrella/md12"
tdir="/lfs/mtateno/hnishi/kek9/4thUS/18umbrella/md1_test"
cdir=$(pwd)


echo $tdir
#rm ${tdir}/md3_*.dat

#for i in {1..32} 
for i in {17..32} 
do
  sed "s;_XXX;_${i};g" ${cdir}/q_mdx.sh.template > ${tdir}/no$i/q_mdx.sh

  cd ${tdir}/no$i
  echo no${i}
  qsub q_mdx.sh
  cd $tdir

    #echo ${tdir}/no${i}/md3.tpr >> ${tdir}/md3_tpr.dat
    #echo ${tdir}/no${i}/md3_pullx.xvg >> ${tdir}/md3_pullx.dat
    #echo ${tdir}/no${i}/md3_pullf.xvg >> ${tdir}/md3_pullf.dat

  sleep 0.1s
done

