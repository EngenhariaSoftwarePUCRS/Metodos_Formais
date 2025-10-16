ghost predicate OrdenadoCrescente(s: seq<int>)
{
  forall i,j :: 0 <= i < j < |s| ==> s[i] <= s[j]
}

ghost predicate Permutacao(s1: seq<int>, s2: seq<int>)
{
  multiset(s1) == multiset(s2)
}

method FindMinIndex(a: array<int>, i: int)
{

}

method Ordenar(a:array<int>)
modifies a
ensures OrdenadoCrescente(a[..])
ensures Permutacao(a[..], old(a[..]))
{
  var i := 0;
  while i < a.Length
  invariant;
  invariant;
  invariant;
  invariant;
  {
    var minIndex := FindMinIndex(a,i);
    a[i],a[min] := a[min],a[i];
    i := i + 1;
  }
}