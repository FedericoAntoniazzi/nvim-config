return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",       -- source for text in buffer
      "hrsh7th/cmp-path",         -- source for file system paths
      'ray-x/cmp-treesitter',     -- source for treesitter
      'saadparwaiz1/cmp_luasnip', -- Completion source for LuaSnip
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*"
      },
      "rafamadriz/friendly-snippets"
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')

      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        -- Disable snippets on comments
        enabled = function()
          -- disable completion in comments
          local context = require 'cmp.config.context'
          -- keep command mode completion enabled when cursor is in a comment
          if vim.api.nvim_get_mode().mode == 'c' then
            return true
          else
            return not context.in_treesitter_capture("comment") 
              and not context.in_syntax_group("Comment")
          end
        end,

        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.close(),
          ["<CR>"] = cmp.mapping.confirm({
              behavior = cmp.ConfirmBehavior.Replace,
              select = true,
          }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "treesitter" },
          { name = "buffer" },
          { name = "path" },
        }),
      })

      -- Add parenthesis when completing function names
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

      -- / cmdline
      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- `:` cmdline setup.
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        }),
        matching = { disallow_symbol_nonprefix_matching = false }
      })
      
      vim.cmd([[
        set completeopt=menuone,noinsert,noselect
        highlight! default link CmpItemKind CmpItemMenuDefault
      ]])
    end
  }
}
