-- Telescope keybindings with hidden files included
vim.keymap.set("n", "<leader>ff", function()
    require('telescope.builtin').find_files({
        cwd = vim.fn.expand('~/'),  -- Use your home directory or any root directory
        hidden = true,  -- Include hidden files
    })
end, opts)

vim.keymap.set("n", "<leader>fp", function()
    require('telescope.builtin').find_files({
        cwd = vim.fn.getcwd(),  -- Uses the current working directory
        hidden = true,  -- Include hidden files
    })
end, opts)

vim.keymap.set("n", "<leader>fs", function()
    require('telescope.builtin').live_grep({
        cwd = vim.fn.getcwd(),  -- Uses the current working directory
        hidden = true,  -- Optional: Include hidden files in search results
    })
end, opts)

vim.keymap.set("n", "<leader>fr", function()
    require('telescope.builtin').oldfiles({
        hidden = true,  -- Include hidden files in oldfiles results
    })
end, opts)

vim.keymap.set("n", "<leader>bl", function()
    require('telescope.builtin').buffers({
        sort_lastused = true,  -- Optional: Sort buffers by last used
        hidden = true,  -- Include hidden buffers
    })
end, opts)
