local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print "Installing packer close and reopen Neovim..." vim.cmd [[packadd packer.nvim]]
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
}

return packer.startup(function(use)
	use "wbthomason/packer.nvim"
	use "nvim-lua/popup.nvim"
	use "nvim-lua/plenary.nvim"
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{                                      -- Optional
				'williamboman/mason.nvim',
				run = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			{'williamboman/mason-lspconfig.nvim'}, -- Optional
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'L3MON4D3/LuaSnip'},     -- Required
			{'hrsh7th/cmp-buffer'},
			{'rafamadriz/friendly-snippets'}, -- a bunch of snippets to use
			{'hrsh7th/cmp-path'},
			{'L3MON4D3/LuaSnip'}, --snippet engine
			{'saadparwaiz1/cmp_luasnip'}, -- snippet completions
			{'hrsh7th/cmp-cmdline'},
			{'hrsh7th/cmp-nvim-lua'}
		}
	}
	use "nvim-telescope/telescope.nvim"
	use 'nvim-telescope/telescope-media-files.nvim'
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
	use "windwp/nvim-autopairs"
	use "lukas-reineke/indent-blankline.nvim"
	use "nvim-tree/nvim-tree.lua"
	use "kyazdani42/nvim-web-devicons"
	use "akinsho/bufferline.nvim"
	use "akinsho/toggleterm.nvim"
	use {'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
	use "ahmedkhalf/project.nvim"
	use "moll/vim-bbye"
	use "norcalli/nvim-colorizer.lua"
	use "dstein64/vim-startuptime"
	use "ThePrimeagen/harpoon"
	use "jose-elias-alvarez/null-ls.nvim"
	use "tpope/vim-commentary"
	use 'mfussenegger/nvim-dap'
	use 'eldritch-theme/eldritch.nvim'
	use { "ellisonleao/gruvbox.nvim" }

	local lspconfig = require('lspconfig')
	lspconfig.util.default_config = vim.tbl_deep_extend("force", lspconfig.util.default_config, {
		handlers = {
			["window/showMessage"] = function(_, result)
				require('notify')(result.message, "info", { title = "LSP Message" })
			end,
		},
	})
	vim.cmd[[colorscheme eldritch]]

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

