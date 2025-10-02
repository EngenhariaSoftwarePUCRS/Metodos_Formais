theory Exercicio1
  imports Main
begin

primrec pot2 :: "nat => nat" where
eq1: "pot2 0 = 1" |
eq2: "pot2 (Suc n) = 2 * pot2 n"

theorem e2a: "pot2 n = 2^n"
proof (induction n)
    have "pot2 0 = 1"
        by (simp only:eq1)
    also have "... = 2^0"
        by (algebra)
    finally show "pot2 0 = 2^0"
        by (simp)
next
    fix x::nat
    assume HI:"pot2 x = 2^x"
    have "pot2 (Suc x) = 2 * pot2 x"
        by (simp only:eq2)
    also have "... = 2 * 2^x"
        by (simp only:HI)
    also have "... = 2^Suc x"
        by (simp)
    finally show "pot2 (Suc x) = 2^Suc x"
        by (simp)
qed
end