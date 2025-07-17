current_nvim=$(pwd)/nvim
if [ ! -L ~/.config/nvim ]; then
  echo -n "NVIM config does not exist... "
  echo "Creating a symlink"
  ln -s $current_nvim ~/.config/nvim
else
  echo "NVIM config exists... Skipping"
fi


current_hypr=$(pwd)/hypr
if [ ! -L ~/.config/hypr ]; then
  echo -n "Hyprland config does not exist... "
  echo "Creating a symlink"
  ln -s $current_hypr ~/.config/hypr
else
  echo "Hyprland config exists... Skipping"
fi

