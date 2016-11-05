#!/bin/bash

#g_wham -it md2_tpr -if md2_pullf -v -o -hist -unit kCal >& wham.log &
g_wham -it md_tpr -if md_pullf -b 100 -v -o -hist -unit kCal >& wham.log &
#g_wham -it md3_tpr -if md3_pullf -o -hist -unit kCal
