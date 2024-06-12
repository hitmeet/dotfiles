return {
  {
    "HiPhish/nvim-ts-rainbow2",
    config = function()
      require'nvim-treesitter.configs'.setup {
        rainbow = {
          enable = true,
          extended_mode = true,
          max_fiele_lines = nil,
        }
      }
    end
  }
}
