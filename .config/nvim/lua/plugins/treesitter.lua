-- Treesitter Config

local configs = require"nvim-treesitter.configs"
configs.setup {
  ensure_installed = -- used to be "maintained" use explicit list for now
    {"c", "bash", "cpp", "css", "go", "glsl", "javascript",
      "json", "lua", "python", "rust", "solidity", "yaml", "haskell"},
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      scope_incremental = '<CR>',
      node_incremental = '<TAB>',
      node_decremental = '<S-TAB>',
    },
  },
}

-- Folding
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
