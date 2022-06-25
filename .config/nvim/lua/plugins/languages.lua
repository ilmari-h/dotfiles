local lsp_requires = {}
local lsp = require 'lspconfig'
local configs = require 'lspconfig/configs'
-- local coq = require 'coq'

function lsp_requires.signature()
  local signature_conf = {
    bind = true,
    handler_opts = {
      border = "none"
    },
    hint_prefix = "ﰬ "
  }
  require "lsp_signature".on_attach(signature_conf)
end

function lsp_requires.cmp(server_name)
  -- Setup lspconfig completion capabilities.
  local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you"ve enabled.
  require("lspconfig")[server_name].setup {
    capabilities = capabilities
}
end

lsp.tsserver.setup{
  on_attach =
    function(_, bfnr)
      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bfnr, ...) end
      local function buf_set_option(...) vim.api.nvim_buf_set_option(bfnr, ...) end

      local opts = { noremap = true, silent = true }
      lsp_requires.signature()
      lsp_requires.cmp("tsserver")

    end,
  filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact", "typescript.tsx", "javascript.tsx" }
}

lsp.pyright.setup{
  on_attach =
    function(client, bfnr)
      lsp_requires.signature()
      lsp_requires.cmp("pyright")
    end
  }

lsp.bashls.setup{
  on_attach =
    function(client, bfnr)
      lsp_requires.signature()
      lsp_requires.cmp("bashls")
    end
  }

lsp.cssls.setup{
  on_attach =
    function(client, bfnr)
      lsp_requires.signature()
      lsp_requires.cmp("cssls")
    end
}

lsp.ccls.setup{
  on_attach =
    function(client, bfnr)
      lsp_requires.signature()
      lsp_requires.cmp("ccls")
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
      lsp_requires.cmp("rust_analyzer")
    end,
  settings = {
      ["rust-analyzer"] = {
          assist = {
              importGranularity = "module",
              importPrefix = "by_self",
          },
          cargo = {
              loadOutDirsFromCheck = true
          },
          procMacro = {
              enable = true
          },
      }
  }
}

lsp.gopls.setup{
  on_attach =
    function(client, bfnr)
      lsp_requires.signature()
      lsp_requires.cmp("gopls")
    end
}

lsp.svelte.setup{
  on_attach =
    function(client, bfnr)
      lsp_requires.signature()
      lsp_requires.cmp("svelte")
    end
}

lsp.solidity_ls.setup {
  on_attach =
    function(client, bfnr)
      lsp_requires.signature()
      lsp_requires.cmp("solidity_ls")
    end
}

lsp.texlab.setup {
  on_attach =
    function(client, bfnr)
      lsp_requires.signature()
      lsp_requires.cmp("texlab")
    end
}

lsp.hls.setup{
	on_attach =
    function(client, bfnr)
      lsp_requires.signature()
      lsp_requires.cmp("hls")
    end
}

lsp.sumneko_lua.setup {
  on_attach =
    function(_, _)
      lsp_requires.signature()
      lsp_requires.cmp("sumneko_lua")
    end,
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = "LuaJIT",
          -- Setup your lua path
          path = runtime_path,
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {"vim", "runtime_path"},
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
}
--coq.lsp_ensure_capabilities()
