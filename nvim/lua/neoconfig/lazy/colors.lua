function ColorMyPencils(color)
  color = color or "rose-pine"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

function SetTheme()
  local themeMap = {}
  themeMap[1] = "rose-pine"
  themeMap[2] = "catppuccin"
  local theme = themeMap[math.random(1, 2)]
  print(theme)
  ColorMyPencils(theme)
end


return {
  {
    "catppuccin/nvim",
    name = 'catppuccin'
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require('rose-pine').setup({
        disable_background = true,
        styles = {
          italic = false,
        },
      })
      SetTheme() 
    end
  },
}
