set datafile separator ","
set xlabel "Tamanho dos vetores"
set ylabel "Médias de tempo"
set xrange [0:500000]
set yrange [0:5000000]
set grid
set term png size 1350, 950

# Plot for Função and Estado
set title "Função1 Estado1"
set output "/home/matheus/Documents/CEFET/AEDS/AUXILIAR/AUXILIAR/TrabalhoMaxMin/output/Graficos/Resultados_Funcao1_Estado1.png"
plot "/home/matheus/Documents/CEFET/AEDS/AUXILIAR/AUXILIAR/TrabalhoMaxMin/PorFuncaoEstado/Resultados_1_1.csv" using 1:2 with lp lw 3.0 lc 7 title "Vetor desordenado", \
     "/home/matheus/Documents/CEFET/AEDS/AUXILIAR/AUXILIAR/TrabalhoMaxMin/PorFuncaoEstado/Resultados_1_1.csv" using 3:4 with lines lw 3.0 title "Vetor ordenado crescente", \
     "/home/matheus/Documents/CEFET/AEDS/AUXILIAR/AUXILIAR/TrabalhoMaxMin/PorFuncaoEstado/Resultados_1_1.csv" using 5:6 with lines lw 3.0 title "Vetor ordenado decrescente"

# Repeat for other combinations of Função and Estado
# Example for Função2 Estado2
set title "Função2 Estado2"
set output "/home/matheus/Documents/CEFET/AEDS/AUXILIAR/AUXILIAR/TrabalhoMaxMin/output/Graficos/Resultados_Funcao2_Estado2.png"
plot "/home/matheus/Documents/CEFET/AEDS/AUXILIAR/AUXILIAR/TrabalhoMaxMin/PorFuncaoEstado/Resultados_2_2.csv" using 1:2 with lp lw 3.0 lc 7 title "Vetor desordenado", \
     "/home/matheus/Documents/CEFET/AEDS/AUXILIAR/AUXILIAR/TrabalhoMaxMin/PorFuncaoEstado/Resultados_2_2.csv" using 3:4 with lines lw 3.0 title "Vetor ordenado crescente", \
     "/home/matheus/Documents/CEFET/AEDS/AUXILIAR/AUXILIAR/TrabalhoMaxMin/PorFuncaoEstado/Resultados_2_2.csv" using 5:6 with lines lw 3.0 title "Vetor ordenado decrescente"

# Plot for Função and Vetor
set title "Função1 Vetor1"
set output "/home/matheus/Documents/CEFET/AEDS/AUXILIAR/AUXILIAR/TrabalhoMaxMin/output/Graficos/Resultados_Funcao1_Vetor1.png"
plot "/home/matheus/Documents/CEFET/AEDS/AUXILIAR/AUXILIAR/TrabalhoMaxMin/PorFuncaoVetor/Resultados_1_1.csv" using 1:2 with lp lw 3.0 lc 7 title "Vetor desordenado", \
     "/home/matheus/Documents/CEFET/AEDS/AUXILIAR/AUXILIAR/TrabalhoMaxMin/PorFuncaoVetor/Resultados_1_1.csv" using 3:4 with lines lw 3.0 title "Vetor ordenado crescente", \
     "/home/matheus/Documents/CEFET/AEDS/AUXILIAR/AUXILIAR/TrabalhoMaxMin/PorFuncaoVetor/Resultados_1_1.csv" using 5:6 with lines lw 3.0 title "Vetor ordenado decrescente"

# Repeat for other combinations of Função and Vetor
# Example for Função2 Vetor2
set title "Função2 Vetor2"
set output "/home/matheus/Documents/CEFET/AEDS/AUXILIAR/AUXILIAR/TrabalhoMaxMin/output/Graficos/Resultados_Funcao2_Vetor2.png"
plot "/home/matheus/Documents/CEFET/AEDS/AUXILIAR/AUXILIAR/TrabalhoMaxMin/PorFuncaoVetor/Resultados_2_2.csv" using 1:2 with lp lw 3.0 lc 7 title "Vetor desordenado", \
     "/home/matheus/Documents/CEFET/AEDS/AUXILIAR/AUXILIAR/TrabalhoMaxMin/PorFuncaoVetor/Resultados_2_2.csv" using 3:4 with lines lw 3.0 title "Vetor ordenado crescente", \
     "/home/matheus/Documents/CEFET/AEDS/AUXILIAR/AUXILIAR/TrabalhoMaxMin/PorFuncaoVetor/Resultados_2_2.csv" using 5:6 with lines lw 3.0 title "Vetor ordenado decrescente"