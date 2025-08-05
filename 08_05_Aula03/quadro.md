estapresente: ARRAY<Z> x $\mathbb{Z}$ -> $\mathbb{B}$

Domínio = ARRAY<Z> x $\mathbb{Z}$

Contra-domínio = $\mathbb{B}$

$\mathbb{B} = { V, F }$

$\mathbb{Z} = { ..., -2, -1, 0, 1, 2, ... }$

$estapresente(a, x) = r$

Pré-condição: $T$ (True, ou seja, a função é verdadeira)

Pós-condição: $\exists i \in \mathbb{N} \cdot (i < |a| \land a[i] = x) \leftrightarrow r$

Leia-se: existe um i (pelo menos) pertencente aos Naturais tal que i é menor que o tamanho do array e o valor armazenado no indice i do array é igual ao x.


2) Construa formulas em lógica de predicados sobre [0; n-1] para:
   1) Todas entradas com valor igual a x
   2) Todas entradas são iguais entre si
   3) As entradas estão em ordem crescente
   4) O valor x ocorre exatamente uma única vez

2.1 Todas entradas com valor igual a x

$a = [1, 1, 1, 1, 1] \ x = 1$

$\forall i \in \mathbb{N} \cdot (i \lt |a| \rightarrow a[i] = x)$

2.2 Todas entradas são iguais entre si

$a = [0, 0, 0, 0, 0]$

2.3 As entradas estão em ordem crescente

$a = [-1, 0, 1, 1, 10]$

2.4 O valor x ocorre exatamente uma única vez

$a = [0, 1, -1, 0, 3] \ x = 1$
