-- General
require('orgmode').setup({
	org_agenda_files = {'~/Documents/notes/*', '~/Documents/notes/**/*'},
	org_default_notes_file = '~/Documents/notes/todo.org',
	org_todo_keywords = {'TODO', 'READ', 'OPEN', 'REVIEW', 'DONE', 'CLOSED'},
})


-- Don't use treesitter for org files
require('nvim-treesitter.configs').setup({
	--ensure_installed = 'all',
	ignore_install = { 'org' },
})

require('cmp').setup({
  sources = {
    { name = 'orgmode' }
  }
})

vim.g.completion_chain_complete_list = {
  org = {
    { mode = 'omni'},
  },
}
-- add additional keyword chars
vim.cmd[[autocmd FileType org setlocal iskeyword+=:,#,+]]
