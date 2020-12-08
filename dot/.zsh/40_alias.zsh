# short
alias qq='exit'
alias cls='clear'
alias reload='exec zsh -l'

# cd
alias '..'='cd ..'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias -g .......='../../../../../..'
alias md='(){mkdir -p $*;cd $1}'
alias pd='cd $OLDPWD'

# mv
alias mv='mv -i '
alias zmv='noglob zmv -w'

# ls
alias ls='ls --color=auto -h'
alias la='ls -Al'
alias ll='ls -1'
alias lla='ls -A1'

# others
alias sudo='sudo '
alias curl='curl -C -'
alias grep='grep --color=auto'
alias tree="tree -I '.git'"
alias less='less -g -i -M -R -S -F -z -4 -x 4 -j12 '
alias ip='ip --color=auto '

# package
alias pac-clean='sudo pacman -Rns $(pacman -Qtdq)'
alias pac-lasts='(){expac --timefmt="%Y-%m-%d %T" "%l\t%n" | sort | tail -n ${1:-100}}'

# misc
alias gethub='(){git clone --depth 1 "https://github.com/$1"}'
alias weather='curl -4 wttr.in'
alias bgm="mpv --loop-playlist --no-video "

# date
alias today='date "+%Y-%m-%d"'
alias now='date "+%Y-%m-%d_%H-%M-%S"'

# null
alias -g NUL='>/dev/null 2>&1'
alias -g 1NUL='>/dev/null'
alias -g 2NUL='2>/dev/null'

# enforce
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

# for mac user
has pbcopy  NUL || alias pbcopy='xclip -selection c'
has pbpaste NUL || alias pbpaste='xclip -selection c -o'

# Suffix alias
function runcpp(){g++ -O2 $1; ./a.out; rm ./a.out}
alias -s {c,cpp}=runcpp
alias -s d='rdmd --compiler=ldc '
alias -s go='go run '
alias -s nim='nim c -r '
alias -s jar='java -jar '

# unar
alias -s {zip,zipx,rar,7z,tar,gz,tgz,bz2,tbz,lzma,xz,txz,lzh,sit,sitx,sea,exe,iso,nsi,msi,cab,iso}=unar
# lz4

# tar compress alias
# alias tcvf

# Multimedia
alias -s {png,jpg,webp,bmp,svg}=xdg-open
alias -s {avi,mp4,ts,mkv,webm}=xdg-open
alias -s {pdf,html,md}=xdg-open

# world time
function zonetime() {
  [[ $# -eq 1 ]] \
    && TZ=$1 date \
    || for timezone in $*
    do
      echo "$timezone\t$(TZ=$timezone date)"
    done
  }
compdef _time_zone zonetime

# named time
alias time_epicgames='zonetime US/Eastern'
alias time_google='zonetime US/Pacific'

# chrome
function chrome() { google-chrome-stable $* NUL & }
function ghrome() { chrome --guest $* }

# screen recorder
function fsrec() {
  size=$(xrandr|grep 'Screen'|sed -E 's/.*current ([0-9]+) x ([0-9]+).*/\1x\2/g')
  output="screen_$(date +%Y-%m-%d_%H-%M-%S).mkv"
  ffmpeg \
    -vaapi_device /dev/dri/renderD128 \
    -hwaccel vaapi \
    -hwaccel_output_format vaapi \
    -f x11grab \
    -video_size $size \
    -i :0.0+0,0 \
    -vf 'format=nv12|vaapi,hwupload,scale_vaapi=w=1920:h=1080' \
    -framerate 60 \
    -c:v hevc_vaapi \
    $output
#    -compression_level 0 \
#    -c:a libopus \
#    -b:a 128k \
}

# trash files
function gomi() {     
  gomi_dir=~/.trash/$(today)
  mkdir $gomi_dir -p
  mv $* $gomi_dir
}

# convert to png8
function png8conv() {
  convert $1 \
    +dither \
    -colors 256 \
    -strip \
    png8:${1:t:r}_opt.png
}
