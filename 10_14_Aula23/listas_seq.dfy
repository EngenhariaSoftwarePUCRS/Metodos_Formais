// tipo seq<T>
// tipo imutável
// literal [1,2,3]
method Main() {
  var vazia: seq<nat> := [];
  var lista1 := [1,2,3,4,5];
  assert 0 !in lista1;
  assert 3 in lista1;
  assert [1,2] == [1,2];
  assert |lista1| == 5;
  assert [] < lista1; // prefixo
  assert [1,2,3,4] < lista1;
  assert [1,2] + [3,4] == [1,2,3,4];
  assert lista1[1] == 2;
  var lista2 := lista1[1:=6];
  assert lista2 == [1,6,3,4,5];
}
