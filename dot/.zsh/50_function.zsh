# docker compose 

DOMP_DIRS=(~/works/docker)
function docd() {
  cd $1
}

function _docd() {
  if [[ $CURRENT == 2 ]]; then
    [[ -z $_domp_cache ]] && _domp_cache=($(
      for dompdir in $DOMP_DIRS; do
        find $dompdir -name 'docker-compose.yml' 2>/dev/null \
          | while read compdir; do
            echo ${compdir:h}
          done
      done
    ))
    _describe -t composes 'Composes' _domp_cache
  fi
}

compdef _docd docd

function fzpak() {
  package=$(
    flatpak list --app | \
      tail -n +1 | \
      fzf +1
    ) && flatpak \
      run \
      $(echo $package \
      | awk '{print $2}')
}

function aur_install() {
  local tmp=$(mktemp -d);
  (
    for item in $*; do
      cd $tmp; mkdir $item; cd $item
      curl -o PKGBUILD "https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=${item}"
      grep '^<!DOCTYPE' PKGBUILD >/dev/null
      [[ $? -eq 0 ]] && {
        echo "Error: Package not found." >&2
        continue
      } || makepkg -si
    done
  )
  rm -r $tmp
}
