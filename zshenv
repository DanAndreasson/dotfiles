# use vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL

# ensure dotfiles bin directory is loaded first
export PATH="$HOME/.bin:/usr/local/sbin:$PATH"
# export PATH="$HOME/.rbenv/bin:$PATH"

# mkdir .git/safe in the root of repositories you trust
export PATH=".git/safe/../../bin:$PATH"

# python 2
export PATH="/usr/local/opt/python@2/libexec/bin:$PATH"

# Export yarn path
# export PATH="/usr/local/Cellar/node/7.4.0/bin:$PATH"
# export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"

LESSPIPE=`which src-hilite-lesspipe.sh`

export LESSOPEN="| ${LESSPIPE} %s"

export LESS='-R'

# Local config
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
