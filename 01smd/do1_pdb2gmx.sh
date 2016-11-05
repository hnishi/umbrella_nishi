#gmx pdb2gmx -f rottrans02.pdb -ignh -ter -o complex.gro -p prm.top 
#gmx pdb2gmx -f k8.pdb -ignh -ter -o complex.gro -p prm.top 
pdb2gmx -f 01.pdb -ignh -ter -o complex.gro -p prm.top -ff amber99sb -water tip3p 
#<< _EOF
#i5
#1
#_EOF

#cp topol.top prm.top

#amberff99sb
#tip3p water



