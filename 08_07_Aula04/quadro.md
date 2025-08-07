1) Construa formulas em lógica de predicados sobre [0; n-1] para:
   1) Todas entradas com valor igual a x
   2) Todas entradas são iguais entre si
   3) As entradas estão em ordem crescente
   4) O valor x ocorre exatamente uma única vez

2.1 Todas entradas com valor igual a x

$a = [1, 1, 1, 1, 1] \ x = 1$

$\forall i \in \mathbb{N} \cdot (i \lt |a| \rightarrow a[i] = x)$

2.2 Todas entradas são iguais entre si

$a = [0, 0, 0, 0, 0]$

$\forall i \in \mathbb{N} \cdot (i \lt |a| - 1 \rightarrow a[i] = a[i + 1])$

2.3 As entradas estão em ordem crescente

$a = [-1, 0, 1, 1, 10]$

$\forall i \in \mathbb{N} \cdot (i \lt |a| - 1 \rightarrow a[i] \leq a[i + 1])$

2.4 O valor x ocorre exatamente uma única vez

$a = [0, 1, -1, 0, 3] \ x = 1$

$\exists i \in \mathbb{N} \cdot (i \lt |a| \land a[i] = x \land \forall j \in \mathbb{N} \cdot (j < |a| ^ j \neq i \rightarrow a[j] \neq x))$

---

BUSCABINARIA: ARRAY<$\mathbb{Z}$> x $\mathbb{Z} \rightarrow \mathbb{Z}$

BUSCABINARIA$(a, x) = r$

Pré: 2.3 (Ordem crescente)

Pós: $(r >= 0 \rightarrow r < |a| \land a[r] = x) \land (r < 0 \rightarrow \forall i \in \mathbb{2} \cdot (a[i] \neq x))$

$a = [-3, -1, 0, 0, 2]$

---

ENCONTRAPRIMEIROZERO: ARRAY<$\mathbb{Z}$> x $\mathbb{Z} \rightarrow \mathbb{Z}$

ENCONTRAPRIMEIROZERO$(a, x) = r$

Pré: 2.3 (Ordem crescente)

Pós: $(r >= 0 \rightarrow r < |a| \land a[r] = 0 \land \forall i \in \mathbb{N} \cdot (i \lt r \rightarrow a[i] \neq 0))$

$a = [-3, -1, 0, 0, 2]$

---
---

$\mathbb{N} = [0, 1, 2]$

$_ \rightarrow 0$

$n \in \mathbb{N} \rightarrow n + 1 \in \mathbb{N}$

---

$\mathbb{POT2} = \{1, 2, 4, 8, 16, ...\}$

$_ \rightarrow 1 \in \mathbb{POT2}$

$n \in \mathbb{POT2} \rightarrow n * 2 \in \mathbb{POT2}$

---

$\Sigma = \{z, s, (, )\}$

$\mathbb{NAT} = \{z, s(z), s(s(z)), s(s(s(z))), ...\}$

$_ \rightarrow z \in \mathbb{NAT}$

$w \in \mathbb{NAT} \rightarrow s(w) \in \mathbb{NAT}$

---

$_ \rightarrow (0, 1) \in \mathbb{C}$

$(x, y) \in \mathbb{C} \rightarrow (x+1, 2*y) \in \mathbb{C}$

$\mathbb{C} = \{(0, 1), (1, 2), (2, 4), (3, 8), ...\}$

$\mathbb{C} = \mathbb{N} x \mathbb{N}$

$\mathbb{C} = \mathbb{N} \rightarrow \mathbb{N}$
