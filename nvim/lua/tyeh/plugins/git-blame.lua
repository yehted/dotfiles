return {
  "f-person/git-blame.nvim",
  config = function ()
    local gitblame = require('gitblame')

    gitblame.setup({
      enabled = false,
      date_formate = '%r',
    })
  end,
}
