local on_attach = function(client, bufnr) 
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  local opts = { noremap = true, silent = true }

  require 'completion'.on_attach(client, bufnr)
end 

require'lspconfig'.tsserver.setup{
  on_attach = on_attach,
  filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact", "typescript.tsx", "javascript.tsx" }
}
