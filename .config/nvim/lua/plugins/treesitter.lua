-- Treesitter Config

local configs = require"nvim-treesitter.configs"
configs.setup {
  ensure_installed = "maintained", -- Only user parsers that are maintained
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
}

-- Folding
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
