local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local harpoon = require("harpoon")

-- Add current file to Harpoon list
vim.keymap.set("n", "<leader>a", mark.add_file)

-- Toggle the quick menu
vim.keymap.set("n", "<leader>m", ui.toggle_quick_menu)

-- Navigate between the first four marked files
vim.keymap.set("n", "<leader>h", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>t", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>n", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>s", function() ui.nav_file(4) end)

-- Setup Harpoon UI and quick menu width
harpoon.setup({
    menu = {
        width = vim.api.nvim_win_get_width(0) - 4,  -- Adjust menu width based on window size
    }
})

