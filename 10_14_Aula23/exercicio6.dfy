ghost predicate Sorted(a: array<int>)
reads a
{
  forall j,k :: 0 <= j < k < a.Length ==> a[j] < a[k]
}

method BuscaBinaria(a:array<int>,valor:int) returns (indice:int)
requires Sorted(a)
ensures indice != -1 ==> (0 <= indice < a.Length && a[indice] == valor)
ensures indice == -1 ==> forall i :: 0 <= i <= a.Length - 1 ==> a[i] != valor
{
  var esquerda := 0;
  var direita := a.Length - 1;
  // decreases direita - esquerda
  while esquerda <= direita
  invariant 0 <= esquerda <= direita + 1 <= a.Length
  invariant forall k :: 0 <= k < esquerda ==> a[k] < valor
  invariant forall k :: direita < k < a.Length ==> a[k] > valor
  {
    var meio := esquerda + (direita - esquerda) / 2;
    if a[meio] == valor {
      return meio;
    } else if (a[meio] < valor) {
      esquerda := meio + 1;
    } else {
      direita := meio - 1;
    }
  }
  return -1;
}
