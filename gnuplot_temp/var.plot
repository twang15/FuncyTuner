load "common.plot"
set terminal pdfcairo enhanced font "Gill Sans,28" linewidth 3 dashed size 8,3in

set style line 100 lt 1 lc rgb "#606060"
set style line 101 lt 0 lc rgb "#606060"

set title font ",24"
set border 3 back ls 100
set grid noxtics ytics back ls 101
set xtics nomirror
set ytics nomirror
set pointsize 1
set xlabel offset 0,.5
set bmargin 1.60
set key top left maxrows 2
set title offset 0,-.5

max(a,b) = ((a > b) ? a : b)
set style data histogram
set style fill pattern 1 border
set boxwidth 1
set style histogram clustered gap 1

set output "var.pdf"

set title "Impact of inter-job interference"
set ylabel "% slow down" offset 1 font ",24"
unset logscale y
set xrange [-.5:5.5]
#set noxtics
set xtics ("Atratus" 0, "Mercury" 1, "MILC" 2, "ParaDis" 3, "pF3D" 4, "Qbox" 5) offset 0,.5
#set xtics rotate by -15 offset -1
#set format y "%.0E"
#set yrange [0:]

offset1(x) = (x < 1 ? 4 : x < 2 ? .6 : x < 3 ? .1 : .06)
plot newhistogram "", "var.dat" using ($1*100) title "SR-EDR" @fs1 @colora,\
"" using ($2*100) title "DRP-T-EDR" @fs2 @colorb,\
"" using ($3*100) title "DRP-EDR" @fs3 @colorc,\
"" using ($4*100) title "SR-HDR" @fs4 @colord,\
"" using ($5*100) title "DR-T-HDR" @fsR @colore,\
"" using ($6*100) title "DR-HDR" @fsP @colorf

