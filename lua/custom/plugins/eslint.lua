return {
  'esmuellert/nvim-eslint',
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        eslint = {
          enabled = false,
        },
      },
    },
  },
}
