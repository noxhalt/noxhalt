# zplug directory
export ZPLUG_HOME=~/.mod/zplug

# zplug plugins
if [[ -e $ZPLUG_HOME/init.zsh ]]; then
  # zplug settings
  export ZPLUG_FILTER=fzf-tmux:fzf
  export ZPLUG_PROTOCOL=HTTPS
  export ZPLUG_USE_CACHE=true
  source $ZPLUG_HOME/init.zsh
  zplug 'junegunn/fzf', use:shell/\*.zsh
  zplug 'zsh-users/zsh-completions'
  zplug 'zsh-users/zsh-autosuggestions'
  zplug 'zsh-users/zsh-syntax-highlighting'
  zplug load
  if ! zplug check --verbose; then
    echo -n 'Install? [y/N]: '
    if read -q; then
      echo
      zplug install
      exec zsh -l
    fi
  fi
else
  autoload compinit; compinit
fi
