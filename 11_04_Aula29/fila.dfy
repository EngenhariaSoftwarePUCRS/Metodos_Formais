class Fila
{
  ghost var Conteudo:seq<int>
  ghost var TamanhoMaximo:nat
  ghost var Representacao:set<object>

  var a: array<int>
  var fim: nat

  ghost predicate Valid()
  reads this, Representacao
  ensures Valid() ==> this in Representacao
  {
    this in Representacao
    && a in Representacao
    && TamanhoMaximo > 0
    && TamanhoMaximo == a.Length
    && 0 <= fim <= a.Length
    && Conteudo == a[..fim]
  }
  
  constructor (tamanhoMaximo: nat)
  requires tamanhoMaximo > 0
  ensures Conteudo == []
  ensures tamanhoMaximo == TamanhoMaximo
  ensures fresh(Representacao)
  ensures Valid()
  {
    a := new int[tamanhoMaximo];
    fim := 0;
    Conteudo := [];
    TamanhoMaximo := tamanhoMaximo;
    Representacao := { this, a };
  }

  method Enfileirar(elemento: int)
  requires Valid()
  requires |Conteudo| < TamanhoMaximo
  modifies Representacao
  ensures Conteudo == old(Conteudo) + [elemento]
  ensures fresh(Representacao - old(Representacao))
  ensures Valid()
  {
    a[fim] := elemento;
    fim := fim + 1;
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
    fim := fim - 1;
    forall i | 0 <= i < fim
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
    fim
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
