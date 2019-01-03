load "common.plot"
set terminal pdfcairo enhanced font "Gill Sans,36" linewidth 2 dashed size 8,3in

set style line 100 lt 1 lc rgb "#606060"
set style line 101 lt 0 lc rgb "#606060"

set title font ",24"
set border 3 back ls 100
set grid noxtics ytics back ls 101
set xtics nomirror
set ytics nomirror
set pointsize 1
set bmargin 1.60
set key at screen 0.92,0.92 maxrows 1 samplen 3

max(a,b) = ((a > b) ? a : b)
set style data histogram
set style fill pattern 1 border
set boxwidth 1
set style histogram clustered gap 1


set notitle
set ylabel "Speedup normalized to O3" offset 1 font ",32"
#unset logscale y
set xrange [-.5:1.5]
set xtics ("GCC" 0, "ICC" 1) offset 0,.4
set yrange [0.4:1.2]
set ytics .2
set style textbox opaque noborder

set output "intro.pdf"
plot newhistogram "", "intro.dat" using ($1) title sprintf("%s","LULESH") @fs1 @colora,\
"" using ($2) title sprintf("%s","Cloverleaf") @fs2 @colorb,\
"" using ($3) title sprintf("%s","AMG") @fs3 @colorg


