 * Copyright (C) 2010-2012 Facebook
let find_root_from_absolute_path file =
  let xs = Common.split "/" (Common.dirname file) in
  let xxs = Common.inits xs in
  xxs +> List.rev +> Common.find_some (fun xs ->
    let dir = "/" ^ Common.join "/" xs in
    let gitdir = Filename.concat dir ".git" in
    if Sys.file_exists gitdir
    then Some dir
    else None
  )

let clean_git_patch xs =
  if (ret <> 0) 
  then failwith ("pb with command: " ^ s)
  commits +> Common_extra.progress (fun k -> Common.filter (fun (id, x) ->
    k ();
    let (Lib_vcs.VersionId scommit) = id in
    let cmd = (spf "cd %s; git show --oneline --no-color --stat %s"
                  basedir scommit) in
    let xs = Common.cmd_to_list cmd in
    (* basic heuristic: more than N files in a diff => refactoring diff *)
    List.length xs > threshold
  ))