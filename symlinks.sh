current_nvim=$(pwd)/nvim
if [ ! -L ~/.config/nvim ]; then
  echo -n "NVIM config does not exist... "
  echo "Creating a symlink"
  ln -s $current_nvim ~/.config/nvim
else
  echo "NVIM config exists... Skipping"
fi

current_fastfetch=$(pwd)/fastfetch
if [ ! -L ~/.config/fastfetch ]; then
  echo -n "Fastfetch config does not exist... "
  echo "Creating a symlink"
  ln -s $current_fastfetch ~/.config/fastfetch
else
  echo "fastfetch config exists... Skipping"
fi

current_hypr=$(pwd)/hypr
if [ ! -L ~/.config/hypr ]; then
  echo -n "Hyprland config does not exist... "
  echo "Creating a symlink"
  ln -s $current_hypr ~/.config/hypr
else
  echo "Hyprland config exists... Skipping"
fi

current_waybar=$(pwd)/waybar
if [ ! -L ~/.config/waybar ]; then
  echo -n "Waybar config does not exist... "
  echo "Creating a symlink"
  ln -s $current_waybar ~/.config/waybar
else
  echo "waybar config exists... Skipping"
fi

current_zshrc=$(pwd)/rc/.zshrc
if [ ! -L ~/.zshrc ]; then
  echo -n "zshrc does not exist... "
  echo "Creating a symlink"
  ln -s $current_zshrc ~/.zshrc
else
  echo "zshrc config exists... Skipping"
fi

current_ghostty=$(pwd)/ghostty
if [ ! -L ~/.config/ghostty ]; then
  echo -n "Ghostty config does not exist... "
  echo "Creating a symlink"
  ln -s $current_ghostty ~/.config/ghostty
else
  echo "Ghostty config exists... Skipping"
fi

current_tmux=$(pwd)/tmux
if [ ! -L ~/.config/tmux ]; then
  echo -n "tmux config does not exist... "
  echo "Creating a symlink"
  ln -s $current_tmux ~/.config/tmux
else
  echo "tmux config exists... Skipping"
fi
