return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        marksman = {},
        terraformls = {
          filetypes = { "terraform", "hcl", "tf" },
          settings = {
            terraform = {
              lint = {
                enable = true,
              },
            },
          },
        },
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
