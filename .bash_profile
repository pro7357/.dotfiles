#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ -z $DISPLAY ]]; then # && "$XDG_VTNR" -eq 1 ]]; then
    exec startx
fi
