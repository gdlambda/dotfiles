neofetch

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"
plugins=(git)

source $ZSH/oh-my-zsh.sh

export MANPATH="/usr/local/man:$MANPATH"

alias vim=nvim
alias compd='fpath() { g++ "$1" -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion -Werror -pedantic-errors -ggdb -o "debug.${1%.*}.out"; unset -f fpath; }; fpath'
alias comp='fpath() { g++ "$1" -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion -Werror -pedantic-errors -O2 -DNDEBUG -o "prod.${1%.*}.out"; unset -f fpath; }; fpath'
alias gitleaks="$HOME/gitleaks/gitleaks dir ."
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
export PATH=$PATH:/usr/local/go/bin
export PATH="$PATH:/opt/nvim/"

. "$HOME/.local/bin/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"   loads nvm bash_completion

