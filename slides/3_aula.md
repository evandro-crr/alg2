---
marp: true
theme: uncover  
author: Evandro Chagas Ribeiro da Rosa <evandro@univali.br>  
title: Algoritmos e Programação II  
backgroundColor: white  
math: mathjax  
paginate: true  
---

<style>
    section {
        font-size: 24pt;
    }

    .columns {
        display: grid;
        grid-template-columns: repeat(2, minmax(0, 1fr));
        gap: 1rem;
    }
</style>

# Algoritmos e Programação II

https://evandro-crr.github.io/alg2

<!-- _footer: Evandro Chagas Ribeiro da Rosa -->
<!-- _paginate: skip -->

---

# Arrays

*Agrupar múltiplos valores do mesmo tipo*

- Variáveis dos tipos `int`, `float` e `char` armazenam um valor de cada tipo por vez.
- Usando um array, é possível fazer com que uma variável armazene uma lista de valores.
- Os valores são armazenados de maneira contínua na memória.
- O tamanho do array precisa ser conhecido em tempo de compilação.

---

## Inicializando Arrays

<div class="columns">

<div>

```cpp
const int TAMANHO = 6;

int lista1[4];

float lista2[TAMANHO];

int lista3[] = {8, 3, 3, 5, 1};

int lista4[8] = {4, 4, 3};
```

</div>

<div>

**Representação na Memória**

- `lista1` $\rightarrow$ `|?|?|?|?|`
- `lista2` $\rightarrow$ `|?|?|?|?|?|?|`
- `lista3` $\rightarrow$ `|8|3|3|5|1|`
- `lista4` $\rightarrow$ `|4|4|3|0|0|0|0|0|`

</div>

</div>

<!-- _footer: `?` representa lixo de memória -->

---

## Acessando Elementos do Array

Cada elemento do array pode ser indexado por um número inteiro positivo no intervalo de 0 ao tamanho do array - 1.

<div class="columns">

<div>

**Exemplo**

- Array de tamanho 5
- `índices = |0|1|2|3|4|`
- `valores = |8|3|3|5|1|`
- Usar índices maiores que 4 é *comportamento indefinido*

</div>

<div>

**Escrita**

```cpp
int lista[3];
lista[0] = 4; 
lista[1] = 6;
lista[2] = 1;
```

**Leitura**

```cpp
int total = lista[0] + lista[1] + lista[2];
```

</div>

</div>

---

## Laço Baseado em Intervalo

A instrução `for` é amplamente usada para iterar sobre um array.

<div class="columns">

<div>

Iterar a lista usando índices

```cpp
const int tamanho = 5;
int lista[tamanho] = {1, 2, 3, 4, 5};

for (int i = 0; i < tamanho; i++) {
    std::cout << lista[i] << " ";
}
```

</div>

<div>

Iterar a lista por elemento

```cpp
int lista[] = {1, 2, 3, 4, 5};

for (int item : lista) {
    std::cout << item << " ";
}
```

</div>

</div>

---

## Atribuição com Arrays

```cpp
const int tamanho = 5;
int lista1[tamanho] = {1, 2, 3, 4, 5};
int lista2[tamanho] = {1, 2, 3, 4, 5};
```

Como copiar os valores de `lista1` para `lista2`?

<div class="columns">

<div>

## ❌ Incorreto 

```cpp
lista2 = lista1;    // erro
```

</div>

<div>

## ✅ Correto

```cpp
for (int i = 0; i < tamanho; i++) {
    lista2[i] = lista1[i];
}
```

</div>

</div>

---

## `std::cin` com Arrays

```cpp
const int tamanho = 5;
int lista[tamanho];
```

Como usar `std::cin` para escrever valores no array `lista`?

<div class="columns">

<div>

## ❌ Incorreto 

```cpp
std::cin >> lista;    // erro
```

</div>

<div>

## ✅ Correto

```cpp
for (int i = 0; i < tamanho; i++) {
    std::cin >> lista[i];
}
```

```cpp
for (int& item : lista) {
    std::cin >> item;
}
```

</div>

</div>

---

## `std::cout` com Arrays

```cpp
const int tamanho = 5;
int lista[tamanho];
```

Como usar `std::cout` para ler o array `lista`?

<div class="columns">

<div>

## ❌ Incorreto 

```cpp
std::cout << lista << '\n';
```

Será impresso o endereço de memória onde começa o array.

</div>

<div>

## ✅ Correto

```cpp
for (int i = 0; i < tamanho; i++)
    std::cout << lista[i] << ' ';
std::cout << '\n';
```

```cpp
for (int item : lista) 
    std::cout << item << ' ';
std::cout << '\n';
```

</div>

</div>

---

## Passando Arrays como Argumento

<div class="columns">

<div>

```cpp
void print_array(int[], int);

int main() {
    int lista[] = {10, 100, 200, 300};
    print_array(lista, 4);
}

void print_array(int arg[], int tamanho) {
    for (int i = 0; i < tamanho; i++) {
        std::cout << arg[i] << ' ';
    }
    std::cout << '\n';
}
```

</div>

<div>

- `arg` é uma variável que armazena o início do array;
- Não é necessário passar o tamanho do array para `arg`;
- No parâmetro da função, o tamanho do array é ignorado.
- Sempre é necessário fornecer o tamanho do array por outro parâmetro.

</div>

</div>

---

## Modificando o Array Dentro da Função

<div class="columns">

<div>

```cpp
void print_array(int[], int);
void dobrar_array(int[], int);

int main() {
    int lista[] = {10, 100, 200, 300};
    dobrar_array(lista, 4);
    print_array(lista, 4);
}

void dobrar_array(int lista[], int tamanho) {
    for (int i = 0; i < tamanho; i++) {
        lista[i] *= 2;
    }
}
```

</div>

<div>

Como é o endereço do início do array que é copiado para a função, a variável de parâmetro se comporta como uma variável de referência.

</div>

</div>

---

### Garantir que a Função Não Altere o Array

<div class="columns">

<div>

```cpp
void print_array(const int[], int);

int main() {
    int lista[] = {10, 100, 200, 300};
    print_array(lista, 4);
}

void print_array(const int arg[], int tamanho) {
    for (int i = 0; i < tamanho; i++) {
        std::cout << arg[i] << ' ';
    }
    std::cout << '\n';
}
```

</div>

<div>

Uma boa prática para garantir que o array passado como argumento não será alterado é definir o parâmetro como `const`.

</div>

</div>


---

# 🔧 Funções Úteis
## Imprimindo o Conteúdo do Array

```cpp
void print_array(const int arg[], int tamanho) {
    for (int i = 0; i < tamanho; i++) {
        std::cout << arg[i] << ' ';
    }
    std::cout << '\n';
}
```

---

# 🔧 Funções Úteis
## Somar Elementos do Array

```cpp
int somar(const int lista[], int tamanho) {
    int total = 0;
    for (int i = 0; i < tamanho; i++) {
        total += lista[i];
    }

    return total;
}
```

---

# 🔧 Funções Úteis
## Calcular a Média dos Valores do Array

```cpp
int somar(const int lista[], int tamanho);

double media(const int lista[], int tamanho) {
    double total = somar(lista, tamanho);
    return total / tamanho; 
}
```

---

# 🔧 Funções Úteis
## Maior Valor do Array

```cpp
#include <limits.h>

int maior_valor(const int lista[], int tamanho) {
    int max = INT_MIN;
    for (int i = 0; i < tamanho; i++) {
        if (lista[i] > max) {
            max = lista[i];
        }
    }

    return max;
}
```

---

# 🔧 Funções Úteis
## Menor Valor do Array

```cpp
#include <limits.h>

int menor_valor(const int lista[], int tamanho) {
    int min = INT_MAX;
    for (int i = 0; i < tamanho; i++) {
        if (lista[i] < min) {
            min = lista[i];
        }
    }

    return min;
}
```

---

# 🔧 Funções Úteis
## Copiar um Array

```cpp
void copiar_array(const int fonte[], int destino[], int tamanho) {
    for (int i = 0; i < tamanho; i++) {
        destino[i] = fonte[i]; 
    }
}
```

---

# 🔧 Funções Úteis
## Somar dois Arrays

```cpp
void somar_array(const int lhs[], const int rhs[], int resultado[], int tamanho) {
    for (int i = 0; i < tamanho; i++) {
        resultado[i] = lhs[i] + rhs[i];
    }
}
```

Qual o valor de `lista1`, `lista2` e `lista3`?

<div class="columns">

<div>

```cpp
int lista1[4] = {1, 2, 3, 4};
int lista2[4] = {4, 3, 2, 1};
int lista3[5];
somar_array(lista1, lista2, lista3, 4);
```

</div>

<div>

```cpp
int lista1[4] = {1, 2, 3, 4};
int lista2[4] = {4, 3, 2, 1};
int lista3[5];
somar_array(lista1, lista2, lista1, 4);
```

</div>

</div>

---

<!-- _footer: $^*$ Em alguns casos chamados de *vetor*. -->

# Array de Duas Dimensões  

*A Matriz*

- O que vimos até agora são arrays de uma dimensão$^*$.
  `[0] [1] [2] [3] [4] [5] [6] [7] [8] [9]`
- É possível criar um array de duas dimensões:
    `[0][0] [0][1] [0][2] [0][3] [0][4] [0][5]`
    `[1][0] [1][1] [1][2] [1][3] [1][4] [1][5]`
    `[2][0] [2][1] [2][2] [2][3] [2][4] [2][5]`
    `[3][0] [3][1] [3][2] [3][3] [3][4] [3][5]`

---

## Declarando um Array 2D

```cpp
const int N_LINHAS = 2;
const int N_COLUNAS = 3;
int matriz[N_LINHAS][N_COLUNAS];
```

|         | Coluna 0       | Coluna 1       | Coluna 2       |
| ------- | -------------- | -------------- | -------------- |
| Linha 0 | `matriz[0][0]` | `matriz[0][1]` | `matriz[0][2]` |
| Linha 1 | `matriz[1][0]` | `matriz[1][1]` | `matriz[1][2]` |

---

## Inicializando um Array 2D

```cpp
int matriz[][2] = {{8, 5}, {7, 9}, {6, 3}};
```

<div class="columns">

<div>

|         | Coluna 0 | Coluna 1 |
| ------- | -------- | -------- |
| Linha 0 | `8`      | `5`      |
| Linha 1 | `7`      | `9`      |
| Linha 2 | `6`      | `3`      |

</div>

<div>

**Representação na Memória**

`|8|5|7|9|6|3|`

As colunas são armazenadas de maneira sequencial na memória.

</div>

</div>

---

## Usando Array 2D em Função 

<div class="columns">

<div>

```cpp
void print_matriz(const int[][2], int);

int main() {
    int matriz[][2] = {{8, 5}, {7, 9}, {6, 3}};
    print_matriz(matriz, 3);
}

void print_matriz(const int arg[][2], int linhas) {
    for (int linha = 0; linha < linhas; linha++) {
        for (int item : arg[linha]) {
            std::cout << item << '\t';
        }
        std::cout << '\n';
    }
}
```

</div>

<div>

- É necessário definir o tamanho da coluna no tipo do parâmetro `arg`.
- É necessário passar o número de linhas de `arg` em um parâmetro extra.
- Similar ao array 1D, `arg` é uma cópia do endereço inicial do array 2D.

</div>

</div>

--- 

## 🔧 Funções com Array 2D: Somar Colunas  

```cpp
const int COLUNAS = 2;
void somar_colunas(const int[][COLUNAS], int[], int);
void print_array(const int[], int);

int main() {
    int matriz[][COLUNAS] = {{8, 5}, {7, 9}, {6, 3}};
    int soma_colunas[COLUNAS];
    somar_colunas(matriz, soma_colunas, 3);
    print_array(soma_colunas, COLUNAS);
}

void somar_colunas(const int matriz[][COLUNAS], int resultado[], int linhas) {
    for (int i = 0; i < COLUNAS; i++) resultado[i] = 0;

    for (int linha = 0; linha < linhas; linha++) {
        for (int coluna = 0; coluna < COLUNAS; coluna++) {
            resultado[coluna] += matriz[linha][coluna];
        }
    }
}
```

---

## 🔧 Funções com Array 2D: Somar Linhas  

```cpp
const int COLUNAS = 2;
void somar_linhas(const int[][COLUNAS], int[], int);
int somar(const int[], int);
void print_array(const int[], int);

int main() {
    int matriz[][COLUNAS] = {{8, 5}, {7, 9}, {6, 3}};
    int soma_linhas[3];

    somar_linhas(matriz, soma_linhas, 3);
    print_array(soma_linhas, 3);
}

void somar_linhas(const int matriz[][COLUNAS], int resultado[], int linhas) {
    for (int linha = 0; linha < linhas; linha++) {
        resultado[linha] = somar(matriz[linha], COLUNAS);
    }
}
```

---

# Complete o Código

<div class="columns">

<div>

```cpp
int main() {
    int matriz[][...] = ...;
    int media_linhas[...];
    int media_colunas[...];

    calcular_media_linhas(matriz, media_linhas, ...);
    calcular_media_colunas(matriz, media_colunas, ...);

    std::cout << "Valor médio das linhas\n";
    print_array(media_linhas, ...);
    std::cout << "Valor médio das colunas\n";
    print_array(media_colunas, ...);
    std::cout << "Valor médio da matriz\n";
    std::cout << calcular_media_matriz(matriz, ...) << '\n';

    return 0;
}
```

</div>

<div>

Use a matriz abaixo no código:

|     |     |     |     |     |
| --- | --- | --- | --- | --- |
| 12  | 24  | 32  | 21  | 42  |
| 14  | 67  | 87  | 65  | 90  |
| 19  | 1   | 24  | 12  | 8   |

</div>

</div>

---

# Algoritmos e Programação II

https://evandro-crr.github.io/alg2

<!-- _footer: Evandro Chagas Ribeiro da Rosa -->
<!-- _paginate: skip -->
