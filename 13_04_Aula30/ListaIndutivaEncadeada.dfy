class ListaIndutivaEncadeada {
  var cabeca: int
  var cauda: ListaIndutivaEncadeada?
  var tamanho: nat

  ghost var Conteudo: seq<int>
  ghost var Repr: set<ListaIndutivaEncadeada>

  ghost predicate Valid()
  reads this, Repr
  ensures Valid() ==> this in Repr
  {
    this in Repr
    && (cauda != null ==> cauda in Repr && cauda.Repr <= Repr)
    && tamanho == |Conteudo|
    && Conteudo == (if cauda == null then [cabeca] else [cabeca] + cauda.Conteudo)
  }
}
