# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#!/bin/zsh
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

if [[ ! -d "${HOME}/.zgenom" ]]; then
  git clone https://github.com/jandamm/zgenom.git "${HOME}/.zgenom"
fi

if [[ ! -d "${HOME}/.oh-my-zsh" ]]; then
  git clone https://github.com/ohmyzsh/ohmyzsh "${HOME}/.oh-my-zsh"
fi

source "${HOME}/.zgenom/zgenom.zsh"
zgenom autoupdate

if ! zgenom saved; then
  echo "Creating a zgenom save"

  #plugins 
  zgenom load zdharma-continuum/fast-syntax-highlighting
  zgenom load zsh-users/zsh-history-substring-search

  # Warn you when you run a command that you've set an alias for without
  # using the alias.
  zgenom load djui/alias-tips

  # Add my collection of git helper scripts.
  zgenom load unixorn/git-extra-commands
  # Supercharge your history search with fzf
  zgenom load unixorn/fzf-zsh-plugin
  # zgenom load Aloxaf/fzf-tab

  # add vim mode 
  zgenom load jeffreytse/zsh-vi-mode

  #import base ohmyzsh library
  zgenom ohmyzsh

  #plugins
  zgenom oh-my-zsh plugins/pip
  zgenom oh-my-zsh plugins/colored-man-pages
  zgenom oh-my-zsh plugins/github
  zgenom oh-my-zsh plugins/python
  zgenom oh-my-zsh plugins/rsync
  zgenom ohmyzsh plugins/git
  zgenom ohmyzsh plugins/sudo
  zgenom ohmyzsh plugins/ripgrep
  zgenom ohmyzsh plugins/colorize
  # zgenom ohmyzsh plugins/zoxide
  # zgenom ohmyzsh plugins/zsh-autosuggestions
  # zgenom ohmyzsh plugins/zsh-syntax-highlighting
  # zgenom ohmyzsh plugins/zsh-vim-mode
  #zgenom ohmyzsh plugins/


#plugins=(git zoxide sudo zsh-interactive-cd zsh-autosuggestions
#          zsh-syntax-highlighting zsh-vim-mode)

  # zgenom load zsh-users/zsh-syntax-highlighting
  # zgenom load zsh-users/zsh-completions


  # A set of shell functions to make it easy to install small apps and
  # utilities distributed with pip.
  zgenom load sharat87/pip-app

  zgenom load chrissicool/zsh-256color

  # Load more completion files for zsh from the zsh-lovers github repo.
  zgenom load zsh-users/zsh-completions src

  # Docker completion
  zgenom load srijanshetty/docker-zsh
  zgenom ohmyzsh plugins/docker-compose

  # Load me last
  # GENCOMPL_FPATH=$HOME/.zsh/complete

  # Very cool plugin that generates zsh completion functions for commands
  # if they have getopt-style help text. It doesn't generate them on the fly,
  # you'll have to explicitly generate a completion, but it's still quite cool.
  zgenom load RobSis/zsh-completion-generator

  # Add Fish-like autosuggestions to your ZSH.
  zgenom load zsh-users/zsh-autosuggestions

  # k is a zsh script / plugin to make directory listings more readable,
  # adding a bit of color and some git status information on files and
  # directories.
  zgenom load supercrabtree/k

  zgenom load romkatv/powerlevel10k powerlevel10k

  zgenom save

  zgenom compile "${HOME}/.zshrc"



fi

#editor config
export SUDO_EDITOR="/opt/nvim-linux64/bin/nvim"
export VISUAL="nvim"
export GIT_EDITOR="nvim"

#colorize config
export ZSH_COLORIZE_STYLE=monokai 


#aliases
alias vi="nvim"
alias vim="nvim"

alias feh="feh --scale-down"
# alias ncspot="flatpak run io.github.hrkfdn.ncspot"


# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"


source $ZSH/oh-my-zsh.sh

export PATH="$PATH:/opt/nvim-linux64/bin" #nvim export
export PATH="$PATH:/home/graeme/.local/bin"

#backwards word kill
bindkey '^H' backward-kill-word

# source ~/.oh-my-zsh/plugins/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


