return {
  { "junegunn/fzf", build = "./install --all" },
  { "junegunn/fzf.vim", dependencies = { "junegunn/fzf" } }
}
