method Main()
{
  var a := new int[3];
  a[0] := 1;
  a[1] := 0;
  a[2] := 1;
  var s := a[..];
  assert s == [1,0,1];
  var c := set x | x in s;
  assert c == {1,0};
  var mc := multiset(s);
  assert mc == multiset{0,1,1};
  assert multiset(a[..])[1] == 2;
}