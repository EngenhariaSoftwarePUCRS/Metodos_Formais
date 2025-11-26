class DequeCircular {
  var a: array<int>
  var head: nat
  var tail: nat
  var size: nat

  ghost var Content: seq<int>
  ghost var Repr: set<object>

  // Invariante de classe (via predicate):
  // Utilizar um predicado Valid() adequado para a invariante da representação abstrata associada à coleção do tipo deque circular.
  ghost predicate Valid()
    reads this, Repr
  {
    this in Repr
    && a in Repr
    && a.Length > 0
    && 0 <= size <= a.Length
    && 0 <= head < a.Length
    && 0 <= tail < a.Length
    && |Content| == size
    && tail == (head + size) % a.Length
    && (forall i :: 0 <= i < size ==> Content[i] == a[(head + i) % a.Length])
  }

  // Construtor deve instanciar um deque circular vazio com um determinado tamanho máximo.
  constructor(max: nat)
    requires max > 0
    ensures Content == []
    ensures size == 0
    ensures a.Length == max
    ensures fresh(Repr - { this })
    ensures Valid()
  {
    a := new int[max];
    head := 0;
    tail := 0;
    size := 0;
    Content := [];
    Repr := { this, a };
  }

  // Adicionar um novo elemento ao final do deque.
  method PushBack(x: int)
    requires Valid()
    requires size < a.Length
    modifies Repr
    ensures Content == old(Content) + [x]
    ensures Valid()
    ensures fresh(Repr - old(Repr))
  {
    a[tail] := x;
    tail := (tail + 1) % a.Length;
    size := size + 1;
    Content := old(Content) + [x];
  }

  // Adicionar um novo elemento ao início do deque.
  method PushFront(x: int)
    requires Valid()
    requires size < a.Length
    modifies Repr
    ensures Content == [x] + old(Content)
    ensures Valid()
    ensures fresh(Repr - old(Repr))
  {
    head := (head + a.Length - 1) % a.Length;
    a[head] := x;
    size := size + 1;
    Content := [x] + old(Content);
  }

  // Remover um elemento do final do deque e retornar seu valor.
  method PopBack() returns (v: int)
    requires Valid()
    requires size > 0
    modifies Repr
    ensures v == old(Content[|Content| - 1])
    ensures Content == old(Content[.. |Content| - 1])
    ensures Valid()
    ensures fresh(Repr - old(Repr))
  {
    tail := (tail + a.Length - 1) % a.Length;
    v := a[tail];
    size := size - 1;
    Content := old(Content[.. |Content| - 1]);
  }

  // Remover um elemento do início do deque e retornar seu valor.
  method PopFront() returns (v: int)
    requires Valid()
    requires size > 0
    modifies Repr
    ensures v == old(Content[0])
    ensures Content == old(Content[1..])
    ensures Valid()
    ensures fresh(Repr - old(Repr))
  {
    v := a[head];
    head := (head + 1) % a.Length;
    size := size - 1;
    Content := old(Content[1..]);
  }

  // Verificar se um determinado elemento pertence ou não ao deque.
  ghost function Contains(x: int): bool
    requires Valid()
    reads this, Repr
  {
    x in Content
  }

  // Retornar o número de elementos do deque.
  function Size(): nat
    reads this, Repr
    requires Valid()
    ensures Size() == size
    ensures Size() == |Content|
  {
    size
  }

  // Retornar a capacidade máxima do deque.
  function Capacity(): nat
    reads this, Repr
    requires Valid()
  {
    a.Length
  }

  // Verificar se o deque está vazio ou não.
  function IsEmpty(): bool
    reads this, Repr
    requires Valid()
  {
    size == 0
  }

  // Verificar se o deque está cheio ou não.
  function IsFull(): bool
    reads this, Repr
    requires Valid()
  {
    size == a.Length
  }

  // Redimensionar o deque para um tamanho maior.
  method Resize(newCapacity: nat)
    requires Valid()
    requires newCapacity > a.Length
    modifies Repr
    ensures a.Length == newCapacity
    ensures Content == old(Content)
    ensures fresh(Repr - old(Repr))
    ensures Valid()
    ensures Capacity() == newCapacity
  {
    var oldA := a;
    var oldHead := head;
    var oldSize := size;
    var oldContent := Content;
    var oldLength := a.Length;
    
    var newA := new int[newCapacity];

    var i := 0;
    while i < size
      invariant 0 <= i <= size
      invariant newA.Length == newCapacity
      invariant oldA == a
      invariant oldHead == head
      invariant oldLength == a.Length
      invariant Valid()
      invariant forall j :: 0 <= j < i ==> newA[j] == oldA[(oldHead + j) % oldLength]
      invariant forall j :: 0 <= j < i ==> newA[j] == Content[j]
      decreases size - i
    {
      newA[i] := a[(head + i) % a.Length];
      i := i + 1;
    }

    assert forall j :: 0 <= j < size ==> newA[j] == Content[j];

    a := newA;
    head := 0;
    tail := size;
    Repr := { this, a };

    Content := oldContent;

    assert this in Repr;
    assert a in Repr;
    assert a.Length == newCapacity > 0;
    assert 0 <= size <= a.Length;
    assert 0 <= head < a.Length;
    assert size < newCapacity;
    assert 0 <= tail < a.Length;
    assert tail == (head + size) % a.Length;
    assert forall j :: 0 <= j < size ==> Content[j] == a[(head + j) % a.Length];
  }
}

method Main()
{
  var d := new DequeCircular(5);
  assert d.Content == [];
  assert d.Size() == 0;
  assert d.Capacity() == 5;
  assert d.IsEmpty();

  // d.PushBack(10);
  // d.PushBack(20);
  // assert d.Content == [10, 20];
  // assert d.Size() == 2;

  // d.PushFront(5);
  // assert d.Content == [5, 10, 20];
  // assert d.Size() == 3;

  // var x := d.PopFront();
  // assert x == 5;
  // assert d.Content == [10, 20];

  // var y := d.PopBack();
  // assert y == 20;
  // assert d.Content == [10];
  // assert d.Size() == 1;

  // d.PushBack(30);
  // d.PushBack(40);
  // d.PushBack(50);
  // d.PushBack(60);
  // assert d.Content == [10, 30, 40, 50, 60];
  // assert d.IsFull();

  // d.Resize(10);
  // assert d.Capacity() == 10;
  // assert d.Content == [10, 30, 40, 50, 60];
  // assert !d.IsFull();
}
