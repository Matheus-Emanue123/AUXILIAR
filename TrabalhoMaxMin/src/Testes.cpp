#include "Testes.hpp"
#include "GerarVetores.hpp"
#include "MinMax.hpp"
#include <iostream>
#include <algorithm>
#include <chrono>
#include <fstream>

void executarTestes() {
    std::vector<int> vetores[] = {gerarVetorAleatorio(1000), gerarVetorAleatorio(10000), gerarVetorAleatorio(100000), gerarVetorAleatorio(500000)};
    int max, min;
    std::ofstream file("resultados.mps");

    std::vector<std::function<void(std::vector<int>&, int&, int&)>> funcoes = {MinMax1, MinMax2, MinMax3};
    std::vector<std::string> estados = {"aleatório", "crescente", "decrescente"};

    std::vector<std::string> nomesFuncoes = {"MinMax1", "MinMax2", "MinMax3"};

    // ...
std::ofstream fileCSV("resultados.csv");
// fileCSV << "Função,Vetor,Max,Min,Estado,Tempo Médio\n"; // linha comentada

for(int f = 0; f < funcoes.size(); f++) {
    auto& funcao = funcoes[f];
    // std::string nomeFuncao = nomesFuncoes[f]; // linha comentada
    for(int i = 0; i < sizeof(vetores)/sizeof(vetores[0]); i++) {
        auto vetor = vetores[i]; 
        for(auto& estado : estados) {
            if(estado == "crescente") std::sort(vetor.begin(), vetor.end());
            else if(estado == "decrescente") std::sort(vetor.rbegin(), vetor.rend());

            std::chrono::duration<double> tempo_total;
            for(int j = 0; j < 10; j++) {
                auto inicio = std::chrono::high_resolution_clock::now();
                funcao(vetor, max, min);
                auto fim = std::chrono::high_resolution_clock::now();
                auto tempo_execucao = std::chrono::duration_cast<std::chrono::microseconds>(fim - inicio);
                tempo_total += tempo_execucao;

                // std::cout << "Tempo da execução " << (j+1) << ": " << tempo_execucao.count() << " microssegundos\n"; // linha comentada
            }
            tempo_total /= 10.0;

            // std::string output = "Função: " + nomeFuncao + ", Vetor " + std::to_string(i+1) + ", Max: " + std::to_string(max) + ", Min: " + std::to_string(min) + ", Tempo médio (" + estado + "): " + std::to_string(std::chrono::duration<double, std::micro>(tempo_total).count()) + " microssegundos\n"; // linha comentada
            // std::cout << output; // linha comentada
            // file << output; // linha comentada
            // file.flush(); // linha comentada

            fileCSV << f+1 << "," << i+1 << "," << max << "," << min << "," << (estado == "crescente" ? 1 : (estado == "decrescente" ? 2 : 3)) << "," << std::chrono::duration<double, std::micro>(tempo_total).count() << "\n";
            fileCSV.flush();
        }
    }
}
// file.close(); // linha comentada
fileCSV.close();
}