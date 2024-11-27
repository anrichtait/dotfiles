vim.api.nvim_create_augroup('bufcheck', {clear = true})

-- reload config file on change
vim.api.nvim_create_autocmd('BufWritePost', {
	group    = 'bufcheck',
	pattern  = vim.env.MYVIMRC,
	command  = 'silent source %'})

	vim.api.nvim_create_autocmd({ "TextYankPost" }, {
		callback = function()
			vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
		end,
	})

-- Remove statusline and tabline when in Alpha
vim.api.nvim_create_autocmd({ "User" }, {
  pattern = { "AlphaReady" },
  callback = function()
    vim.cmd [[
      set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
      set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
    ]]
  end,
})

-- Create an augroup for Markdown settings
vim.api.nvim_create_augroup('MarkdownSettings', { clear = true })

-- Apply settings only for Markdown files
vim.api.nvim_create_autocmd('FileType', {
  group = 'MarkdownSettings',
  pattern = 'markdown',
  callback = function()
    vim.opt_local.wrap = true
  end,
})
