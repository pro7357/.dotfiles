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

alias asource='source $HOME/.bashrc'
alias check=$HOME/bash/alias/check.sh
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
alias mv='mv -v'
alias n=$HOME/bash/alias/nitter.sh
alias netstat="ss -at && echo 'ss -at'"
alias poweroff=$HOME/bash/alias/poweroff.sh
alias recon="proxy=$proxy $HOME/bash/recon.sh $@"
alias rm='rm -v'
alias san=$HOME/bash/san.sh
alias sha="openssl dgst -r -sha3-256"
alias skill='pkill mcomix > /dev/null && echo "Done!" || echo "Problemo!"'
alias stripcolor='sed -r "s/\\[38;5;[0-9]{1,3}m//g"'
alias sublist3r=$HOME/Git/Sublist3r/sublist3r.py
alias tag=$HOME/bash/alias/tag.sh
alias torssh=$HOME/bash/alias/torssh.sh
#alias direct="$HOME/bash/alias/torssh.sh direct"
alias tq='touch /tmp/quit'
alias update=$HOME/bash/alias/update.sh
alias vimprev="VIMENV=prev vim $@"
alias ya='yt-dlp -f bestaudio[ext=webm]'
alias yf='yt-dlp -F'
alias ydl=$HOME/bash/alias/ydl.sh
#alias ydl='youtube-dl -f 247+251'
alias ZZ=exit

if [[ $PATH != */go/bin* ]]; then
    export PATH="$PATH:$HOME/bin"
    export PATH="$PATH:$HOME/go/bin"
    export PATH="$PATH:$HOME/.local/bin" #this is local user pip install
fi

if [[ $(ps --no-header --pid=$PPID --format=comm) != "fish" && -z ${BASH_EXECUTION_STRING} ]]; then
	exec fish
elif [[ $USER == 'd' ]]; then
    #PS1='[\u@\h \W]\$ '
    PS1='\[\033[01;36m\][\u@\h \W]\[\033[00m\]\$ '
elif [[ $USER == 'h' ]]; then
    PS1='\[\033[01;35m\][\u@\h \W]\[\033[00m\]\$ '
else
    PS1='\[\033[01;31m\][\u@\h \W]\[\033[00m\]\$ '
fi
