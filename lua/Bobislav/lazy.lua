local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { {'nvim-lua/plenary.nvim'} }
  },

  { "rose-pine/neovim", as = "rose-pine" },
  { 'bluz71/vim-moonfly-colors', as = 'moonfly' },
  { 'bluz71/vim-nightfly-colors', as = 'nightfly' },
  { 'catppuccin/nvim', as = 'catppuccin' },

  'nvim-treesitter/nvim-treesitter', build = ':TSUpdate',
  'nvim-treesitter/playground',
  'theprimeagen/harpoon',
  'mbbill/undotree',
  'Exafunction/codeium.vim',
  'christoomey/vim-tmux-navigator',

  'neovim/nvim-lspconfig',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',

}

require("lazy").setup(plugins)
