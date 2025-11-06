class Node<T(0)> {
  var data: T
  var next: Node?<T>

  ghost var tailContents: seq<T>
  ghost var Repr: set<object>

  ghost predicate Valid()
  reads this, Repr
  {
    this in Repr
    && (next != null ==> next in Repr && next.Repr <= Repr)
    && (next == null ==> tailContents == [])
    && (next != null ==> tailContents == [next.data] + next.tailContents)
  }

  constructor()
  ensures next == null
  ensures fresh(Repr - { this })
  ensures Valid()
  {
    next := null;
    tailContents := [];
    Repr := { this };
  }
}

class Queue<T(0)> {
  ghost var contents: seq<T>
  ghost var Repr: set<object>
  ghost var spine: set<Node<T>>

  var head: Node?<T>
  var tail: Node?<T>

  ghost predicate Valid()
  reads this, Repr, spine
  {
    this in Repr
    && spine <= Repr
    && head in spine
    && tail in spine
    && tail.next == null &&
    (forall n::
      n in spine ==>
        n.Repr <= Repr && this !in n.Repr &&
        n.Valid() && 
        (n.next == null ==> n == tail)) &&
    (forall n::
      n in spine ==>
        n.next != null ==> n.next in spine) &&
    contents == head.tailContents
  }

  constructor() 
  // ensures contents == []
  ensures |contents| == 0
  ensures fresh(Repr - { this })
  ensures Valid()
  {
    var n: Node<T> := new Node<T>();
    head := n;
    tail := n;
    contents := n.tailContents;
    Repr := { this } + n.Repr;
    spine := { n };
  }

  method Enqueue(element: T)
  requires Valid()
  modifies Repr
  ensures contents == old(contents) + [element]
  ensures fresh(Repr - old(Repr))
  ensures Valid()
  {
    var n: Node<T> := new Node<T>();
    n.data := element;
    tail.next := n;
    tail := n;

    forall m | m in spine
    {
      m.tailContents := m.tailContents + [element];
    }
    contents := contents + [element];

    forall m | m in spine
    {
      m.Repr := m.Repr + n.Repr;
    }
    Repr := Repr + n.Repr;

    spine := spine + { n };
  }

  method Front() returns (element: T)
  requires Valid()
  requires 0 < |contents|
  ensures element == contents[0]
  ensures Valid()
  {
    element := head.next.data;
  }

  method Dequeue() returns (element: T)
  requires Valid()
  requires 0 < |contents|
  modifies Repr
}
