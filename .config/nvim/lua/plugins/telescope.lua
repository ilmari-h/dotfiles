-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Quit on <esc>
local actions = require("telescope.actions")
require("telescope").setup{
  defaults = {
    mappings = {
      n = {
        ["<ESC>"] = actions.close
      },
    },
  }
}

map("n", "<leader>p", ":lua require('telescope.builtin').live_grep()<cr>")
map("n", "<leader>t", ":lua require('telescope.builtin').treesitter()<cr>")
map("n", "<leader>g", ":lua require('telescope.builtin').git_status()<cr>")
map("n", "<C-p>", ":lua require('telescope.builtin').find_files()<CR>")
map("n", "<C-b>", ":lua require('telescope.builtin').buffers()<cr>")
