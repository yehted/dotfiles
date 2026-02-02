return {
  root_dir = vim.fs.root(0, {"graphqlrc.json", ".graphqlconfig", ".graphqlrc", "package.json"}),
  flags = {
    debounce_text_changes = 150,
  },
}
