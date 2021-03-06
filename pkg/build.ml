#!/usr/bin/env ocaml 
#directory "pkg"
#use "topkg.ml"

let () = 
  Pkg.describe "higher" ~builder:(`OCamlbuild_no_ocamlfind []) ([
      Pkg.lib "pkg/META";
      Pkg.lib ~exts:Exts.module_library "higher";
      Pkg.doc "README.md" ]
      @ List.map (fun e -> Pkg.doc ("examples/"^e))
        (Array.to_list (Sys.readdir "examples")))

