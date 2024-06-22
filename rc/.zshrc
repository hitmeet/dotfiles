alias v='nvim'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

export PATH=$PATH:/home/meet/.cargo/bin

export EXTERNAL_GIT_PATH=~/personal/external-git
export EXTERNAL_THEME_PATH=~/personal/themes

# only if autojump is installed
source /usr/share/autojump/autojump.zsh
source $EXTERNAL_GIT_PATH/powerlevel10k/powerlevel10k.zsh-theme

########  only if powerlevel10k is installed ##################
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


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


# if zsh-autosuggestion is installed
source $EXTERNAL_GIT_PATH/zsh-autosuggestions/zsh-autosuggestions.zsh

# if zsh-syntax-highlighting is installed (installed through  package manager)
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# if "most" package is installed
export PAGER="/usr/bin/most -s"

# lsd installtion required (better ls)
command -v lsd > /dev/null && alias ls='lsd -a --group-dirs first'
command -v lsd > /dev/null && alias tree='lsd --tree'
alias l="ls -la"

# if thefuck is installed (to correct previoud command)
eval $(thefuck --alias f) 

export PATH=$PATH:/home/meet/local/bin

alias bat="bat --theme='Monokai Extended'"
command -v cat > /dev/null && alias cat='bat --pager=never'
command -v less > /dev/null && alias less='bat'

source <(fzf --zsh)
