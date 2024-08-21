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

- Variáveis do tipo `int`, `float` e `char` armazenam um valor de cada tipo por vez.
- Usando um array é possível fazer que uma variável armazene uma lista de valores.
- Os valores são armazenados de maneira continua na memoria.
- O tamanho do array precisa ser conhecido em tempo de compilação.


---

## Inicializando Array 

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

**Representação na Memoria**

- `lista1` $\rightarrow$ `|?|?|?|?|`
  
- `lista2` $\rightarrow$ `|?|?|?|?|?|?|`
- `lista3` $\rightarrow$ `|8|3|3|5|1|`
- `lista4` $\rightarrow$ `|4|4|3|0|0|0|0|0|`


</div>

</div>

<!-- _footer: `?` representa lixo de memoria -->

---

## Acessando Elemento do Array

Cada elemento do array pode ser indexado por um inteiro
positivo no intervalo de 0 ao tamanho do array -1. 


<div class="columns">

<div>

**Exemplo**
- Array de tamanho 5
- `índices = |0|1|2|3|4|`
- `valores = |8|3|3|5|1|...`
- Usar índices maior que 4 é *comportamento indefinido*


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


Iterar a lista usando indices

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