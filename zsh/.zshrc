# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Moved up here so the icons can work properly
POWERLEVEL9K_MODE='nerdfont-complete'

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
	source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# stty stop ''
# stty start ''
# stty -ixon
# stty -ixoff
# No lag when toggling vi modes
KEYTIMEOUT=1

# https://news.ycombinator.com/item?id=7749061
setopt autopushd
# Autocomplete dotfiles/hidden files
# setopt globdots
# https://stackoverflow.com/questions/32057760/is-it-possible-to-not-share-history-between-panes-windows-in-tmux-with-zsh
setopt noincappendhistory
setopt nosharehistory

alias ld="lsd -l"

alias rmnd="rm -rf node_modules"
alias refresh="echo '󰗨 Removing node_modules...' && rmnd && echo ' Done!' && echo '󰑮 Installing node_modules...' && npm install && echo '  Done!'"
alias cat='bat'
alias grd='gwd ..origin/"$(git rev-parse --abbrev-ref HEAD)"'

echodone()
{
  echo ' Done!'
  echo ''
}

clear_node_modules()
{
  echo '󰗨 Removing node_modules...'
  rmnd
  echodone
}

install_node_modules()
{
  echo '󰑮 Installing node_modules...'
  npm install
  echodone
}

npm_start()
{
  echo ' Starting FE...'
  npm start
  echodone
}

stop_be()
{
  echo ' Stopping BE...'
  make stop || true
  echodone
}

stop_e2e_service()
{
  echo ' Stopping E2E generator service...'
  make e2e_gen.stop || true
  echodone
}

run_mfa()
{
  echo '󰑮 Running MFA...'
  aws-mfa
  echodone
}

start_be()
{
  echo ' Starting BE...'
  make start
  echodone
}

start_guacamole()
{
  echo ' Starting Guacamole...'
  make guacamole.start
  echodone
}

start_e2e_service()
{
  echo ' Starting E2E generator service...'
  make e2e_gen.start
  echodone
}

rebe ()
{
  stop_be && stop_e2e_service && run_mfa && start_be && start_guacamole && start_e2e_service
}

refe ()
{
  clear_node_modules && install_node_modules && npm_start
}

# mkdir + cd into it
# https://unix.stackexchange.com/questions/125385/combined-mkdir-and-cd
mkcd ()
{
	mkdir -p -- "$1" && cd -P -- "$1"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.config/lscolors/lscolors.sh ] && source ~/.config/lscolors/lscolors.sh
[[ ! -f ~/.config/p10k/.p10k.zsh ]] || source ~/.config/p10k/.p10k.zsh

eval "$(direnv hook zsh)"
# Make direnv shut up when changing dirs
export DIRENV_LOG_FORMAT=""
# export PATH="/Users/pmetodiev/nvim/bin/:/usr/local/opt/go@1.17/bin:$PATH"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if type brew &>/dev/null; then
	FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

	autoload -Uz compinit
	compinit
fi
