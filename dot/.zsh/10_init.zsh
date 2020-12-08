# environment vars

# history
export REPORTTIME=3
export HISTFILE=~/.zsh_history
export HISTSIZE=999999999
export SAVEHIST=$HISTSIZE

# path
# export PATH=$(~/utils/scripts/pathman load)$PATH

# fpath
export fpath=($fpath ${0:A:h}/func)
