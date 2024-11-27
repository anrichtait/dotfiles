local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)  -- Navigate to the left window
keymap("n", "<C-j>", "<C-w>j", opts)  -- Navigate to the window below
keymap("n", "<C-k>", "<C-w>k", opts)  -- Navigate to the window above
keymap("n", "<C-l>", "<C-w>l", opts)  -- Navigate to the right window
keymap("n", "<leader>wd", ":q<CR>", opts)  -- Close the currently selected window
keymap("n", "<leader>wv", ":vsplit<CR>", opts)  -- Split window vertically
keymap("n", "<leader>wh", ":split<CR>", opts)   -- Split window horizontally

-- Buffer navigation
keymap("n", "<leader>bn", ":bnext<CR>", opts)  -- Switch to the next buffer
keymap("n", "<leader>bp", ":bprevious<CR>", opts)  -- Switch to the previous buffer
keymap("n", "<leader>bk", ":bdelete<CR>", opts)  -- Kill the current buffer

-- Clipboard and text manipulation
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])  -- Yank selected text to system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]])  -- Yank entire line to system clipboard
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")  -- Move selected lines down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")  -- Move selected lines up
vim.keymap.set("n", "<C-d>", "<C-d>zz")  -- Scroll down and center cursor
vim.keymap.set("n", "<C-u>", "<C-u>zz")  -- Scroll up and center cursor
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])  -- Delete selected text and enter insert mode
vim.keymap.set("n", "<leader>ra", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])  -- Replace word under cursor
vim.keymap.set("n", "<leader><leader>", function()  -- Source current file
    vim.cmd("so")
end)
vim.keymap.set("n", "<leader>gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)

-- terminal
keymap("n", "<leader>tt", "<Cmd>ToggleTerm<CR>", opts)  -- Toggle terminal window
keymap("n", "<leader>tf", "<Cmd>ToggleTerm direction=float<CR>", opts)-- Open a new terminal in a floating window

-- nerd tree
vim.api.nvim_set_keymap('n', '<leader>fe', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- run cpp
vim.api.nvim_set_keymap("n", "<leader>cc", ":ToggleTerm direction=horizontal cmd='zsh -c \"g++ % -o %:r && ./%:r\"'<cr>", { noremap = true, silent = true })
