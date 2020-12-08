# === DIRCOLORS ===
eval $(dircolors ~/.dircolors)

# === LESS ===
eval $(lesspipe.sh)
# visual bell
export LESS_TERMCAP_vb='\a'
# blink / bold sequence
export LESS_TERMCAP_mb=$fg_bold[red]
export LESS_TERMCAP_md=$fg_bold[blue]
export LESS_TERMCAP_me=$reset_color
# console line
export LESS_TERMCAP_so=$bg[grey]
export LESS_TERMCAP_se=$reset_color
# underline
export LESS_TERMCAP_us=$fg[green]
export LESS_TERMCAP_ue=$reset_color
