local lsp_requires = {}

function lsp_requires.signature()
  local lsp_conf = {
    bind = true,
    handler_opts = {
      border = "none"
    },
    hint_prefix = "ﰬ "
  }
  require "lsp_signature".on_attach(lsp_conf)
end

require'lspconfig'.tsserver.setup{
  on_attach = 
    function(client, bfnr)
      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
      local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

      local opts = { noremap = true, silent = true }
      lsp_requires.signature()

    end,
  filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact", "typescript.tsx", "javascript.tsx" }
}

require'lspconfig'.pyright.setup{
  on_attach = 
    function(client, bfnr)
      lsp_requires.signature()
    end
  }

require'lspconfig'.bashls.setup{
  on_attach = 
    function(client, bfnr)
      lsp_requires.signature()
    end
  }

require'lspconfig'.cssls.setup{
  on_attach =
    function(client, bfnr)
      lsp_requires.signature()
    end
}

require'lspconfig'.ccls.setup{
  on_attach =
    function(client, bfnr)
      lsp_requires.signature()
    end,
  init_options = {
    clang = {
      extraArgs = {"--gcc-toolchain=/usr"};
    }
  }
}
