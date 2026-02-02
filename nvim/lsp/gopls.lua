return {
  settings = {
    gopls = {
      ["local"] = "github.com/validationcloud",
      semanticTokens = true,
      buildFlags = { "-tags=integration,tools" },
    },
  }
}
