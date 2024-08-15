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

# Revisão de Programação I

<dev class="columns">

<dev>

* **Expressão**: combinação de literais, varáveis e operadores que geram um valor. Ex.:
  - `2 + 5 * (x + 2)`   
  - `pi * r * r`
  - `10 * (1.0 / 2.0)`

</dev>
<dev>

* **Instrução**: linha de código que que realiza uma ação. Ex.:
  - `int a = 10;`
  - `x = 2 * a + 1;`
  - `if (...) ...`
  - `for (int i ...) ...`

</dev>
</dev>

---

## Expressão

Convertendo Expressão algébrica para código 

| Expressão Algébrica | C++ Equivalente              |
| ------------------- | ---------------------------- |
| $6x$                | `6 * x`                      |
| $4xy$               | `4 * x * y`                  |
| $\frac{a+b}{c}$     | `(a + b) / c`                |
| $3\frac{x}{2}$      | `x / 2 * 3` ou `3 * (x / 2)` |
| $3bc+4$             | `3 * b * c + 4`              |
| $\frac{2x+3}{4a-1}$ | `(2 * x + 4) / (4 * a - 1)`  |

---

# Expressões com Tipos Diferentes

<dev class="columns">

<dev>

Ranking dos tipos

- `long double`
- `double`
- `float`
- `unsigned long`
- `long`
- `unsigned int`
- `int`

</dev>
<dev>

- Em uma operação com tipos diferentes, o valor de menor ranking vai ser promovido antes de operação.
- Em uma atribuição, o valor final vai ser convertido para o tipo da varável sendo atribuída.


</dev>
</dev>

---

# Expressões com Tipos Diferentes


```cpp
int x, y = 4;
float z = 2.7;
x = y * z;
```

Qual o valor de `x`?

---

# Instruções de desvio condicional

<dev class="columns">

<dev>


```cpp
if (teste) {
  instrução;
  //...
}
```

```cpp
if (teste) {
  instrução;
  //...
} else {
  instrução;
  //...
}
```

</dev>
<dev>

- `teste` é uma expressão, normalmente, usando operadores relacionais
  - `x > y` maior que 
  - `x < y`  menor que
  - `x >= y` maior ou igual
  - `x <= y` menor ou igual
  - `x == y` igual
  - `x != y` diferente 

</dev>
</dev>

---

# Instrução `switch-case`

<dev class="columns">

<dev>


```cpp
switch (teste){
case expressão_contante:
    instrução;
    //...
    break;
case expressão_contante:
    instrução;
    //...
    break;
default:
    instrução;
    //...
}
```

</dev>
<dev>

- `teste` é uma expressão que resulta em um valor `int`.
- `expressão_contante` é uma expressão que deve ser definida em tempo de compilação, ou seja, o valor não pode ser definido dinamicamente durante a execução.

</dev>
</dev>

---

# Instruções de repetição `while`



<dev class="columns">

<dev>


```cpp
while(teste) {
    instrução; 
    //...
}
```


- As instruções dentro do *corpo* do `while` executam repetidamente até que a expressão `test` resulte em falso.

</dev>
<dev>

![h:450](img/while.svg)

</dev>
</dev>

---

# Instruções de repetição `do-while`


<dev class="columns">

<dev>


```cpp
do {
    instrução; 
    //...
} while(teste)
```

- As instruções dentro do *corpo* do `do` executam, então a expressão `test` é avaliada, caso resulte em verdadeiro, do corpo do `do` executado novamente.

</dev>
<dev>

![h:450](img/do-while.svg)

</dev>
</dev>

---

# Instruções de repetição `for`


<dev class="columns">

<dev>


```cpp
for (inicialização, teste, incremento) {
      instrução; 
    //...
}
```

- As instruções do *corpo* do `for` são executadas repetidamente enquanto a expressão de teste for verdadeira. Mas a variável do teste é atualizada a cada iteração.

</dev>
<dev>

![h:450](img/for.svg)

</dev>
</dev>


---


# Algoritmos e Programação II


https://evandro-crr.github.io/alg2


<!-- _footer: Evandro Chagas Ribeiro da Rosa -->
<!-- _paginate: skip -->
