export TERM="xterm-256color"
#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Moved up here so the icons can work properly
POWERLEVEL9K_MODE='nerdfont-complete'

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
	source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

stty stop ''
stty start ''
stty -ixon
stty -ixoff
# No lag when toggling vi modes
KEYTIMEOUT=1

# https://news.ycombinator.com/item?id=7749061
setopt autopushd
# Autocomplete dotfiles/hidden files
# setopt globdots

# alias ld='ls -lAGh -p --color --group-directories-first'
# -1 - list one file per line
# -A - do not list . and ..
# --sd - sort directories first
# --gs - show git status for each file
alias ld='colorls -1A --sd --gs'

# Matches other git aliases from prezto
alias gcz="git cz"

# Remove node_modules and package-lock.json
alias rmnd="rm -rf node_modules package-lock.json"
alias refresh="echo '🚮 Removing node_modules and package-lock.json...' && rmnd && echo '✅ Done!' && echo '🏃 Installing node_modules...' && npm install && echo '✅ Done!'"
alias cat='bat'
alias grd='gwd ..origin/"$(git rev-parse --abbrev-ref HEAD)"'

# mkdir + cd into it
# https://unix.stackexchange.com/questions/125385/combined-mkdir-and-cd
mcd ()
{
	mkdir -p -- "$1" && cd -P -- "$1"
}

# https://github.com/Homebrew/homebrew-command-not-found#install
# Used for https://github.com/sorin-ionescu/prezto/tree/master/modules/command-not-found
	# if brew command command-not-found-init > /dev/null 2>&1; then eval "$(brew command-not-found-init)"; fi
        #
# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Based on https://github.com/bhilburn/powerlevel9k/wiki/Show-Off-Your-Config#v1rguls-configuration
POWERLEVEL9K_DIR_PATH_SEPARATOR=" $(print_icon "LEFT_SUBSEGMENT_SEPARATOR") "
POWERLEVEL9K_HOME_FOLDER_ABBREVIATION="" # HOUSE ICON

POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0

POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND='black'
POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND='178'
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="015"

POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_BACKGROUND="98"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="98"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator dir dir_writable vcs)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vi_mode time_joined)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%K{white}%F{black} \Uf179 %f%k%F{white}%f "

POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='red'
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='white'
POWERLEVEL9K_TIME_FOREGROUND='246'
POWERLEVEL9K_TIME_BACKGROUND='black'
POWERLEVEL9K_TIME_ICON=''
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false
# Vi-Mode
# POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='005'
# POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='236'
# POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='245'
# POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='236'

POWERLEVEL9K_SHOW_CHANGESET=true

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
