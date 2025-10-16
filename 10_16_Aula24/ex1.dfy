method Main()
{
  var c1:set<int> := {};
  var c2 := {1,2,3};
  assert c2 > c1;
  assert {1,2}+{2,3,4} == {4,3,1,2};
}