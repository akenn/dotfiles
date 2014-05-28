#!/bin/bash

# Aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias http="http"
alias slime='open -a "Sublime Text 2"'
alias vi="vim"
alias :q="exit"
alias :Q="exit"
alias lsal="cat ~/.aliases | grep alias"
alias lsfun="cat ~/.aliases | grep function; cat ~/.functions | grep function"
alias s="ls" # ;s
alias ks="ls" # I mistype ls often
alias sl="ls"
alias fucking="sudo"
alias fuck="sudo" # fuck !! > fucking !!
alias please="sudo"
alias diff='vim -d'
alias roll='curl -L http://bit.ly/10hA8iC | bash'
alias tmux='tmux -2' # fix for tmux with 256 colors in ubuntu
alias t='tmux'
alias ta='tmux attach'
alias gitm='git pull origin master'
alias 'ps?'='ps ax | grep '
function readme() {
  readmefile="${1:-README.md}"
  pandoc -s -f markdown -t man "$readmefile" | groff -T utf8 -man | less
}

alias makegist="pbpaste | gist | pbcopy"
alias makepate="pbpaste | pastebin -f - | pbcopy"
alias xclip="xclip -selection c"

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
  colorflag="--color"
else # OS X `ls`
  colorflag="-G"
fi

# Get chmod value of a file
alias chmod-get='stat --format "%a"'

# List all files colorized in long format
alias l="ls -l ${colorflag}"
alias ls="ls ${colorflag}"

# List all files colorized in long format, including dot files
alias la="ls -lptra ${colorflag}"


# List only directories
alias lsd='ls -l | grep "^d"'

# `cat` with beautiful colors. requires Pygments installed.
#                  sudo easy_install Pygments
alias c='pygmentize -O style=monokai -f console256 -g'

# git
alias github="open https://github.com"

# YOLO
alias yolo="git add -A && git commit -am '#YOLO' && git push origin master"

# Django
alias django-new="django-admin.py startproject"
alias django-start="python manage.py runserver"

# Gource
alias gourcedef="gource -1280x720 --time-scale 3.0 --seconds-per-day 1 -o - | ffmpeg -y -r 60 -f image2pipe -vcodec ppm -i - -vcodec libx264 -preset ultrafast -pix_fmt yuv420p -crf 1 -threads 0 -bf 0 gource.mp4"

# IP addresses
function localip() {
  IP=`ipconfig getifaddr en0`
  if [ "$IP" = "" ]; then IP=`ipconfig getifaddr en1`; fi
  echo "$IP"
}
alias globalip="curl ifconfig.me"
alias externalip="globalip"
alias gateway="route -n get default | sed -n 4p | cut -c14-"
alias whois="whois -h whois-servers.net"

alias arp-local="arp-scan --interface=en0 --localnet"
alias arp-local2="arp-scan --interface=en0 192.168.1.1/24"

# Flush Directory Service cache
alias dnsflush="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"

# MAC Address
alias getmac="ifconfig en0 | grep ether | cut -c8-"
alias genmac="openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//'"
function setmac() {
	sudo ifconfig en0 ether "$1"
}

# View HTTP traffic
alias sniff="sudo ngrep -d 'en0' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en0 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# iOS simulator
alias simulator='open /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app'


# redis
alias redis-start="redis-server /usr/local/etc/redis.conf"