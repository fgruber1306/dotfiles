return {
  'declancm/maximize.nvim',
  opts = {
    default_keymaps = false,
  },
  keys = {
    {
      '<leader>z',
      mode = 'n',
      function()
        require('maximize').toggle()
      end,
      desc = 'Toggle split maximization',
    },
  },
}
