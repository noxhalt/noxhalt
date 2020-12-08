# zsh-syntax-highlighting
export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# zsh-autosuggestions
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# fzf
export FZF_DEFAULT_OPTS="--select-1 --exit-0 --ansi --reverse --extended --cycle"
bindkey "^r" fzf-history-widget
# bindkey "^d" fzf-cd-widget
# bindkey "^f" fzf-file-widget
