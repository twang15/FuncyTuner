load "common.plot"
set terminal pdfcairo enhanced font "Gill Sans,13" linewidth 2 dashed size 8,1.75in

set style line 100 lt 1 lc rgb "#606060"
set style line 101 lt 0 lc rgb "#606060"

set title font ",24"
set border 3 back ls 100
set grid noxtics ytics back ls 101
set xtics nomirror
set ytics nomirror
set pointsize 1
set bmargin 1.60
set key at screen 0.97,0.94 maxrows 1 samplen 2 font ",13"


max(a,b) = ((a > b) ? a : b)
set style data histogram
set style fill pattern 1 border
set boxwidth 1
set style histogram clustered gap 1


set notitle
set ylabel "Speedup normalized to O3" offset 1 font ",13"
#unset logscale y
set xrange [-.5:7.5]
set xtics ("LULESH" 0, "CL" 1, "AMG" 2, "Optewe" 3, "bwaves" 4, "fma3d" 5, "swim" 6, "GM" 7) offset 0,.4
set yrange [0.6:1.35]
set ytics .1
set style textbox opaque noborder

set output "small.pdf"
plot newhistogram "", "small.dat" using ($1) title sprintf("%s","Random") @fs1 @colora,\
"" using ($2) title sprintf("%s","G.realized") @fs3 @colorg,\
"" using ($3) title sprintf("%s","COBAYN") @fsR @colord,\
"" using ($4) title sprintf("%s","PGO") @fs2 @colorb,\
"" using ($5) title sprintf("%s","FR") @fs4 @colore,\
"" using ($6) title sprintf("%s","CFR") @fsP @colorc

