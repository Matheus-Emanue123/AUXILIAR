set datafile separator ","
set title "MinMax1"
set xlabel "Tamanho dos vetores"
set ylabel "Médias de tempo"
set xrange [0:500000]
set yrange [0:5000000]
set grid

set term png size 1350, 950

set output "~/Documents/CEFET/AEDS/AUXILIAR/AUXILIAR/TrabalhoMaxMin/output/Graficos/DatasetsMinMax1.png"
plot "ResultadosMinMax1.csv" using 1:2 with lp lw 3.0 lc 7 title "Vetor desordenado", \
     "ResultadosMinMax1.csv" using 3:4 with lines lw 3.0 title "Vetor ordenado crescente", \
     "ResultadosMinMax1.csv" using 5:6 with lines lw 3.0 title "Vetor ordenado decrescente"

set title "MinMax2"
set output "~/Documents/CEFET/AEDS/AUXILIAR/AUXILIAR/TrabalhoMaxMin/output/Graficos/DatasetsMinMax2.png"
plot "ResultadosMinMax2.csv" using 1:2 with lp lw 3.0 lc 7 title "Vetor desordenado", \
     "ResultadosMinMax2.csv" using 3:4 with lines lw 3.0 title "Vetor ordenado crescente", \
     "ResultadosMinMax2.csv" using 5:6 with lines lw 3.0 title "Vetor ordenado decrescente"

set title "MinMax3"
set output "~/Documents/CEFET/AEDS/AUXILIAR/AUXILIAR/TrabalhoMaxMin/output/Graficos/DatasetsMinMax3.png"
plot "ResultadosMinMax3.csv" using 1:2 with lp lw 3.0 lc 7 title "Vetor desordenado", \
     "ResultadosMinMax3.csv" using 3:4 with lines lw 3.0 title "Vetor ordenado crescente", \
     "ResultadosMinMax3.csv" using 5:6 with lines lw 3.0 title "Vetor ordenado decrescente"

set title "Medias MinMax1"
set output "~/Documents/CEFET/AEDS/AUXILIAR/AUXILIAR/TrabalhoMaxMin/output/Graficos/DatasetsMediasMinMax1.png"
plot "ResultadosMediasMinMax1.csv" using 1:2 with lp lw 3.0 lc 7 title "Vetor desordenado", \
     "ResultadosMediasMinMax1.csv" using 3:4 with lines lw 3.0 title "Vetor ordenado crescente", \
     "ResultadosMediasMinMax1.csv" using 5:6 with lines lw 3.0 title "Vetor ordenado decrescente"


set title "Médias MinMax2"
set output "~/Documents/CEFET/AEDS/AUXILIAR/AUXILIAR/TrabalhoMaxMin/output/Graficos/DatasetsMediasMinMax2.png"
plot "ResultadosMediasMinMax2.csv" using 1:2 with lp lw 3.0 lc 7 title "Vetor desordenado", \
     "ResultadosMediasMinMax2.csv" using 3:4 with lines lw 3.0 title "Vetor ordenado crescente", \
     "ResultadosMediasMinMax2.csv" using 5:6 with lines lw 3.0 title "Vetor ordenado decrescente"


set title "Médias MinMax3"
set output "~/Documents/CEFET/AEDS/AUXILIAR/AUXILIAR/TrabalhoMaxMin/output/Graficos/DatasetsMediasMinMax3.png"
plot "ResultadosMediasMinMax3.csv" using 1:2 with lp lw 3.0 lc 7 title "Vetor desordenado", \
     "ResultadosMediasMinMax3.csv" using 3:4 with lines lw 3.0 title "Vetor ordenado crescente", \
     "ResultadosMediasMinMax3.csv" using 5:6 with lines lw 3.0 title "Vetor ordenado decrescente"
