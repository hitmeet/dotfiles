# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

alias v='nvim'
alias pbcopy='wl-copy'
alias pbpaste='wl-paste'

# only if autojump is installed
source /usr/share/autojump/autojump.zsh

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify
bindkey "^[[A" history-search-backward 
bindkey "^[[B" history-search-forward


source $(rpm -ql zsh-autosuggestions | grep "\.zsh")
source $(rpm -ql zsh-syntax-highlighting | grep "zsh-syntax-highlighting\.zsh")

# if "most" package is installed
export PAGER="/usr/bin/most -s"

# lsd installtion required (better ls)
command -v lsd > /dev/null && alias ls='lsd --group-dirs first'
command -v lsd > /dev/null && alias tree='lsd --tree'
alias l="ls -la"

alias bat="bat --theme='Monokai Extended'"
command -v cat > /dev/null && alias cat='bat --pager=never'
command -v less > /dev/null && alias less='bat'

source <(fzf --zsh)

# use fd instead of find

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_DEFAULT_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
#
_fzf_compgen_path(){
  fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir(){
  fd --type=d --hidden --exclude .git . "$1"
}

#source ~/personal/external-git/fzf-git.sh/fzf-git.sh

show_file_or_dir_preview="if [ -d {} ]; then lsd --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'lsd --tree --color=always {} | head -200'"


_fzf_comprun(){
  local command=$1000
  shift

  case "$command" in
    cd)           fzf --preview 'lsd --tree {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"           "$@" ;;
    ssh)          fzf --preview 'dig {}'                    "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

export PATH=$PATH:$HOME/.local/bin
# eval "$(oh-my-posh init zsh --config $HOME/develop/dotfiles/oh-my-posh/oh-my-posh.toml)"

hypershot_dir=~/screenshots/
if [ ! -d "$hypershot_dir" ]; then
  mkdir -p $hypershot_dir
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
source ~/develop/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
