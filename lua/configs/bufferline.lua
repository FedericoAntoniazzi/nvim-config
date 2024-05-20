require('bufferline').setup({
  options = {
    -- Allow highlight groups
    themable = true,

    -- Hide the close button
    show_buffer_close_icons = false,
    show_close_icon = false,

    -- Show buffer numbers
    numbers = "ordinal",

    separator = "thick",

    -- Bar offset
    offsets = {
      {
        filetype = "NvimTree",
        text = "NvimTree",
        text_align = "center",
        separator = true,
      }
    },

    custom_filter = function(buf_number)
      if vim.api.nvim_buf_get_name(buf_number):find(vim.fn.getcwd(), 0, true) then
        return true
      end
    end,

  }
})
