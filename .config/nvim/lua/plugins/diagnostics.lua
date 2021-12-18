-- Visuals
local signs = { Error = " ", Warning = "| ", Hint = "| ", Information = "| " }
for type, icon in pairs(signs) do
  local hl = "LspDiagnosticsSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

require('vim.lsp.protocol').CompletionItemKind = {
    '', -- Text
    '', -- Method
    '', -- Function
    '', -- Constructor
    '', -- Field
    '', -- Variable
    '', -- Class
    'ﰮ', -- Interface
    '', -- Module
    '', -- Property
    '', -- Unit
    '', -- Value
    '了', -- Enum
    '', -- Keyword
    '﬌', -- Snippet
    '', -- Color
    '', -- File
    '', -- Reference
    '', -- Folder
    '', -- EnumMember
    '', -- Constant
    '', -- Struct
    '', -- Event
    'ﬦ', -- Operator
    '', -- TypeParameter
}

---- Show source in diagnostics
--vim.lsp.handlers["textDocument/publishDiagnostics"] =
--  function(_, _, params, client_id, _)
--    local config = { -- your config
--      underline = false,
--      virtual_text = {
--        prefix = "• ",
--        spacing = 2,
--      },
--      signs = true,
--      update_in_insert = false,
--    }
--    local uri = params.uri
--    local bufnr = vim.uri_to_bufnr(uri)
--
--    if not bufnr then
--      return
--    end
--
--    local diagnostics = params.diagnostics
--
--    for i, v in ipairs(diagnostics) do
--      diagnostics[i].message = string.format("%s: %s", v.source, v.message)
--    end
--
--    vim.lsp.diagnostic.save(diagnostics, bufnr, client_id)
--
--    if not vim.api.nvim_buf_is_loaded(bufnr) then
--      return
--    end
--
--    vim.lsp.diagnostic.display(diagnostics, bufnr, client_id, config)
--  end
--
