return {
  -- {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   ft = { "python" },
  --   opts = function()
  --     return require "configs.null-ls"
  --   end,
  -- },
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server", "stylua",
        "cmake-language-server",
        "html-lsp", "css-lsp", "prettier",
        "pyright", "mypy", "ruff", "bash-language-server",
        "markdown-oxide", "json-lsp", "beautysh"
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "python", "cpp", "c", "cmake"
      },
    },
  },

  -- trouble plugin
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {

    },
  },

  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({})
    end
  },

  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {

    },
    config = function() require("todo-comments").setup() end
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  {
    "richardbizik/nvim-toc",
    event = "VeryLazy",
    config = function()
      require("nvim-toc").setup({
        toc_header = "Table of Contents"
      })
    end

  },
  {
    "gbprod/yanky.nvim",
    dependencies = {
      { "kkharji/sqlite.lua" }
    },
    opts = {
      ring = { storage = "sqlite" },
    },
    keys = {
      { "<leader>pp", function() require("telescope").extensions.yank_history.yank_history({}) end, desc = "Open Yank History" },
      { "y",          "<Plug>(YankyYank)",                                                          mode = { "n", "x" },                           desc = "Yank text" },
      { "p",          "<Plug>(YankyPutAfter)",                                                      mode = { "n", "x" },                           desc = "Put yanked text after cursor" },
      { "P",          "<Plug>(YankyPutBefore)",                                                     mode = { "n", "x" },                           desc = "Put yanked text before cursor" },
      { "gp",         "<Plug>(YankyGPutAfter)",                                                     mode = { "n", "x" },                           desc = "Put yanked text after selection" },
      { "gP",         "<Plug>(YankyGPutBefore)",                                                    mode = { "n", "x" },                           desc = "Put yanked text before selection" },
      { "]p",         "<Plug>(YankyPutIndentAfterLinewise)",                                        desc = "Put indented after cursor (linewise)" },
      { "[p",         "<Plug>(YankyPutIndentBeforeLinewise)",                                       desc = "Put indented before cursor (linewise)" },
      { "]P",         "<Plug>(YankyPutIndentAfterLinewise)",                                        desc = "Put indented after cursor (linewise)" },
      { "[P",         "<Plug>(YankyPutIndentBeforeLinewise)",                                       desc = "Put indented before cursor (linewise)" },
      { ">p",         "<Plug>(YankyPutIndentAfterShiftRight)",                                      desc = "Put and indent right" },
      { "<p",         "<Plug>(YankyPutIndentAfterShiftLeft)",                                       desc = "Put and indent left" },
      { ">P",         "<Plug>(YankyPutIndentBeforeShiftRight)",                                     desc = "Put before and indent right" },
      { "<P",         "<Plug>(YankyPutIndentBeforeShiftLeft)",                                      desc = "Put before and indent left" },
      { "=p",         "<Plug>(YankyPutAfterFilter)",                                                desc = "Put after applying a filter" },
      { "=P",         "<Plug>(YankyPutBeforeFilter)",                                               desc = "Put before applying a filter" },
    },
  },
  {
    "rmagatti/auto-session",
    lazy = false,

    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_restore_enabled = true,
        auto_session_enabled = true,
        auto_session_enable_last_session = false,
        -- cwd_change_handling = {
        --   restore_upcoming_session = true,   -- already the default, no need to specify like this, only here as an example
        --   pre_cwd_changed_hook = nil,        -- already the default, no need to specify like this, only here as an example
        --   post_cwd_changed_hook = function() -- example refreshing the lualine status line _after_ the cwd changes
        --     require("lualine").refresh()     -- refresh lualine so the new session name is displayed in the status bar
        --   end,
        -- },
      }
    end
  },
  {
    "hedyhli/outline.nvim",
    event = "VeryLazy",
    config = function()
      -- Example mapping to toggle outline
      vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>",
        { desc = "Toggle Outline" })

      require("outline").setup {
        -- Your setup opts here (leave empty to use defaults)
      }
    end,
  },
  {
    "OXY2DEV/markview.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- Used by the code bloxks
    },
    ft = { "markdown" },
    config = function()
      require("markview").setup({
        modes = { "n", "i", "no", "c" },
        hybrid_modes = { "i" },

        -- This is nice to have
        callbacks = {
          on_enable = function(_, win)
            vim.wo[win].conceallevel = 2;
            vim.wo[win].concealcursor = "nc";
          end
        }
      });
    end
  },
}
