local lsp_requires = {}
local lsp = require 'lspconfig'
-- local coq = require 'coq'

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

lsp.tsserver.setup{
  on_attach =
    function(client, bfnr)
      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
      local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

      local opts = { noremap = true, silent = true }
      lsp_requires.signature()

    end,
  filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact", "typescript.tsx", "javascript.tsx" }
}

lsp.pyright.setup{
  on_attach =
    function(client, bfnr)
      lsp_requires.signature()
    end
  }

lsp.bashls.setup{
  on_attach =
    function(client, bfnr)
      lsp_requires.signature()
    end
  }

lsp.cssls.setup{
  on_attach =
    function(client, bfnr)
      lsp_requires.signature()
    end
}

lsp.ccls.setup{
  on_attach =
    function(client, bfnr)
      lsp_requires.signature()
    end,
  init_options = {
    clang = {
      extraArgs = {"--gcc-toolchain=/usr"};
    },
    cache = {directory = "/tmp/ccls-cache"}
  }
}

lsp.rust_analyzer.setup{
  on_attach =
    function(client, bfnr)
      lsp_requires.signature()
    end
}

lsp.svelte.setup{
  on_attach =
    function(client, bfnr)
      lsp_requires.signature()
    end
}

--coq.lsp_ensure_capabilities()
