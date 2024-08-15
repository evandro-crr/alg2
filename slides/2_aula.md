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

# Funções

- O Objetivo das funções é modularizar o código.
- Uma função é um conjunto de instruções
  que realiza uma tarefa especifica.
- Podemos usar função para implementar a
  estrategia de *Dividir para conquistar*.
- Funções também permite reutilizar código.

---

Uma função com menos instruções é mais fácil de entender. 

<dev class="columns">

<dev>

```cpp
int main() {
    instrução;
    instrução;
    instrução;
    instrução;
    instrução;
    instrução;
    instrução;
    instrução;
    instrução;
    instrução;
    instrução;
    instrução;
    instrução;
    instrução;
    instrução;
    instrução;
    instrução;
    return 0;
}
```

</dev>
<dev>

```cpp
int main() {
    instrução;
    instrução;
    return 0;
}

void func2() {
    instrução;
    instrução;
}

void func3() {
    instrução;
    instrução;
}

void func4() {
    instrução;
    instrução;
}
```
</dev>
</dev>

---

# Definição de Funções 


<dev class="columns">

<dev>

Uma função é composta das seguintes partes:

- Tipo do retorno
- Nome da função
- Lista de paramentos
- Corpo da função

</dev>
<dev>

```cpp
int main(int argv, char** argc) {
  std::cout << "Olá\n";
  return 0;
}
```

**Funções void**

```cpp
void mostrar_mensagem() {
  std::cout << "Olá da função mostrar_mensagem\n";
}
```

</dev>
</dev>

---

# Chamada de Funções

Para chamar uma função, basta colocar `()` apos o nome.


```cpp
#include <iostream>

void func_1() {
    std::cout << "Estou na função 1\n";
}

void func_2() {
    std::cout << "Estou na função 2\n";
}

int main() {
    std::cout << "A execução começa no main\n";
    func_1(); // chama a função 1
    func_2(); // chama a função 2
    std::cout << "A execução volta para o main\n";
  return 0;
}
```

---

# Declaração da Função

<dev class="columns">

<dev>

```cpp
#include <iostream>

// declaração das funções;
void func_1();
void func_2();

int main() {
    std::cout << "A execução começa no main\n";
    func_1(); // chama a função 1
    func_2(); // chama a função 2
    std::cout << "A execução volta para o main\n";
  return 0;
}

void func_1() {
    std::cout << "Estou na função 1\n";
}

void func_2() {
    std::cout << "Estou na função 2\n";
}
```

</dev>
<dev>


- Antes de chamar uma função, o compilador precisa saber:
O nome da função, o tipo do retorno e seus parâmetros.

- A declaração da função também é chamada de Protótipo da Função.
 
</dev>
</dev>

---

# Passando Dados para uma Função 


<dev class="columns">

<dev>


```cpp
#include <iostream>

// declaração da função;
void mostrar_valor(int);

int main() {
    std::cout << "Passando o valor 8\n";
    mostrar_valor(8);
    std::cout << "A execução volta para o main\n";
  return 0;
}

void mostrar_valor(int valor) {
    std::cout << "O valor passado foi "
              << valor << "\n";
}
```

</dev>
<dev>


- `int valor` é um *parâmetro* da função `mostrar_valor`.
- Quando chamamos a função `mostrar_valor` é necessário fornecer um *argumento* do tipo `int`.
- Na declaração da função não é necessário nomear os parâmetros.
 
</dev>
</dev>

---

# Retornando um valor da Função

<dev class="columns">

<dev>

```cpp
#include <iostream>

// declaração da função;
int soma(int, int);

int main() {
    int resultado = soma(3, 8);
    std::cout << "3 + 8 = ";
    std::cout << resultado << "\n";
  return 0;
}

int soma(int a, int b)
    int resultado = a + b;
    return resultado;
}
```

</dev>
<dev>

- A função `soma` retorna um valor do tipo `int`.
- A instrução `return` é necessário para definir o retorno.
- Podemos usar a chada de uma função em uma expressão:
  ```cpp
  int resultado = soma(19, 32) / 2;
  ```
 
</dev>
</dev>


---

# Variáveis Globais


<dev class="columns">

<dev>

```cpp
#include <iostream>
int valor_global;

void mostrar_valor() {
    std::cout << "O valor_global é "
              << valor_global << "\n"; 
}
void atualizar_valor(int valor) {
    valor_global = valor;
}

int main() {
    int valor_global  = 10;
    mostrar_valor();
    atualizar_valor(42);
    mostrar_valor();
    std::cout << "O valor_global é "
              << valor_global << "\n";
    return 0;
}
```

</dev>
<dev>


Variáveis definidas fora de uma função são chamadas de variaríeis globais

- Qualquer função pode ler ou escrever em uma varável global.
- Variáveis globais são inicializadas em zero.
- Variáveis locais com mesmo nome *sobrepõem* varáveis globais.

</dev>
</dev>

---


<dev class="columns">

<dev>

```cpp
#include <iostream>

const int FECHAR_CONTA = 0;

int fazer_pedido();
float valor_do_item(int);
float calcular_10pc(float);

int main() {
    float subtotal = 0.0;
    while (true) {
        int pedido = fazer_pedido();
        if (pedido == FECHAR_CONTA) {
            break;
        }
        subtotal += valor_do_item(pedido);
    }
    float total = calcular_10pc(subtotal);
    
    std::cout << "Sua conta ficou no valor de "
              << total << '\n';
    
    return 0;
}
```

</dev>
<dev>

## Complete o Código

- Esse código implementa a dinâmica de uma comanda de ~~bar~~Restaurante.
- Implemente as funções:
  - `fazer_pedido`
  - `valor_do_item`
  - `calcular_10pc`



</dev>
</dev>

---

# Algoritmos e Programação II


https://evandro-crr.github.io/alg2


<!-- _footer: Evandro Chagas Ribeiro da Rosa -->
<!-- _paginate: skip -->
