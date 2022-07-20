#
# ~/.bashrc
#
export GOPATH=$HOME/go
#source $GOPATH/src/github.com/tomnomnom/gf/gf-completion.bash
export RANGER_LOAD_DEFAULT_RC=false
export USER_AGENT='Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101 Firefox/91.0'
#export USER_AGENT='Mozilla/5.0 (X11; Linux x86_64; rv:86.0) Gecko/20100101 Firefox/86.0'
#export USER_AGENT='Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'
#export USER_AGENT='curl/7.75.0'
#export USER_AGENT='Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101 Firefox/91.0'
#Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; fr; rv:1.9.2.8) Gecko/20100722 Firefox/3.6.8

# enable control-s and control-q in vim
stty -ixon

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Bash prompt ori PS1='[\u@\h \W]\$ '
if [[ $USER == 'd' ]]; then
    PS1='\[\033[01;36m\][\u@\h \W]\[\033[00m\]\$ '
elif [[ $USER == 'h' ]]; then
    PS1='\[\033[01;35m\][\u@\h \W]\[\033[00m\]\$ '
else
    PS1='\[\033[01;31m\][\u@\h \W]\[\033[00m\]\$ '
fi

alias cd..='cd ..;ls -a;printf "\033[0;31m$(pwd)\n"'
alias :q='exit'
alias asource='source $HOME/.bashrc'
alias b="cd $HOME/bash"
alias backup=$HOME/bash/alias/backup.sh
alias c=$HOME/bash/alias/calculator.sh
#alias cd=$HOME/bash/alias/cd.sh
alias check=$HOME/bash/alias/check.sh
alias crypt="$HOME/bash/alias/crypt.sh $@"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias cp='cp -v'
alias diff='diff --color'
alias g="grep -HriaF"
alias gs="grep -HraF"
alias gdl=$HOME/bash/gallery_dl.sh
alias global=$HOME/bash/alias/global.sh
source /tmp/GLOBAL_ENV 2> /dev/null
alias hn="$HOME/bash/alias/hackernews.sh"
alias hold=$HOME/bash/hold.sh
alias ifconfig="echo 'Command deprecated. Use ip address, ip link, ip neigbor or ip route'"
alias j="$HOME/bash/alias/jgnupg.sh"
alias jtc="$HOME/bash/bin/jtc-linux-64.latest"
alias keygen="$HOME/bash/keygen.sh --help && cd $HOME/Bash" #cd $HOME/Bash;./keygen.sh;cd -"
alias lf=$HOME/bash/alias/lf.sh
alias ls='ls -a --color=auto'
alias lynx="proxychains lynx -cfg $HOME/.config/lynx/lynx.cfg -cookies -accept_all_cookies"
#alias m=$HOME/Git/ss/manual.py
alias m="$HOME/bash/mcomix.sh"
alias mpvyv="mpv --volume=100 --profile=pseudo-gui --keep-open $1"
alias mpvnv=$HOME/bash/alias/mpv.sh
alias mv='mv -v'
alias n=$HOME/bash/alias/nitter.sh
alias netstat="ss -at && echo 'ss -at'"
alias oknet="sudo --preserve-env --set-home -g oknet -s"
alias poweroff=$HOME/bash/alias/poweroff.sh
alias recon="proxy=$proxy $HOME/bash/recon.sh $@"
alias rm='rm -v'
alias san=$HOME/bash/san.sh
alias sha="openssl dgst -r -sha3-256"
alias skill='pkill mcomix > /dev/null && echo "Done!" || echo "Problemo!"'
alias stripcolor='sed -r "s/\\[38;5;[0-9]{1,3}m//g"'
alias sublist3r=$HOME/Git/Sublist3r/sublist3r.py
alias tag=$HOME/bash/alias/tag.sh
#alias torbrowser="tor-browser &"
alias torbrowser="sudo -g oknet tor-browser &"
alias oldtorbrowser="$HOME/.local/share/torbrowser_old/tbb/x86_64/tor-browser_en-US/Browser/start-tor-browser &"
alias torchromium='chromium \
--profile-directory="Default" --new-window \
--force-dark-mode \
--force-dark-theme \
--proxy-server="socks5://127.0.0.1:9150" \
--host-resolver-rules="MAP * ~NOTFOUND , EXCLUDE 127.0.0.1" &'
alias proxoid='chromium \
--profile-directory="Profile 1" --new-window &'
#--proxy-server="192.168.43.1:9880" &'
#--host-resolver-rules="MAP * ~NOTFOUND , EXCLUDE 127.0.0.1,192.168.43.1" &'
alias gochromium='chromium --proxy-server="socks5://127.0.0.1:9150" \
    --remote-debugging-port=0 \
    --host-resolver-rules="MAP * ~NOTFOUND , EXCLUDE 127.0.0.1" &
    sleep 3
    echo "global ws://something"'
alias torssh=$HOME/bash/alias/torssh.sh
alias direct="$HOME/bash/alias/torssh.sh direct"
alias tq='touch /tmp/quit'
alias update=$HOME/bash/alias/update.sh
alias wifi="iwctl station wlan0 connect L7"
alias vimprev="VIMENV=prev vim $@"
alias ya='yt-dlp -f bestaudio[ext=webm]'
alias yf='yt-dlp -F'
alias ydl=$HOME/bash/alias/ydl.sh
#alias ydl='youtube-dl -f 247+251'
alias ZZ=exit

function turl(){
    curl -x socks5h://127.0.0.1:9150 --user-agent "$USER_AGENT" $@
}

setdate(){
    sudo su -g oknet -c "curl --insecure -I --resolve duckduckgo.com:443:20.43.161.105 https://duckduckgo.com/ \
        | rg '^date:\s?' -r '' | xargs -I {} date -s {}; hwclock --systohc"
    #sudo date -s "Mon, 14 Dec 2022 08:00:58 GMT" && sudo hwclock --systohc
}
setdatetor(){
    sudo su -g oknet -c "curl -x socks5h://127.0.0.1:9150 --insecure -I --resolve duckduckgo.com:443:20.43.161.105 https://duckduckgo.com/ \
        | rg '^date:\s?' -r '' | xargs -I {} date -s {}; hwclock --systohc"
    #sudo date -s "Mon, 14 Dec 2022 08:00:58 GMT" && sudo hwclock --systohc
}

hh(){
    if [[ $USER == 'h' ]]; then
        chromium \
        --profile-directory="Default" --new-window \
        --proxy-server="socks5://127.0.0.1:9150" \
        --host-resolver-rules="MAP * ~NOTFOUND , EXCLUDE 127.0.0.1" &
    else
        echo 'Err: Access Denied'
    fi
}

keyboard(){
    case $1 in
    off) sudo rmmod atkbd ;;
    on) sudo modprobe atkbd reset=1 ;;
    *) echo "Enter: keyboard off or on"
    esac
}

prox(){
    case $1 in
    4)
        echo "[prox][msg] Tor on L7 via http at 127.0.0.1:7880"
        proxy=https://127.0.0.1:7880
        ;;
    3)
        echo "[prox][msg] Tor on L7 via socks5 at 127.0.0.1:9850"
        proxy=socks5://127.0.0.1:9850
        ;;
    2)
        echo "[prox][msg] Tor socks5 instead of socks5h at 127.0.0.1:9150"
        proxy=socks5://127.0.0.1:9150
        ;;
    1)
        echo "[prox][msg] Proxid at 192.168.43.1:9880"
        proxy=http://192.168.43.1:9880
        ;;
    *)
        echo "[prox][msg] Tor socks5h 127.0.0.1:9150"
        proxy=socks5h://127.0.0.1:9150
        ;;
    esac
    export \
        http_proxy="$proxy" \
        https_proxy=$proxy \
        ftp_proxy=$proxy \
        rsync_proxy=$proxy \
        HTTP_PROXY=$proxy \
        HTTPS_PROXY=$proxy \
        FTP_PROXY=$proxy \
        RSYNC_PROXY=$proxy
        #no_proxy="localhost,127.0.0.1"
}

fix(){
    case $1 in
    ffmpeg) sudo pacman -Udd /var/cache/pacman/pkg/ffmpeg-2:5.0.1-3-x86_64.pkg.tar.zst
        ;;
    remove) sudo pacman -Rdd ffmpeg
        ;;
    *)
        echo "$@"
        ;;
    esac
}

table(){
    case $1 in
    start) sudo systemctl start iptables.service
        sudo systemctl start ip6tables.service
        ;;
    stop) sudo systemctl stop iptables.service
        sudo systemctl stop ip6tables.service
        ;;
    status)
        systemctl status iptables.service
        ;;
    *)
        echo "start stop status"
        ;;
    esac
}

if [[ $PATH != */go/bin* ]]; then
    export PATH="$PATH:$HOME/bin"
    export PATH="$PATH:$HOME/go/bin"
    export PATH="$PATH:$HOME/.local/bin" #this is local user pip install
fi
