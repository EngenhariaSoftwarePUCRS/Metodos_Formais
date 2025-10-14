method Main() {
  var a := new int[5];
  a[0],a[1],a[2],a[3],a[4] := 1,2,3,4,5;

  var s1 := a[1..3];//[1..3[ intervalo [fechado, aberto[
  assert s1 == [2,3];
  
  var s2 := a[2..];
  assert s2 == [3,4,5];

  var s3 := a[..3];
  assert s3 == [1,2,3];

  var s := a[..];
  assert s == [1,2,3,4,5];

  assert forall i :: 0 <= i < a.Length ==> a[i] != 0;
  // equivalent
  assert 0 !in a[..];
}