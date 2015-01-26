module T = Types.Types

let join sep xs =
  List.fold_left (fun a x -> if a = "" then x else a ^ sep ^ x) "" xs

let rec pr_str mal_obj print_readably =
  let r = print_readably in
    match mal_obj with
      | T.Int i -> string_of_int i
      | T.Symbol { T.value = s } -> s
      | T.Keyword s -> ":" ^ s
      | T.Nil -> "nil"
      | T.Bool true -> "true"
      | T.Bool false -> "false"
      | T.String s ->
          if r
          then  "\"" ^ (Str.global_replace (Str.regexp "\\([\"\\]\\)") "\\\\\\1" s) ^ "\""
          else s
      | T.List { T.value = xs } ->
          "(" ^ (join " " (List.map (fun s -> pr_str s r) xs)) ^ ")"
      | T.Vector { T.value = xs } ->
          "[" ^ (join " " (List.map (fun s -> pr_str s r) xs)) ^ "]"
      | T.Map { T.value = xs } ->
         (Types.MalMap.fold (fun k v s -> s ^ (if s = "" then "{" else ", ") ^ (pr_str k r)
                                          ^ " " ^ (pr_str v r)) xs "")
         ^ "}"
      | T.Fn f -> "#<fn>"
