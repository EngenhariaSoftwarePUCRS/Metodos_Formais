class DequeCircular<T(0)> {
  var a: array<T>
  var head: nat
  var tail: nat
  var size: nat

  ghost var Content: seq<T>
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
    a := new T[max];
    head := 0;
    tail := 0;
    size := 0;
    Content := [];
    Repr := { this, a };
  }

  // Adicionar um novo elemento ao final do deque.
  method PushBack(x: T)
    requires Valid()
    requires size < a.Length
    modifies Repr
    ensures Content == old(Content) + [x]
    ensures Valid()
  {
    a[tail] := x;
    tail := (tail + 1) % a.Length;
    size := size + 1;
    Content := old(Content) + [x];
  }

  // Adicionar um novo elemento ao início do deque.
  method PushFront(x: T)
    requires Valid()
    requires size < a.Length
    modifies Repr
    ensures Content == [x] + old(Content)
    ensures Valid()
  {
    head := (head + a.Length - 1) % a.Length;
    a[head] := x;
    size := size + 1;
    Content := [x] + old(Content);
  }

  // Remover um elemento do final do deque e retornar seu valor.
  method PopBack() returns (v: T)
    requires Valid()
    requires size > 0
    modifies Repr
    ensures v == old(Content[|Content| - 1])
    ensures Content == old(Content[.. |Content| - 1])
    ensures Valid()
  {
    tail := (tail + a.Length - 1) % a.Length;
    v := a[tail];
    size := size - 1;
    Content := old(Content[.. |Content| - 1]);
  }

  // Remover um elemento do início do deque e retornar seu valor.
  method PopFront() returns (v: T)
    requires Valid()
    requires size > 0
    modifies Repr
    ensures v == old(Content[0])
    ensures Content == old(Content[1..])
    ensures Valid()
  {
    v := a[head];
    head := (head + 1) % a.Length;
    size := size - 1;
    Content := old(Content[1..]);
  }

  // Verificar se um determinado elemento pertence ou não ao deque.
  ghost function Contains(x: T): bool
    requires Valid()
  {
    x in Content
  }

  // Retornar o número de elementos do deque.
  function Size(): nat
    requires Valid()
    ensures Size() == size
    ensures Size() == |Content|
  {
    size
  }

  // Retornar a capacidade máxima do deque.
  function Capacity(): nat
    requires Valid()
  {
    a.Length
  }

  // Verificar se o deque está vazio ou não.
  function IsEmpty(): bool
    requires Valid()
  {
    size == 0
  }

  // Verificar se o deque está cheio ou não.
  function IsFull(): bool
    requires Valid()
  {
    size == a.Length
  }

  // Redimensionar o deque para um tamanho maior.
  method Resize(newCapacity: nat)
    requires Valid()
    requires newCapacity > a.Length
    modifies this
    ensures Capacity() == newCapacity
    ensures Content == old(Content)
    ensures Valid()
  {
    var newA := new T[newCapacity];

    var i := 0;
    while i < size
      invariant 0 <= i <= size
      invariant Valid()
      decreases size - i
    {
      newA[i] := a[(head + i) % a.Length];
      i := i + 1;
    }

    a := newA;
    head := 0;
    tail := size;

    Content := old(Content);

    assert Valid();
  }
}

method Main()
{
  var d := new DequeCircular<int>(4);
  assert d.Size() == 0;
  d.PushBack(10);
  d.PushBack(20);
  d.PushFront(5);
  assert d.Contains(10);
  var x := d.PopFront();
  assert x == 5;
  var y := d.PopBack();
  assert y == 20;
  assert d.Size() == 1;

  // testar wrap-around e resize
  d.PushBack(30);
  d.PushBack(40);
  d.PushBack(50);
  assert d.IsFull();
  d.Resize(8);
  assert d.Capacity() == 8;
  assert d.Size() == 4;
}
