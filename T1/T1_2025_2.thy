theory T1_2025_2
  imports Main
begin

primrec cat :: "'a list \<Rightarrow> 'a list \<Rightarrow> 'a list" where
cateq1: "cat [] ys = ys" |
cateq2: "cat (x#xs) ys = x#cat xs ys"

primrec reverso :: "'a list \<Rightarrow> 'a list" where
reveq1: "reverso [] = []" |
reveq2: "reverso (x#xs) = cat (reverso xs) [x]"

lemma l1: "\<forall>ys zs :: 'a list . cat xs (cat ys zs) = cat (cat xs ys) zs"
proof (induction xs)
  show "\<forall>ys zs :: 'a list . cat [] (cat ys zs) = cat (cat [] ys) zs"
  proof (rule allI, rule allI)
    fix l2::"'a list" and l3::"'a list"
    have "cat [] (cat l2 l3) = cat l2 l3" by (simp only:cateq1)
    also have "... = cat (cat [] l2) l3" by (simp only:cateq1)
    finally show "cat [] (cat l2 l3) = cat (cat [] l2) l3" .
  qed
next
  fix h::'a and l1::"'a list"
  assume HI: "\<forall>ys zs :: 'a list . cat l1 (cat ys zs) = cat (cat l1 ys) zs"
  show "\<forall>ys zs :: 'a list . cat (h#l1) (cat ys zs) = cat (cat (h#l1) ys) zs"
  proof (rule allI, rule allI)
    fix l2::"'a list" and l3::"'a list"
    have "cat (h#l1) (cat l2 l3) = h#(cat l1 (cat l2 l3))" by (simp only:cateq2)
    also have "... = h#(cat (cat l1 l2) l3)" by (simp only:HI)
    also have "... = cat (h#(cat l1 l2)) l3" by (simp only:cateq2)
    also have "... = cat (cat (h#l1) l2) l3" by (simp only:cateq2)
    finally show "cat (h#l1) (cat l2 l3) = cat (cat (h#l1) l2) l3" .
  qed
qed

lemma l2: "cat xs [] = xs"
  sorry

lemma l3: "\<forall>ys :: 'a list . reverso (cat xs ys) = cat (reverso ys) (reverso xs)"
  sorry

theorem t1: "reverso (reverso xs) = xs"
  sorry

end