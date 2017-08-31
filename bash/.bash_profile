if [ -r ~/.bashrc  ]; then
	source ~/.bashrc
fi

PS1='\[\033[47m\]🐒 → 💻  \[\033[00m\]:\[\033[01;35m\]\w \n\$\[\033[00m\] '

alias la='gls -lAGh -p --color'
alias ld='la --group-directories-first'

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
