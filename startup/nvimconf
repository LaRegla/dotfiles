-- lsp shi
vim.lsp.config.clangd = {
  cmd = { 'clangd' },
  filetypes = { 'c', 'cpp' },
  root_markers = { '.git' },
}
vim.lsp.enable('clangd')

-- open diagnostic floating window
vim.keymap.set('n', 'grm', vim.diagnostic.open_float, {})

--remove auto comment annoying shi on new lines when pressing o O or enter on a already commented line
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({"r", "o" })
  end,
})

--line numbers
vim.opt.number = true
vim.opt.relativenumber = true



-- tabs display as 4 spaces indentation as 4 as well
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Bootstrap lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- plugins
require("lazy").setup({
  -- Autocompletion engine
  {
    'saghen/blink.cmp',
    version = '*',
    opts = {
      keymap = {
        preset = 'default', -- Tab to navigate/complete, Enter to accept
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
    },
  },
--autopairs
{ 'windwp/nvim-autopairs', event = 'InsertEnter', opts = {} },
--colorscheme	
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      -- Optional settings: 'hard', 'medium' (default), or 'soft'
      vim.g.everforest_background = 'hard'
      -- Enable better italic support in GUI/modern terminals
      vim.g.everforest_enable_italic = 1

      vim.cmd.colorscheme('everforest')
    end,
  },
--treesitter
  {
    "nvim-treesitter/nvim-treesitter",
	branch = "master",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "cpp", "python", "bash", "json", "yaml" }, -- auto-installs these
        auto_install = true, -- automatically installs missing parsers when opening a new filetype
        highlight = {
          enable = true,
        },
      })
    end,
  },
})


