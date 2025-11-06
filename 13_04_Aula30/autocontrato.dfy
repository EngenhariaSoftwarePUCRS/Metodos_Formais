class {:autocontracts} Fila
{
  ghost var Conteudo:seq<int>

  var a: array<int>
  var tamanho: nat

  ghost predicate Valid()
  {
    && a.Length > 0
    && 0 <= tamanho <= a.Length
    && tamanho == |Conteudo|
    && Conteudo == a[..tamanho]
  }
  
  constructor (tamanhoMaximo: nat)
  requires tamanhoMaximo > 0
  ensures Conteudo == []
  {
    a := new int[tamanhoMaximo];
    tamanho := 0;
    Conteudo := [];
  }

  method Enfileirar(elemento: int)
  ensures Conteudo == old(Conteudo) + [elemento]
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
  requires |Conteudo| > 0
  // requires Conteudo != []
  ensures element == old(Conteudo[0])
  ensures |Conteudo| == |old(Conteudo)| - 1
  ensures Conteudo == old(Conteudo[1..])
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
  ensures Tamanho() == |Conteudo|
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
