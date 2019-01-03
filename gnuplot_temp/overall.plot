load "common.plot"
set terminal pdfcairo enhanced font "Gill Sans,20" linewidth 2 dashed size 8,1.75in

set style line 100 lt 1 lc rgb "#606060"
set style line 101 lt 0 lc rgb "#606060"

set title font ",24"
set border 3 back ls 100
set grid noxtics ytics back ls 101
set xtics nomirror
set ytics nomirror
set pointsize 1
set bmargin 2.40
set key at screen 0.86,0.11 maxrows 1 samplen 2

max(a,b) = ((a > b) ? a : b)
set style data histogram
set style fill pattern 1 border
set boxwidth 1
set style histogram clustered gap 1


set notitle
set ylabel "Speedup normalized to O3" offset 1 font ",18"
#unset logscale y
set xrange [-.5:7.5]
set xtics ("LULESH" 0, "CL" 1, "AMG" 2, "Optewe" 3, "bwaves" 4, "fma3d" 5, "swim" 6, "GM" 7) offset 0,.5
set yrange [0.6:1.2]
set ytics .1
set style textbox opaque noborder

set output "opteron.pdf"
set label 1 boxed "1.52" at 4.2,1.2 front
plot newhistogram "", "overall_opt.dat" using ($1) title sprintf("%s",rand) @fs1 @colora,\
"" using ($2) title sprintf("%s",real) @fs2 @colorb,\
"" using ($3) title sprintf("%s",fr) @fs3 @colorg,\
"" using ($4) title sprintf("%s",cfr) @fs4 @colore,\
"" using ($5) title sprintf("%s",expect) @fsR @colord,\

set output "sandy.pdf"
unset label 1
plot newhistogram "", "overall_sandy.dat" using ($1) title sprintf("%s",rand) @fs1 @colora,\
"" using ($2) title sprintf("%s",real) @fs2 @colorb,\
"" using ($3) title sprintf("%s",fr) @fs3 @colorg,\
"" using ($4) title sprintf("%s",cfr) @fs4 @colore,\
"" using ($5) title sprintf("%s",expect) @fsR @colord,\

set output "broad.pdf"
set label 1 boxed "1.73" at 4.2,1.2 front
set label 2 boxed "1.24" at 0.2,1.2 front
set label 3 boxed "1.24" at 3.2,1.2 front
plot newhistogram "", "overall_broad.dat" using ($1) title sprintf("%s",rand) @fs1 @colora,\
"" using ($2) title sprintf("%s",real) @fs2 @colorb,\
"" using ($3) title sprintf("%s",fr) @fs3 @colorg,\
"" using ($4) title sprintf("%s",cfr) @fs4 @colore,\
"" using ($5) title sprintf("%s",expect) @fsR @colord,\

