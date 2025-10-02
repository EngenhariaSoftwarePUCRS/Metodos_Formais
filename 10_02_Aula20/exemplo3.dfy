ghost function fat(n: nat): nat // ghost = não gera código
{
  if n == 0 then 1 else n * fat(n - 1)
}

method fatorial(n: nat) returns (r: nat)
ensures r == fat(n) // pós condição
{
  r := 1;
  var i := 0;
  while i < n
  decreases n - i // variante
  invariant r == fat(i) && i <= n
  {
    i := i + 1;
    r := r * i;
  }
}
