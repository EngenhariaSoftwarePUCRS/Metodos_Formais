class Fila
{
  ghost var Conteudo:seq<int>
  ghost var Representacao:set<object>

  var a: array<int>
  var tamanho: nat

  ghost predicate Valid()
  reads this, Representacao
  ensures Valid() ==> this in Representacao
  {
    this in Representacao
    && a in Representacao
    && a.Length > 0
    && 0 <= tamanho <= a.Length
    && tamanho == |Conteudo|
    && Conteudo == a[..tamanho]
  }
  
  constructor (tamanhoMaximo: nat)
  requires tamanhoMaximo > 0
  ensures Conteudo == []
  ensures fresh(Representacao)
  ensures Valid()
  {
    a := new int[tamanhoMaximo];
    tamanho := 0;
    Conteudo := [];
    Representacao := { this, a };
  }

  method Enfileirar(elemento: int)
  requires Valid()
  modifies Representacao
  ensures Conteudo == old(Conteudo) + [elemento]
  ensures fresh(Representacao - old(Representacao))
  ensures Valid()
  {
    if tamanho == a.Length {
      var b := new int[a.Length * 2];
      forall i | 0 <= i < tamanho
      {
        b[i] := a[i];
      }
      Representacao := Representacao - { a };
      Representacao := Representacao + { b };
      a := b;
    }
    a[tamanho] := elemento;
    tamanho := tamanho + 1;
    Conteudo := Conteudo + [elemento];
  }

  method Desenfileirar() returns (element: int)
  requires Valid()
  requires |Conteudo| > 0
  // requires Conteudo != []
  modifies Representacao
  ensures element == old(Conteudo[0])
  ensures |Conteudo| == |old(Conteudo)| - 1
  ensures Conteudo == old(Conteudo[1..])
  ensures Valid()
  {
    element := a[0];
    tamanho := tamanho - 1;
    forall i | 0 <= i < tamanho
    {
      a[i] := a[i + 1];
    }
    Conteudo := Conteudo[1..];
  }

  function Tamanho(): nat
  reads this, Representacao
  requires Valid()
  ensures Tamanho() == |Conteudo|
  ensures Valid()
  {
    tamanho
  }
}

method Main()
{
  var f := new Fila(5);
  assert f.Conteudo == [];
  f.Enfileirar(3);
  f.Enfileirar(1);
  assert f.Conteudo == [3, 1];
  var element := f.Desenfileirar();
  assert element == 3;
  assert f.Conteudo == [1];
  assert f.Tamanho() == 1;
}
