## Especificações Indutivas e Recursivas

$A \rightarrow B$ = $A \over B$

$T \rightarrow B$ = $- \over B$

1h.
Conjunto $\mathbb{S} = \{0, 1, 3, 7, 15, 31\}$

$- \over 0 \in \mathbb{S}$

$n \in \mathbb{S} \over 2 \times n + 1 \in \mathbb{S}$

---

1c.

Conjunto $\mathbb{S1} = \{a^nbc^n | n \in \mathbb{N}\}$

$\mathbb{S1} = \{b, abc, aabcc, ...\}$

$- \over b \in \mathbb{S1}$
$\mathbb{w} \in \mathbb{S1} \over a\mathbb{w}c \in \mathbb{S1}$

Como gramática livre de contexto:

$\mathbb{S} \rightarrow b$

$\mathbb{S} \rightarrow a\mathbb{S}c$

---

1d.

Conjunto $\mathbb{S2} = \{a^nb^m | n \gt 0 \land m \gt 0\}$

$\mathbb{S2} = \{ab, aab, abb, aabb, aaab, ...\}$

$- \over ab \in \mathbb{S2}$
$\mathbb{w} \in \mathbb{S2} \over a\mathbb{w} \in \mathbb{S2}$
$\mathbb{w} \in \mathbb{S2} \over \mathbb{w}b \in \mathbb{S2}$

---

1e.

Conjunto $\mathbb{S3} = \{a^nb^ma^n | n \gt 0 \land m \gt 0\}$

$\mathbb{S3} = \{aba, aabbaa, aaabaaa, ...\}$

$- \over aba \in \mathbb{S3}$
$\mathbb{w} \in \mathbb{S3} \over a\mathbb{w}a \in \mathbb{S3}$

---

tabela | tabela
--- | ---
POT $: \mathbb{N} \times \mathbb{N} \rightarrow \mathbb{N}$ | POT $: \mathbb{Z} \times \mathbb{Z} \rightarrow \mathbb{Z}$
POT$(b, p) = r$ | POT$(b, p) = r$
Pré$: T$ | Pré$: b \geq 0 \land p \geq 0$
Pós$: r = b^p$ | Pós$: r = b^p$
POT$(b, p) = 1$, se $p = 0$ | POT$(b, 0) = 1$
POT$(b, p) = b \times POT(b, p - 1)$, se $p > 0$ | POT$(b, p + 1) = b \times POT(b, p)$
$\forall b, p \in \mathbb{N}(POT(b,p) = b^p)$
