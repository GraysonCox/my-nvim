return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "mfussenegger/nvim-jdtls" },
    opts = {
      servers = {
        jdtls = {},
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
      setup = {
        jdtls = function(_, _)
          -- Special handling for Java projects
          local jdtls = require("jdtls")

          -- Find the root directory (look for common Java markers)
          local root_dir = require("jdtls.setup").find_root({ "gradlew", "mvnw", ".git" })
          if root_dir == "" then
            return true -- no project root found, skip
          end

          local home = vim.fn.getenv("HOME")
          local workspace_dir = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

          local config = {
            cmd = {
              "jdtls",
              "-data", workspace_dir,
            },
            root_dir = root_dir,
            settings = {
              java = {
                signatureHelp = { enabled = true },
                contentProvider = { preferred = "fernflower" },
                completion = {
                  favoriteStaticMembers = {
                    "org.junit.Assert.*",
                    "org.junit.Assume.*",
                    "org.junit.jupiter.api.Assertions.*",
                  },
                },
              },
            },
          }

          jdtls.start_or_attach(config)
          return true -- prevent default lspconfig setup
        end,
      },
    },
  },
}
