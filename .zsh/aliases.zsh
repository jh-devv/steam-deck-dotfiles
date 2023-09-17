# My aliases

# Easier navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# List files stuff
alias ls="exa --icons -F -H --group-directories-first --git"

# CD Shortcuts
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias docs="cd ~/Documents"

# Quick edit to my aliases and zshrc config
alias zshrc="vim ~/.zshrc"
alias aliases="vim ~/.zsh/myaliases.zsh"

# Git
alias gs='git status'

# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Get week number
alias week='date +%V'

# IP addresses
alias publicip="curl -s icanhazip.com"
alias localip="ip a | grep -oP 'inet\s+\K(\d+\.){3}\d+' | grep -v '127.0.0.1' | head -n 1"
alias ips="ip a | grep -oP 'inet\s+\K(\d+\.){3}\d+' | grep -v '127.0.0.1'"

# Show active network interfaces
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

