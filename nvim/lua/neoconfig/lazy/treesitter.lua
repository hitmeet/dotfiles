return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = { "go", "java", "python","lua", "vim", "vimdoc", "query" },
        sync_install = false,
        auto_install = true,
          enable = true,
          additional_vim_regex_highlighting = false,
        }
    end
  },
}

