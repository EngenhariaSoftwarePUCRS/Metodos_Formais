theory Exemplos
  imports Main
begin

term "True"
value "True"

(* primrec soma :: "nat => nat => nat" where
soma1: "soma 0 y = y" |
soma2:: "soma (Suc x) y = Suc (soma x y)" *)

(* primrec par "nat => bool" where *)
fun par :: "nat => bool" where
"par 0 = True" |
"par (Suc 0) = False" |
"par (Suc (Suc n)) = par n"

fun somatorio :: "nat => nat => nat" where
"somatorio i n = (if i>n then 0 else i + somatorio (Suc i) n)"
(* Could not find lexicographic termination order - need to show proof of finishability *)
termination

P(X) === soma(x, 0) = x

soma1: "soma 0 y = y" |
soma2: "soma (Suc x) y = Suc (soma x y)"

theorem somazero : "soma x 0 = x"
(* Proof Methods
- Induction
- Auto
- Simp
- Blast
- Fastforce
- Metis
- Arith *)
proof (induction x)
  show "soma 0 0 = 0" by (simp only:soma1)
next
fix n::nat
assume HI:"soma n 0 = n"
have "soma (Suc n) 0 = Suc (soma n 0)"
  by (simp only:soma2)
also have "... = Suc n"
  by (simp only:HI)
show "soma (Suc n) 0 = Suc n"
  by (simp)
qed
