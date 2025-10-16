method Main() {
  var c1 := set x:nat | x < 100;
  assert 22 in c1;
  var c2 := set x:nat | x<3 :: x*x;
}