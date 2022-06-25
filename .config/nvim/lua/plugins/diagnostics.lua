local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }
local function nkeymap(key, map)
  keymap("n", key, map, opts)
end

-- Visuals
local signs = { Error = " ", Warn = " ", Warning = " ", Hint = " ", Information = " ", Info = " "  }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- vim.diagnostic.config({virtual_text = false})

vim.diagnostic.config({
	underline = true,
	virtual_text = false,
	signs = true,
	update_in_insert = false,
	float = {
		scope = "cursor",
		border = "single",
		header = "",
		prefix = "",
	}

})

nkeymap('<leader>d', '<cmd>lua vim.diagnostic.open_float({scope = "line"})<CR>')
nkeymap('[d', "<cmd>lua vim.diagnostic.goto_prev()<CR>")
nkeymap(']d', "<cmd>lua vim.diagnostic.goto_next()<CR>")
