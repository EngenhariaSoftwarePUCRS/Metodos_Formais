## Propriedades Recursivas

0, 1, 1, 2, 3, 5, 8, ...\
0, 1, 2, 3, 4, 5, 6,

FIB$:\mathbb{N} \to \mathbb{N}$

$\left\{
  \begin{array}{l}
    \text{FIB(0)} = 1 \\
    \text{FIB(1)} = 1 \\
    \text{FIB(n)} = \text{FIB(n-2)} + \text{FIB(n-1)}, \text{se n} \ge 2 \\
  \end{array}
\right.$

---

POT2$: \mathbb{N} \to \mathbb{N}$

$\left\{
  \begin{array}{l}
    \text{POT2(0)} = 1 \\
    \text{POT2(n)} = 2 \times \text{POT2(n-1)}, \text{se n} \ge 2 \\
  \end{array}
\right.$

---

## Listas (Indutivas)

$. \over [ ] \in \text{LISTA<}T\text{>}$

$L \in \text{LISTA<}T\text{>} \quad h \in T \over h:L \in \text{LISTA<}T\text{>}$

---

## Árvores Binárias (Indutivas)

$. \over <> \in \text{ARVBIN<}T\text{>}$

$r \in T \quad E \in \text{ARVBIN<}T\text{>} \quad D \in \text{ARVBIN<}T\text{>} \over <E,r,D> \in \text{ARVBIN<}T\text{>}$

---

INIT$:\text{LISTA<}T\text{>} \to \text{LISTA<}T\text{>}$

PRE: L $\neq$ [ ]

$\left\{
  \begin{array}{l}
    \text{INIT(h:[ ])} = [ ] \\
    \text{INIT(h:L)} = h:INIT(L) \\
  \end{array}
\right.$

Ex:
$\left\{
  \begin{array}{l}
    % \text{INIT([ ])} = [ ] \\
    \text{INIT(1:[ ])} = [ ] \\
    \text{INIT(1:2:[ ])} = 1:[ ] \\
    \text{INIT(1:2:3:[ ])} = 1:2:[ ] \\
  \end{array}
\right.$

---

PREFIX$(L,n)=r$

PREFIX:$\text{LISTA<}T\text{>} \times \mathbb{N} \to \text{LISTA<}T\text{>}$

PRÉ$: n \le |L|$

$\left\{
  \begin{array}{l}
    \text{PREFIX(L,0)} = [] \\
    \text{PREFIX(h:L,n)} = h:\text{PREFIX(L,n-1)} \text{ se } n \gt 0 \\
  \end{array}
\right.$

---

ESPELHO$:\text{ARVBIN<}T\text{>} \to \text{ARVBIN<}T\text{>}$

$\left\{
  \begin{array}{l}
    \text{ESPELHO(<>)} = <> \\
    \text{ESPELHO(<E,r,D>)} = <\text{ESPELHO(D)},r,\text{ESPELHO(E)}> \\
  \end{array}
\right.$
