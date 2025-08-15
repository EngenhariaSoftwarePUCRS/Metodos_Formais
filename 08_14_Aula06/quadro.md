## Especificações Indutivas e Recursivas

1e.

Conjunto $\mathbb{S3} = \{a^nb^ma^n | n \gt 0 \land m \gt 0\}$

$\mathbb{S3} = \{aba, aabbaa, aaabaaa, \dots\}$

$- \over aba \in \mathbb{S3}$
$w \in \mathbb{S3} \over awa \in \mathbb{S3}$

---

1f.

Conjunto $\mathbb{S4} = \{a^nb^ma^i | n \gt 0 \land m \gt 0 \land i \ge 0\}$

$\mathbb{S4} = \{ab, aba, aab, abb, abba, \dots\}$

$- \over ab \in \mathbb{S4}$
$w \in \mathbb{S4} \over aw \in \mathbb{S4}$
$w \in \mathbb{S4} \over wa \in \mathbb{S4}$
$xyz \in \mathbb{S4}, x=a^n, y=b^m, z=a^i, n \gt 0, m \gt 0, i \ge 0 \over xbyz \in \mathbb{S4}$

---

1e.

DIV$: \mathbb{N} \times \mathbb{N} \to \mathbb{N}$

DIV$(x, y) = r$

Pré$: y \neq 0$

Pós$: r = \lfloor \frac{x}{y} \rfloor$

$\left\{
  \begin{array}{ll}
    DIV(x, y) = 0 & se\ x \lt y \\
    DIV(x, y) = DIV(x - y, y) + 1 & se\ x \ge y \\
  \end{array}
\right.$

---

### Tipo Abstrato de Dados (Lista\<T>)

LISTA<$\mathbb{N}$>$=\{\lbrack \rbrack, [0], [1], \dots, [0, 0], \dots, [1, 2, 3], \dots\}$

$- \over \lbrack\ \rbrack$

$L \in \text{LISTA<}\mathbb{T}\text{>}, \mathbb{E} \in \mathbb{T} \over E \colon L \ \in \text{ LISTA<}\mathbb{T}\text{>}$

TAMANHO: LISTA<$\mathbb{T}$>$\to \mathbb{N}$

$\left\{
  \begin{array}{l}
    \text{TAMANHO([ ])} = 0 \\
    \text{TAMANHO([E}\colon L\text{])} = 1 + \text{TAMANHO(L)} \\
  \end{array}
\right.$

CAT: LISTA<$\mathbb{T}$>$\times$ LISTA<$\mathbb{T}$>$\to$ LISTA<$\mathbb{T}$>

$\left\{
  \begin{array}{l}
    \text{CAT([ ], L}_2) = L_2 \\
    \text{CAT([E }\colon L_1, L_2) = E\ \colon \ \text{CAT(}L_1, L_2) \\
  \end{array}
\right.$

$\left\{
  \begin{array}{l}
    \text{CAT(}L_1,[\ ]) = L_1 \\
    \text{CAT(}L_2, E\ \colon L_1) =  \\
  \end{array}
\right.$
