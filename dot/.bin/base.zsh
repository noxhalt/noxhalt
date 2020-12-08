#!/usr/bin/env zsh

alias -g NUL='>/dev/null 2>&1'
alias -g 1NUL='>/dev/null'
alias -g 2NUL='2>/dev/null'

function echo_err() {
  echo $* >&2
}

function echo_dbg() {
  $DEBUG && echo_err $*
}

function has() {
  type $* NUL
  local laststatus=$?
  if [[ $laststatus -ne 0 ]]; then
    local missing=($(type $*|grep -E "^(${(j:|:)*}) not"|awk '{print $1}'))
    echo_err "missing: ${(j:, :)missing}"
  fi
  return $laststatus
}

function success() {
  return $?
}

function try() {
  YES=${YES:-false}
  MESSAGE=${MESSAGE:-'Retry?'}
  while true; do
    $* && break
    echo -n $MESSAGE
    $YES && echo '(Y/n)' || echo '(y/N)'
    read -n ANS; case $ANS in
      [nN]*) break ;;
      [yY]*) $YES && break ;;
      *) $YES || break ;;
    esac
  done
}

function zshdoc() {
  echo_err "${1}"
  sed -n 's.^#// .  .p' ${1} >&2
}

function root_only() {
  if [[ $EUID -ne 0 ]];then
    echo_err "You must run this as root."
    exit ${1:-1}
  fi
}

has pbcopy  NUL || alias pbcopy='xclip -selection c'
has pbpaste NUL || alias pbpaste='xclip -selection c -o'
