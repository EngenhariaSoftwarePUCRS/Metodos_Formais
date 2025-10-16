ghost function Somatorio(s:seq<int>): int
{
  if s == []
  then 0
  else s[0] + Somatorio(s[1..])
}