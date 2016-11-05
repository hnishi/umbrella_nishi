#!/bin/bash -eu

awk '{if($1==i){print $1/2,$3;i=i+2}}' md1_pullx.xvg > summary_z.dat

mkdir -p ./pullconfs
cd ./pullconfs
trjconv -s ../md1.tpr -f ../md1.xtc -o conf.gro -sep <<< 'System'
perl ../distances.pl
cd ..


