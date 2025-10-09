method FindMaxValue(a: array<int>) returns (m:int)
  requires a.Length > 0
  ensures exists i:nat :: i < a.Length && a[i] == m
  ensures forall i:nat :: i < a.Length ==> m >= a[i]
  {
    var i := 0;
    m := a[0];
    while i < a.Length
    invariant i >= 0 && i <= a.Length
    invariant exists j:nat :: j < a.Length && m == a[j]
    invariant forall j:nat :: j < i ==> m >= a[j]
    // invariant 0 <= i <= a.Length
    // invariant i == 0 ==> m == a[0]
    // invariant i > 0 ==> exists j:nat :: j < i && m == a[j]
    {
      if a[i] > m {
        m := a[i];
      }
      i := i + 1;
    }
  }
