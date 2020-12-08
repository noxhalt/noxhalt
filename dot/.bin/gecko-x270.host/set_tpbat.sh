#!/usr/bin/env zsh
. ${0:A:h:h}/base.zsh

root_only 1

# Set
tpacpi-bat -s ST 1 60
tpacpi-bat -s ST 2 70
tpacpi-bat -s SP 1 80
tpacpi-bat -s SP 2 90

# Show
tpacpi-bat -g ST 1
tpacpi-bat -g ST 2
tpacpi-bat -g SP 1
tpacpi-bat -g SP 2
