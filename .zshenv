# Other imports
[[ -f ~/.distrobox.sh ]] && . ~/.distrobox.sh

# Export

export PATH=$PATH:$HOME/.local/bin:$HOME/bin

export JAVA_HOME=~/.jdks/jbr-17.0.7/
export PATH="$JAVA_HOME/bin:$PATH"
export PATH="$PATH:$HOME/.cargo/env"
export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"
export PATH=$PATH:~/.local/bin/go/bin

# Aliases
alias ls="ls --color"
