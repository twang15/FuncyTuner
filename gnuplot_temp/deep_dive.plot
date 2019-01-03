load "common.plot"
set terminal pdfcairo enhanced font "Gill Sans,34" linewidth 2 dashed size 8,3in

set style line 100 lt 1 lc rgb "#606060"
set style line 101 lt 0 lc rgb "#606060"

set title font ",24"
set border 3 back ls 100
set grid noxtics ytics back ls 101
set xtics nomirror
set ytics nomirror
set pointsize 1
set bmargin 1.60
#set key at screen 0.97,0.09 maxrows 1 samplen 3
set key top right maxrows 2 samplen 3

max(a,b) = ((a > b) ? a : b)
set style data histogram
set style fill pattern 1 border
set boxwidth 1
set style histogram clustered gap 1


set notitle
set ylabel "Speedup normalized to O3" offset 1
#unset logscale y
set xrange [-.5:4.5]
set xtics ("dt" 0, "cell3" 1, "cell7" 2, "mom9" 3, "acc" 4) offset 0,.4
set yrange [0:1.6]
set ytics .4
set style textbox opaque noborder

set output "deep_dive.pdf"
plot newhistogram "", "deep_dive.dat" using ($3) title sprintf("%s","R/COBAYN") @fs1 @colora,\
"" using ($1) title sprintf("%s",real) @fs2 @colorb,\
"" using ($4) title sprintf("%s",cfr) @fs4 @colore,\
"" using ($2) title sprintf("%s",expect) @fsR @colord

