method Triplo(n: nat) returns (r: nat)

ensures r == 3 * n // pós condição
{
  assert (n + 2 * n) == 3 * n;
  var y := 2 * n;
  assert (n + y) == 3 * n;
  r := n + y;
  assert r == 3 * n;
}
