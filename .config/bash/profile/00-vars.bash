export VISUAL="nvim"
export EDITOR="nvim"
export PAGER="less"
export CLICOLOR=1
export COLORTERM="truecolor"

export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTCONTROL=ignoreboth

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Prompt
PS1=""

# Directories

if [ -z "$XDG_CONFIG_HOME" ] ; then
    export XDG_CONFIG_HOME="$HOME/.config"
fi
if [ -z "$XDG_DATA_HOME" ] ; then
    export XDG_DATA_HOME="$HOME/.local/share"
fi
if [ -z "$XDG_CACHE_HOME" ] ; then
    export XDG_CACHE_HOME="$HOME/.cache"
fi

export MANPATH="$HOME/.local/share/man:$MANPATH"

export LOCAL_DIR="$HOME/.local"

export LOCAL_BIN_DIR="$LOCAL_DIR/bin"

export PATH="$LOCAL_BIN_DIR:$PATH"
