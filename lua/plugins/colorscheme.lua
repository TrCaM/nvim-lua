return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "sainnhe/gruvbox-material" },
  { "catppuccin/nvim" },
  { "rose-pine/neovim" },
  { "rebelot/kanagawa.nvim" },
  { "sainnhe/sonokai" },
  { "folke/tokyonight.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
}
