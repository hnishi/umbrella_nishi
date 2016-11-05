#genbox_mpi_d -cp newbox.gro -cs spc216.gro -o solv.gro -p topol.top 

#TIP3p --> spc216
#gmx solvate -cp newbox.gro -cs spc216.gro -o solv.gro -p prm.top 
genbox -cp newbox.gro -cs spc216.gro -o solv.gro -p prm.top 
 
# -cp means configuration of protein
# -cs means configuration of solvent

# spc216.gro is installed at the same time as GROMACS, a generic equilibrated 3-point water model
# spc216.gro can be used when SPC, SPC/E or TIP3
# topol.top should be located in the current directory

#Any 3-point water model will be fine for generating solvent coordinates 
#- the standard practice in GROMACS is to solvate with spc216.gro (per 
#man genbox) and then in the .top file to #include "tip3p.itp" 
