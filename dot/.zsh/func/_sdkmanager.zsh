#compdef sdkmanager

function _sdkmanager() {
  local context curcontext=$curcontext state line
  local ret=1

  _arguments -C \
    '--install[install package]' \
    '--uninstall[uninstall package]' \
    '--update[update all package]' \
    '--list[list all package]' \
    '--licence[accept licenses]' \
    '--version[print current version]' \
    '--verbose[enable verbose output]' \
    '--help[print help message]' \
    '*: :->args' && ret=0

  case $state in
    (args)
      case $words[2] in
    (--install)
      _sdkmanager_install && ret=0
      ;;
    esac
    ;;
  esac
  return $ret
}

function _sdkmanager_install() {
  if [[ -z $_packages ]]; then
    _packages=($(sdkmanager --list \
      2>/dev/null |
      sed -n '/^Available/,$p' |
      tail -n +4 |
      sed 's/ \+\([^ ]\+\).*/\1/g'))
  fi
  _describe -t packages "Packages" _packages
}

_sdkmanager "$@"
