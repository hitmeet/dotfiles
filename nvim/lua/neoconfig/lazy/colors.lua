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
  themeMap[3] = "sonokai"
  local theme = themeMap[math.random(1, 3)]
  print(theme)
  ColorMyPencils(theme)
end


return {
  {
    "catppuccin/nvim",
    name = 'catppuccin'
  },
  {
    "sainnhe/sonokai",
    name = "sonokai"
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
