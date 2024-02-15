let
  head = builtins.head;
  tail = builtins.tail;

  # [?] -> bool
  isEmpty = xs: builtins.isList xs && xs == [];

  # [?] -> { x: ?, xs: [?] }
  splitList = xs: if isEmpty xs then null else
    { x = head xs; xs = tail xs; };

  # string -> [string] -> string
  join = c: xs: let ys = splitList xs; in
    if isNull ys then "" else
      if isEmpty ys.xs then ys.x else
        "${ys.x}${c}${join c ys.xs}";
in
{
  isEmpty = isEmpty;
  splitList = splitList;
  join = join;
}
