# Use colors in coreutils utilities output
alias ls='ls --color=auto'
alias grep='grep --color'

# ls aliases
alias ll='ls -lah'
alias la='ls -A'

# Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'

# git related aliases
alias gag='git exec ag'

# Update dotfiles
dfu() {
   (
       cd ~/git/dotfiles && git pull --ff-only && ./install.sh -q
   )
}

# Use pip without requiring virtualenv
#syspip3() {
#    PIP_REQUIRE_VIRTUALENV="" pip3 "$@"
#}

# cd to git root directory
alias cdgr='cd "$(git root)"'

# Create a directory and cd into it
mcd() {
    mkdir "${1}" && cd "${1}"
}

# Jump to directory containing file
jump() {
    cd "$(dirname ${1})"
}

# cd replacement for screen to track cwd (like tmux)
scr_cd()
{
    builtin cd $1
    screen -X chdir "$PWD"
}

if [[ -n $STY ]]; then
    alias cd=scr_cd
fi

# Go up [n] directories
up()
{
    local cdir="$(pwd)"
    if [[ "${1}" == "" ]]; then
        cdir="$(dirname "${cdir}")"
    elif ! [[ "${1}" =~ ^[0-9]+$ ]]; then
        echo "Error: argument must be a number"
    elif ! [[ "${1}" -gt "0" ]]; then
        echo "Error: argument must be positive"
    else
        for ((i=0; i<${1}; i++)); do
            local ncdir="$(dirname "${cdir}")"
            if [[ "${cdir}" == "${ncdir}" ]]; then
                break
            else
                cdir="${ncdir}"
            fi
        done
    fi
    cd "${cdir}"
}

# Execute a command in a specific directory
xin() {
    (
        cd "${1}" && shift && "${@}"
    )
}

# Check if a file contains non-ascii characters
nonascii() {
    LC_ALL=C grep -n '[^[:print:][:space:]]' "${1}"
}

# Connect robot Lara5 to main master
alias connect-lara='export ROS_MASTER_URI=http://192.168.2.13:11311 ;
export ROS_IP=`ip route get 192.168.2.13 | awk '"'"'{print $5;
exit}'"'"'` ; echo "ROS_MASTER_URI and ROS_IP set to " ; 
printenv ROS_MASTER_URI ; printenv ROS_IP'

# Useful Git aliases:
alias git-log-all='git log --oneline --graph --decorate'

alias git-pull-submodules='git pull;
git submodule update --init --recursive;
git submodule update --remote --recursive;
git commit -am "pulled changes in submodules";
git push;
'

# Enable sudo-less docker commands
alias enable-docker='sudo groupadd docker; sudo gpasswd -a $USER docker; newgrp docker'

# Change keyboard layout to US
alias us-keyboard="setxkbmap us"