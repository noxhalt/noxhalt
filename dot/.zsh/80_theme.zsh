# Nightmare Theme

# Main prompt
PROMPT=$'\n'
if [[ ${UID} -eq 0 ]]; then
  PROMPT+=%{$fg[red]%}
else
  PROMPT+=%{$fg[cyan]%}
fi
PROMPT+='%n'
PROMPT+='%{$reset_color%} at '
PROMPT+='%{$fg_bold[blue]%}%(5~,%-2~/.../%2~,%~)'
PROMPT+='%{$reset_color%}'
PROMPT+=$'\n'
PROMPT+='%(?,%{$fg_bold[blue]%},%{$fg_bold[red]%})'
PROMPT+='= '
PROMPT+='%{$reset_color%}'

# Right prompt
RPROMPT='${vcs_info_msg_0_}%{$reset_color%}'

# Sub prompt
PROMPT2='%(?,%{$fg_bold[blue]%},%{$fg_bold[red]%})+ %{$reset_color%}'

# Correct prompt
SPROMPT='%(?,%{$fg_bold[blue]%},%{$fg_bold[red]%})? '
SPROMPT+='%{$fg_bold[green]%}%r '
SPROMPT+='%{$reset_color%}'
SPROMPT+='%{$fg_bold[yellow]%}[nyae]'
SPROMPT+='%{$reset_color%} '

# vcs info
zstyle ':vcs_info:git:*'  check-for-changes true
zstyle ':vcs_info:git:*'  stagedstr     '%F{yellow}'
zstyle ':vcs_info:git:*'  unstagedstr   '%F{red}'
zstyle ':vcs_info:*'      formats       '%F{blue}%c%u%b%f'
zstyle ':vcs_info:*'      actionformats '%F{magenta}%b[%a]'

precmd () {
  vcs_info
}
