class DequeCircular {
  ghost var Conteudo: seq<int>
  ghost var TamanhoMaximo: nat
  ghost var Representacao: set<object>

  var a: array<int>
  var head: nat
  var count: nat

  ghost predicate Valid()
    reads this, Representacao
  {
    this in Representacao
    && a in Representacao

    && a.Length > 0
    && TamanhoMaximo > 0
    && TamanhoMaximo == a.Length

    && 0 <= count <= a.Length
    && 0 <= head < a.Length

    && |Conteudo| == count
    && (forall i :: 0 <= i < count ==> Conteudo[i] == a[(head + i) % a.Length])
  }

  constructor (cap: nat)
    requires cap > 0
    ensures Conteudo == []
    ensures cap == TamanhoMaximo
    ensures fresh(Representacao)
    ensures Valid()
  {
    a := new int[cap];
    head := 0;
    count := 0;
    ghost Conteudo := [];
    ghost TamanhoMaximo := cap;
    ghost Representacao := { this, a };
    assert Valid();
  }

  method capacity() returns (r: nat)
    requires Valid()
    ensures r == a.Length
    ensures Valid()
  {
    r := a.Length;
    assert Valid();
  }

  method size() returns (r: nat)
    requires Valid()
    ensures r == count
    ensures Valid()
  {
    r := count;
    assert Valid();
  }

  method isEmpty() returns (r: bool)
    requires Valid()
    ensures r == (count == 0)
    ensures Valid()
  {
    r := (count == 0);
    assert Valid();
  }

  method isFull() returns (r: bool)
    requires Valid()
    ensures r == (count == a.Length)
    ensures Valid()
  {
    r := (count == a.Length);
    assert Valid();
  }

  method contains(x: int) returns (r: bool)
    requires Valid()
    ensures r <==> (exists i :: 0 <= i < |Conteudo| && Conteudo[i] == x)
    ensures Valid()
  {
    var i := 0;
    r := false;
    while i < count
      invariant 0 <= i <= count
      invariant Valid()
    {
      if a[(head + i) % a.Length] == x {
        r := true;
        break;
      }
      i := i + 1;
    }
    assert Valid();
  }

  method pushBack(v: int)
    requires Valid()
    requires count < a.Length
    modifies this
    ensures Valid()
    ensures Conteudo == old(Conteudo) + [v]
    ensures count == old(count) + 1
  {
    var idx := (head + count) % a.Length;
    a[idx] := v;
    count := count + 1;
    ghost Conteudo := old(Conteudo) + [v];
    assert Valid();
  }

  method pushFront(v: int)
    requires Valid()
    requires count < a.Length
    modifies this
    ensures Valid()
    ensures Conteudo == [v] + old(Conteudo)
    ensures count == old(count) + 1
  {
    head := (head + a.Length - 1) % a.Length;
    a[head] := v;
    count := count + 1;
    ghost Conteudo := [v] + old(Conteudo);
    assert Valid();
  }

  method popBack() returns (r: int)
    requires Valid()
    requires count > 0
    modifies this
    ensures Valid()
    ensures r == old(Conteudo)[|old(Conteudo)| - 1]
    ensures Conteudo == old(Conteudo[..|old(Conteudo)| - 1])
    ensures count == old(count) - 1
  {
    var idx := (head + count - 1) % a.Length;
    r := a[idx];
    count := count - 1;
    ghost Conteudo := old(Conteudo[..|old(Conteudo)| - 1]);
    assert Valid();
  }

  method popFront() returns (r: int)
    requires Valid()
    requires count > 0
    modifies this
    ensures Valid()
    ensures r == old(Conteudo)[0]
    ensures Conteudo == old(Conteudo[1..])
    ensures count == old(count) - 1
  {
    r := a[head];
    head := (head + 1) % a.Length;
    count := count - 1;
    ghost Conteudo := old(Conteudo[1..]);
    assert Valid();
  }

  method resize(newCap: nat)
    requires Valid()
    requires newCap > a.Length
    modifies this
    ensures Valid()
    ensures a.Length == newCap
    ensures Conteudo == old(Conteudo)
    ensures count == old(count)
  {
    var oldLen := a.Length;
    var n := count;
    var newA := new int[newCap];

    var i := 0;
    while i < n
      invariant 0 <= i <= n
      invariant Valid()
      decreases n - i
    {
      newA[i] := a[(head + i) % oldLen];
      i := i + 1;
    }

    a := newA;
    head := 0;
    ghost Conteudo := old(Conteudo);
    ghost TamanhoMaximo := newCap;
    // ghost Representacao := old(Representacao) - { a } + { a };
    assert Valid();
  }

  // --- Funções utilitárias ---
  function method front() : int
    requires Valid() && count > 0
    ensures front() == Conteudo[0]
  {
    a[head]
  }

  function method back() : int
    requires Valid() && count > 0
    ensures back() == Conteudo[|Conteudo| - 1]
  {
    a[(head + count - 1) % a.Length]
  }

}

method Main() {
  var d := new DequeCircular(4);
  assert d.size() == 0;
  assert d.isEmpty();

  d.pushBack(10);
  d.pushBack(20);
  d.pushFront(5);
  assert d.size() == 3;
  assert d.contains(10);
  assert !d.contains(99);

  var v1 := d.popFront();
  assert v1 == 5;
  var v2 := d.popBack();
  assert v2 == 20;
  assert d.size() == 1;
  assert d.front() == 10;
  assert d.back() == 10;
  
  d.pushBack(30);
  d.pushBack(40);
  d.pushBack(50);
  assert d.isFull();

  var seqVals: seq<int> := [];
  while !d.isEmpty()
    invariant d.Valid()
  {
    var x := d.popFront();
    seqVals := seqVals + [x];
  }
  assert |seqVals| == 4;

  d.pushBack(1);
  d.pushBack(2);
  d.pushBack(3);
  d.pushBack(4);
  assert d.isFull();
  var b := d.popBack();
  assert b == 4;
  d.pushFront(99);
  assert d.front() == 99;

  d.resize(8);
  assert d.capacity() == 8;
  assert d.size() == 4;

  var s2: seq<int> := [];
  while !d.isEmpty()
    invariant d.Valid()
  {
    s2 := s2 + [d.popFront()];
  }
  assert |s2| == 4;
}
