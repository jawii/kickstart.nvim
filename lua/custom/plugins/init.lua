-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    dir = '~/.config/nvim/lua/custom',
    config = function()
      require('custom.lorem').setup()
      require('custom.comment_finder').setup()
    end,
  },
}
