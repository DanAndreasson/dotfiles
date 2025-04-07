# use vim as the visual editor
export VISUAL=nvim
export EDITOR=$VISUAL
export LANG="en_US.UTF-8"
export ZSH=/Users/dan/.oh-my-zsh


export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export PATH="$HOME/.bin:$PATH"

# ensure dotfiles bin directory is loaded first
export PATH="$HOME/.bin:/usr/local/sbin:$PATH"

# mkdir .git/safe in the root of repositories you trust
export PATH=".git/safe/../../bin:$PATH"
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

LESSPIPE=`which src-hilite-lesspipe.sh`

export LESSOPEN="| ${LESSPIPE} %s"

export LESS='-R'

# Local config
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
[[ -f ~/.openai ]] && source ~/.openai
