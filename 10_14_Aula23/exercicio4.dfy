ghost predicate Sorted(a: array<int>)
reads a
{
  forall j,k :: 0 <= j < k < a.Length ==> a[j] < a[k]
}