#!/usr/bin/perl -w

use strict;

system("echo Protein > inp.txt");
system("echo DNA >> inp.txt");
# loop g_dist command - measure distance in each frame, write to a file
for (my $i=0; $i<=600; $i++) {
    print "Processing configuration $i...\n";
    #system("gmx distance -s pull.tpr -f conf${i}.gro -n index.ndx -oall dist${i}.xvg -select \'com of group \"Chain_A\" plus com of group \"Chain_B\"\' &>/dev/null");
    system("g_dist -s ../md1.tpr -f conf${i}.gro -o dist${i}.xvg < inp.txt"); # -select \'com of group \"Chain_A\" plus com of group \"Chain_B\"\' "); #&>/dev/null");
}

# write output to single file
open(OUT, ">>summary_distances.dat");

for (my $j=0; $j<=600; $j++) {
    open(IN, "<dist${j}.xvg");
    my @array = <IN>;

    my $distance;

    foreach $_ (@array) {
        if ($_ =~ /[#@]/) {
            # do nothing, it's a comment or formatting line
        } else {
            my @line = split(" ", $_);
            $distance = $line[1];
        }
    }

    close(IN);
    print OUT "$j\t$distance\n";
}

close(OUT);

# clean up
#print "Cleaning up...\n";

#for (my $k=0; $k<=500; $k++) {
#    unlink "dist${k}.xvg";
#}

exit;
