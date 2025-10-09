method FindMaxIndex(a: array<int>) returns (i:int)
  requires a.Length > 0
  ensures i >= 0 && i < a.Length
  ensures forall j:nat :: j < a.Length ==> a[i] >= a[j]
  {
    i := 0;
    var p := 1;
    while p < a.Length
    invariant 0 <= i < a.Length
    invariant 1 <= p <= a.Length
    invariant forall j:nat :: j < p ==> a[i] >= a[j]
    {
      if a[p] > a[i]
      {
        i := p;
      }
      p := p + 1;
    }
  }
