for i in no{1..32}
#for i in no{1..64}
do
    cd $i
    #g_energy -f md.edr -o temp <<< "Temperature" #<<< "Potential"
    g_analyze -f md_pullx.xvg -dist dist_pullx -bw 0.400
    cd ..
done
