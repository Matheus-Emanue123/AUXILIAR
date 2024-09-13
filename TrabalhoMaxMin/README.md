<div align="center">
    <img src="./imagens/logo.jpeg" width="200" height="200">
</div>

<div align="center">

# 🪐 MinMax

</div>

## ☕ Introdução

Este trabalho foi proposto pelo professor [Michel Pires Silva](https://github.com/mpiress), da matéria Algoritmos e Estrutura de Dados I, do Centro Federal de Educação Tecnológica de Minas Gerais (CEFET - MG), Campus V - Divinópolis.

A eficiência dos algoritmos é fundamental para o desempenho de sistemas computacionais, especialmente em contextos onde grandes volumes de dados são processados. A busca por algoritmos mais rápidos e eficientes envolve a análise detalhada de seu comportamento frente a diferentes tamanhos de entrada. A análise assintótica, frequentemente referida como "análise de complexidade Big O (𝑂)", é uma ferramenta amplamente utilizada para medir o crescimento do tempo de execução de um algoritmo conforme o tamanho da entrada, 𝑛, aumenta.

Essa técnica de análise nos permite estimar o comportamento do algoritmo a longo prazo, quando 𝑛 tende ao infinito, oferecendo uma perspectiva clara sobre sua escalabilidade. No entanto, é importante notar que a análise assintótica considera apenas a quantidade de interações do algoritmo com os dados, sem levar em conta variações no hardware ou em outros fatores de implementação que podem afetar o desempenho real em termos de tempo de execução. Assim, mesmo que dois algoritmos apresentem a mesma complexidade, seu desempenho prático pode variar em determinadas situações.

Neste projeto, investigamos três variações do algoritmo MinMax, criado pelo professor Nívio Ziviani, da Universidade Federal de Minas Gerais (UFMG). Esses algoritmos têm como objetivo encontrar simultaneamente o menor e o maior valor em um conjunto de dados, e cada variação – MinMax 1, MinMax 2 e MinMax 3 – adota diferentes abordagens para essa busca, resultando em diferentes custos computacionais. Ao longo deste trabalho, buscamos não apenas explicar o funcionamento detalhado de cada variação, mas também comparar seu comportamento em termos de complexidade computacional, utilizando a análise assintótica como base. Para além da teoria, apresentaremos os resultados de testes empíricos, que ilustram o desempenho prático de cada algoritmo em diferentes cenários.
   
## 💡 Príncipios Teóricos

Nesta seção, abordaremos os 3 algoritmos propostos, analisando seu funcionamento e custo computacional em diferentes casos. Na figura abaixo temos os valores das funções `f(n)` para cada cada um dos algortimos em cada um dos casos - melhor, médio e pior.

![alt text](imagens/custoAlg.png)

Como pode-se observar ao analisar a imagem, embora todos os algoritmos tenham custo linear, ou seja, \(O(n)\), é possível notar algumas diferenças, mesmo que pequenas, nas constantes que influenciam seu desempenho. Isso significa que, em valores muito grandes de \(n\), eles podem acabar se comportando de maneira semelhante, desde que as entradas estejam ordenadas de forma a não impactar tanto.

### MinMax 1

 ```cpp

void MaxMin1(std::vector<int>& A, int& Max, int& Min) {
    Max = A[0], Min = A[0];
    for(int i = 1; i < A.size(); i++) {
        if(A[i] > Max) Max = A[i];
        if(A[i] < Min) Min = A[i];
    }
}
```
    A função `MaxMin1` percorre um vetor de inteiros `A` e encontra o valor máximo e mínimo de forma linear. O processo começa inicializando as variáveis `Max` e `Min` com o primeiro elemento do vetor. Em seguida, um laço percorre o vetor a partir do segundo elemento, comparando cada valor com `Max` e `Min`, atualizando-os se um elemento maior ou menor for encontrado, respectivamente. 

    O número exato de comparações realizadas é \(2(n-1)\), pois para cada um dos \(n-1\) elementos restantes são feitas duas comparações (uma para o máximo e outra para o mínimo). No entanto, o custo computacional assintótico é \(O(n)\), já que o fator constante não altera o crescimento com grandes valores de \(n\).

### MinMax 2

```cpp

void MaxMin2(std::vector<int>& A, int& Max, int& Min) {
    Max = A[0], Min = A[0];
    for(int i = 1; i < A.size(); i++) {
        if(A[i] > Max) Max = A[i];
        else if(A[i] < Min) Min = A[i];
    }
}
```

A função `MaxMin2` percorre um vetor de inteiros `A` para encontrar os valores máximo e mínimo de forma similar à função `MaxMin1`, mas com uma pequena otimização. As variáveis `Max` e `Min` são inicializadas com o primeiro elemento do vetor. Em seguida, o laço percorre o vetor a partir do segundo elemento. Para cada elemento, se ele for maior que o valor atual de `Max`, a variável é atualizada; caso contrário, uma única comparação adicional é feita para verificar se o elemento é menor que `Min`. A seguir, vamos destrinchar cada um dos casos do algoritmo e seu custo.

### Melhor caso
Ocorre quando o vetor está ordenado em ordem decrescente. Neste caso, todos os elementos seguintes ao primeiro serão menores que ele. Assim, apenas uma comparação será necessária por iteração, já que a condição `if (A[i] > Max)` sempre falhará, mas `else if (A[i] < Min)` será verdadeiro. Dessa forma, o melhor caso realiza \(n-1\) comparações.

### Pior caso
O pior caso acontece quando o vetor está ordenado em ordem crescente. Aqui, todos os elementos subsequentes ao primeiro serão maiores que o primeiro valor, o que força o programa a realizar as duas comparações em todas as iterações, ou seja, tanto `if (A[i] > Max)` quanto `else if (A[i] < Min)` serão executados. Nesse cenário, o número total de comparações será \(2(n-1)\), similar ao algoritmo `MaxMin1`.

### Caso médio
Em um cenário com dados aleatórios, o comportamento médio resultará em aproximadamente uma comparação e meia por iteração. Isso ocorre porque, em média, metade das vezes o valor comparado será maior que `Max` e a outra metade será menor que `Min`. Portanto, o número médio de comparações será \( \frac{3}{2} \) comparações.
    
Mesmo com essas variações no número de comparações, a complexidade assintótica da função permanece \(O(n)\) em todos os casos, já que o crescimento do número de comparações é linear com o tamanho do vetor.

### MinMax 3

```cpp

void MaxMin3(std::vector<int>& A, int& Max, int& Min) {
    int FimDoAnel;
    if (A.size() % 2 > 0) {
        A.push_back(A.back());
        FimDoAnel = A.size() - 1;
    } else {
        FimDoAnel = A.size() - 2;
    }

    if (A[0] > A[1]) {
        Max = A[0];
        Min = A[1];
    } else {
        Max = A[1];
        Min = A[0];
    }

    int i = 2;
    while (i <= FimDoAnel) {
        if (A[i] > A[i+1]) {
            if (A[i] > Max) Max = A[i];
            if (A[i+1] < Min) Min = A[i+1];
        } else {
            if (A[i+1] > Max) Max = A[i+1];
            if (A[i] < Min) Min = A[i];
        }
        i += 2;
    }
}
```

A função MaxMin3 é projetada para encontrar os valores máximo e mínimo em um vetor de inteiros A de forma eficiente. Ela começa verificando se o número de elementos é ímpar e, se for o caso, duplica o último elemento para tornar o número total de elementos par. Em seguida, inicializa Max e Min com base na comparação dos dois primeiros elementos. O laço principal percorre o vetor em pares, comparando os dois elementos de cada par e atualizando Max e Min conforme necessário.

### Melhor caso

O melhor caso ocorre quando os elementos do vetor são organizados de forma que o laço consegue identificar rapidamente os valores máximo e mínimo em cada par. Neste cenário, a função realiza apenas uma comparação por iteração do laço. Como o laço percorre o vetor em pares, o número de comparações é aproximadamente \( \frac{n}{2} \), resultando em \( \frac{n}{2} \) comparações no total.

### Pior caso

O pior caso acontece quando os pares de elementos estão dispostos de forma que todas as comparações possíveis são necessárias. Nesse cenário, a função realiza duas comparações por iteração, resultando em um total de \( n \) comparações, pois o laço percorre \( \frac{n}{2} \) pares e realiza duas comparações por par.

### Caso médio

Em um cenário com dados aleatórios, a função realiza comparações para aproximadamente metade dos elementos, com uma média de duas comparações por iteração. Assim, o número médio de comparações é cerca de \( n \), já que o laço percorre o vetor em pares e realiza comparações para ambos os elementos de cada par.

Assim como nos anteriores, mesmo com essas variações no número de comparações, a complexidade assintótica da função permanece \( O(n) \) em todos os casos, já que o crescimento do número de comparações é linear com o tamanho do vetor.

## 🎯 Objetivos

- Analisar o custo computacional dos algoritmos MinMax 1, MinMax 2 e MinMax 3.
- Descrever o funcionamento de cada algoritmo e suas diferenças.
- Aplicar testes para avaliar o desempenho dos algoritmos em cenários variados.
- Demonstrar os resultados dos testes e suas implicações para a escolha do algoritmo mais eficiente.

## 🖥 Ambiente de Criação (colocar isso mais pro final, com as especifidades da maquina pipipipopopo)

O código foi desenvolvido utilizando as seguintes ferramentas:

[![Linguagem](https://img.shields.io/badge/Linguagem-C++-blue)](https://www.w3schools.com/c/c_intro.php)
[![IDE](https://img.shields.io/badge/IDE-Visual%20Studio%20Code-blueviolet)](https://code.visualstudio.com/docs/?dv=linux64_deb)
[![Sistema Operacional](https://img.shields.io/badge/ISO-Ubuntu%20Linux%2022.04-red)](https://ubuntu.com/)

## 📂 Organização dos Arquivos no Diretório
Os arquivos criados para o funcionamento do projeto estão dispostos da seguinte maneira do diretório:

markdown
- - `/TrabalhoMaxMin`: Diretório raiz do projeto.
  - `/build`: Diretório gerado ao usar o Makefile.
  - `/img`: Diretório para imagens. Contém o logo do projeto e prints do código.
  - `/src`: Diretório para o código fonte.
    - `GerarVetores.cpp`: Arquivo para gerar os vetores aleatórios para os testes.
    - `GerarVetores.cpp`: Arquivo de cabeçalho do GerarVetores.cpp.
    - `MinMax.cpp`: Arquivo com a implementação de cada um dos algoritmos MinMax.
    - `MinMax.cpp`: Arquivo de cabeçalho do MinMax.cpp.
    - `Testes.cpp`: Arquivo com a função que realiza os testes de acordo com as regras dadas.
    - `Testes.hpp`: Arquivo de cabeçalho do Testes.cpp.
    - `main.cpp`: Arquivo principal do projeto em C++.
  - `README.md`: Este arquivo.
  - `Makefile`: Makefile para compilar o projeto.
  
##  Implementação

### Bibliotecas Utilizadas

- `<iostream>`: biblioteca utilizada para a habilitação de entradas e saídas.
- `<algorithm>`: biblioteca utilizada para funções de ordenação (`std::sort`).
- `<chrono>`: biblioteca utilizada para medir o tempo de execução das funções.
- `<fstream>`: biblioteca utilizada para manipulação de arquivos (`std::ofstream`).
- `<vector>`: biblioteca utilizada para a estrutura de dados `std::vector`.
- `<random>`: biblioteca utilizada para gerar números aleatórios (`std::random_device`, `std::mt19937`, `std::uniform_int_distribution`).
- `"MaxMin.cpp"`: biblioteca utilizada para armazenar a implementação dos algoritmos MinMax.
- `"GerarVetores.cpp"`: biblioteca utilizada para gerar os vetores a serem utilizados nos testes dos algoritmos.
- `"Testes.cpp"`: biblioteca utilizada para realizar os testes com os algortimos.

### Funções

- **MaxMin1**: Esta função recebe um vetor de inteiros e encontra o valor máximo e mínimo no vetor. Ela percorre o vetor uma vez, comparando cada elemento com os valores atuais de máximo e mínimo.

- **MaxMin2**: Similar à função MaxMin1, esta função também encontra o valor máximo e mínimo em um vetor de inteiros. A diferença é que ela usa uma estrutura de controle `else if` para evitar comparações desnecessárias.

- **MaxMin3**: Esta função encontra o valor máximo e mínimo em um vetor de inteiros, mas faz isso em pares de elementos. Se o vetor tiver um número ímpar de elementos, o último elemento é duplicado temporariamente para facilitar a comparação em pares.

- **executarTestes**: Esta função executa testes de desempenho nas funções MaxMin1, MaxMin2 e MaxMin3. Ela gera vetores aleatórios de diferentes tamanhos, ordena-os em diferentes estados (aleatório, crescente, decrescente) e mede o tempo de execução médio de cada função em cada estado. Os resultados são salvos em arquivos de saída.

- **gerarVetorAleatorio**: Esta função gera um vetor de inteiros aleatórios de um tamanho especificado, sendo os possíveis valores para esse tamanho 1000, 10000, 100000 e 500000. Os valores dos inteiros são distribuídos uniformemente entre 0 e 1000.

## 🧪 Resultados e Análises 

Nesta seção, apresentaremos os resultados obtidos a partir da execução dos testes com os algoritmos MinMax 1, MinMax 2 e MinMax 3. Espera-se que nosso código identifique corretamente os valores máximo e mínimo em diferentes conjuntos de dados, além de medir o tempo de execução de cada algoritmo em cenários variados (aleatório, crescente e decrescente). A análise dos resultados permitirá avaliar a eficiência e a performance prática de cada variação do algoritmo MinMax. Para garantir a precisão dos resultados, cada algoritmo será executado 10 vezes em cada um dos cenários (aleatório, crescente e decrescente). A média dos tempos de execução será calculada para fornecer uma visão clara da performance de cada algoritmo em diferentes situações. Isso nos permitirá identificar qual algoritmo é mais eficiente em termos de tempo de execução e robustez em diferentes condições de entrada.

### 📄 Arquivos de Saída

Durante a execução dos testes, os resultados são salvos em dois arquivos de saída: `resultados.mps` e `resultados.csv`.

#### `resultados.mps`

Este arquivo contém uma descrição detalhada dos resultados dos testes, incluindo o nome da função, o índice do vetor, os valores máximo e mínimo encontrados, o estado do vetor (aleatório, crescente, decrescente) e o tempo médio de execução em microssegundos. Cada linha do arquivo segue o formato:

```
Função: <nomeFuncao>, Vetor <índice>, Max: <max>, Min: <min>, Tempo médio (<estado>): <tempo_médio> microssegundos
```

#### `resultados.csv`

Este arquivo é um arquivo CSV (Comma-Separated Values) que organiza os resultados dos testes em formato tabular, facilitando a análise e importação para ferramentas de planilhas. A primeira linha do arquivo contém os cabeçalhos das colunas:

```
Função,Vetor,Max,Min,Estado,Tempo Médio
```

Cada linha subsequente representa os resultados de um teste específico, com os valores separados por vírgulas:

```
<nomeFuncao>,<índice>,<max>,<min>,<estado>,<tempo_médio>
```

Esses arquivos são gerados e atualizados durante a execução da função `executarTestes`, garantindo que todos os resultados sejam registrados de forma organizada e acessível para análises posteriores.


## 👨🏻‍🔬 Ambiente de Teste

Este projeto foi testado no seguinte ambiente:

- *Sistema Operacional*: Ubuntu 22.04
- *Compilador*: GCC 11.4.0
- *Hardware*: 11th Gen Intel(R) Core(TM) i5-11400H @ 2.70GHz, 8GB RAM, 512GB SSD

## 👨🏻‍💻 Compilação e Execução

Existem duas maneiras de compilar e executar o programa:

### 1. Compilar gerando a matriz aleatoriamente.
 Para compilar o projeto gerando uma matriz de entrada aleatória, será necessário seguir os seguintes passos:

#### 1.1 - Verificar a versão do python  instalada em seu computador.

O projeto foi feito com o python para linux na versão 3.10.12. Para checar a versão do python instalada, abra o terminal e execute o seguinte comando:


python --version


É muito comum no linux esse comando não ser reconhecido, caso seja este o seu caso tente executar o seguinte comando:


python3 --version


Se ainda assim você não obtiver êxito, pode ser que você não tenha o python instalado em sua máquina. Para instalá-lo, siga os passos a seguir:

1 - Primeiro, atualize sua lista de pacotes:

sudo apt update

2 - Em seguida, instale o Python:


sudo apt install python3


3 - Depois, instale o pip, que é o gerenciador de pacotes do Python:


sudo apt install python3-pip


4 - Verificar a versão do python instalada, com um dos comandos dados no item 1.

#### 1.2 - Instalar a biblioteca numpy do python.

O código em python do projeto utiliza a biblioteca numpy para gerar um número entre 2 e 1000, que será a ordem da matriz, e preenche ela aleatoriamente com 0's e 1's. Para instalar essa biblioteca, execute o seguinte comando


pip3 install numpy


#### 1.3 - Instalar o pacote make.
Como a compilação do projeto é feita por meio de um makefile, é necessário que o usuário tenha o pacote make instalado em seu computador. Isso pode ser feito executando a seguinte linha de comando:


sudo apt install make


Após isso, verifique a versão do make instalada. A versão instalada na máquina onde foram feitos os testes é a 4.3. Você pode checar a versão com o seguinte comando:


make --version


Se a versão do make instalada for muito superior ou inferior em comparação com a utilizada na craiação deste projeto, você pode desinstalá-la e verificar quais versões voce tem disponível.

Para isso, siga os passos:

1 - Desinstale o make do seu computador:


sudo apt remove make


2 - Verifique as versões disponíveis do pacote:


apt-cache policy make


3 - Instale a mesma versão utilizada pelo criador do projeto (4.3) ou a mais próxima possível:


sudo apt install make=<versão>

#### 1.4 - Dar permissão ao script shell e executar o comando.

Após isso, será necessário conceder permissão para o script shell em seu diretório - nesse caso, ao arquivo run1.sh. Para isso, digite esse comando no terminal:


chmod +x run1.sh


Caso você não tenha as permissões de escrita do script, será necessário utilizar sudo na frente do comando:


sudo chmod +x run1.sh


Após isso, basta executar o seguinte comando em seu terminal:


./run1.sh

Isso irá apagar todo o conteúdo dos arquivos de entrada input.mps e de saída geracoes.mps, irá compilar o gerador.py e inserir seu resultado dentro do arquivo de entrada. Após isso, irá limpar a pasta build, que contém o resultado da compilação anterior, caso exista, e realiza uma nova compilação, inserindo o resultado desta na pasta build. Caso a matriz seja válida, ou seja, de ordem 5 ou maior, o usuário fornece no console a quantidade N de gerações que deseja, e o resultado é impresso no arquivo geracoes.mps.

### 2. Utilizar matriz própria.
Se você deseje utilizar uma matriz específica no Jogo da Vida, você pode inseri-la manualmente no arquivo input.mps e seguir o [passo 1.3](#13---instalar-o-pacote-make) do tópico anterior e, posteriormente, retornar aqui. *Lembrando que a matriz deve, de preferência, ser quadrada*

#### 2.1 - Dar permissão ao script shell e executar o comando.

Depois te ter seguido os passos da instalação do pacote make, será necessário dar permissão para o script shell. Para isso, execute no terminal o comando a seguir:

chmod +x run2.sh

Novamente, caso você não tenha as permissões de escrita do script, será necessário utilizar sudo na frente do comando:

sudo chmod +x run2.sh

Após isso, basta executar o seguinte comando em seu terminal:

./run2.sh

Isso irá apagar todo o conteúdo dos arquivo de saída geracoes.mps. Após isso, irá limpar a pasta build, que contém o resultado da compilação anterior, caso exista, e realiza uma nova compilação, inserindo o resultado desta na pasta build, e então ler a primeira linha da matriz para verificar se ela é de ordem maior ou igual a 5, caso seja válida, o usuário fornece no console a quantidade N de gerações que deseja, e o resultado é impresso no arquivo geracoes.mps.

## 🔚 Conclusão 

Neste projeto, foi implementado o Jogo da Vida, um autômato celular concebido pelo matemático britânico John Horton Conway. Foi utilizada a linguagem de programação C para a implementação principal e Python para gerar matrizes aleatórias.

O projeto demonstrou a aplicação de conceitos de programação, como loops, condicionais e manipulação de arquivos. Além disso, foram utilizadas ferramentas de desenvolvimento de software, como Makefile e scripts shell, para automatizar o processo de compilação e execução do programa.

Espera-se que este projeto sirva como um recurso útil para quem está aprendendo programação e para quem está interessado em autômatos celulares e em simulações de sistemas complexos.

Agradeço por seu interesse no projeto e convido você a contribuir com melhorias e extensões.

## 💭 Créditos

Este projeto usa um Makefile fornecido pelo professor [Michel Pires Silva](https://github.com/mpiress). Agradeço a ele por fornecer essa ferramenta útil para a compilação do projeto.

## 📪 Contato

Se você tiver alguma dúvida ou sugestão, sinta-se à vontade para entrar em contato comigo. Aqui estão algumas maneiras de fazer isso:

- Email: [memanuel643@gmail.com](mailto:memanuel643@gmail.com)
- LinkedIn: [Matheus Silva](https://www.linkedin.com/in/matheus-silva-emanuel)
- Instagram: [@mat_emanuel9](https://www.instagram.com/mat_emanuel9/)
- GitHub: [Matheus Emanuel](https://github.com/Matheus-Emanue123)

Estou ansioso para ouvir de você!