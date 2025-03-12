set terminal pngcairo size 900,900

red = "#FF0000"
green = "#00FF00"
blue = "#0000FF"

set title ""
set xlabel ""
set ylabel ""
set style data histogram
set style histogram cluster gap 3
set style fill solid
set grid ytics

set output "plots/pictures/task3.png"
plot "outputs/task3/source_begin.dat" title "\\^source" linecolor rgb red, \
     "outputs/task3/source_whole.dat" title "source" linecolor rgb blue, \
     "outputs/task3/source_end.dat" title "source$" linecolor rgb green
