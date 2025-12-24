return {
  'ibhagwan/fzf-lua',
  keys = {
    {
      '<leader>t',
      function() require('fzf-lua').files() end,
      desc = 'Fuzzy find files',
    },
  }
}
