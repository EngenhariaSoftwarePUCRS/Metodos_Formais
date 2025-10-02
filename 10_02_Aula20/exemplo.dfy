function fat(n: nat) : nat
// decreases n // (variante)
{
  if n == 0
  then 1
  else n * fat(n - 1)
}

predicate par(n: nat)
{
  n % 2 == 0
}

method soma(x: int, y: int) returns (r: int)
requires x >= 0 && y >= 0 // pré condição
ensures r == x + y
{
  r := x + y;
}
