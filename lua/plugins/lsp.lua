return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = {
          settings = {
            -- Customize settings for tsserver here, if needed
            javascript = {
              format = {
                semicolons = "remove",
              },
            },
            typescript = {
              format = {
                semicolons = "remove",
              },
            },
          },
        },
      },
    },
  },
}
