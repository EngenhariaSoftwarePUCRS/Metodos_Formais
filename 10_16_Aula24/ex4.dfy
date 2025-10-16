//tipo multiset<T>
//imutável
//literal multiset{1,2,2,3}
method Main() {
  var mc1:multiset<int> := multiset{};
  var mc2 := multiset{1,2,2,3};
  assert |mc2| == 4;
  assert mc2[7] == 0;
  assert mc2[3] == 1;
  assert mc2[2] == 2;
  var mc3 := mc2[2:=0];
  assert mc3 == multiset{1,3};
}