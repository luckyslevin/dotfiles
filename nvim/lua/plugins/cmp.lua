return {
  "hrsh7th/nvim-cmp",
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local cmp = require("cmp")

    opts.mapping = vim.tbl_extend("force", opts.mapping, {
      ["<C-P>"] = cmp.config.disable,
      ["<C-N>"] = cmp.config.disable,
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          local entries = cmp.get_entries()
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })

          if #entries == 1 then
            cmp.confirm()
          end
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif vim.snippet.active({ direction = -1 }) then
          vim.schedule(function()
            vim.snippet.jump(-1)
          end)
        else
          fallback()
        end
      end, { "i", "s" }),
    })
  end,
}
