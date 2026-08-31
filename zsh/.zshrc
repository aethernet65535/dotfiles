# /home/user/.zshrc

# --- Others ---
#
# Which I forgot what they exists.
#
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select

stty -ixon
export EDITOR=nvim

if [ "$TERM" = "xterm-kitty" ]; then
    export TERM=xterm-256color
    printf "\e]11;#2C2A24\a"
fi

# --- virtme-ng ---
#
# for default-like shell output
#
kernel_release=$(uname -r)

if [[ $kernel_release == *virtme ]]; then
    PS1='$ '
else
    PS1='%~: >'
fi

# yy - teleport file path by yazi
#
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# salloc - shell memory allocate function
# Supports raw bytes, or suffixes like M (MiB) and G (GiB)
#
# usage:
#   $ salloc 5000000   (Raw Bytes)
#   $ salloc 256M      (256 MiB)
#   $ salloc 2G        (2 GiB)
#
salloc() {
    local input=${1:-1}
    local bytes=$input

    # Extract the numeric part and the unit suffix
    local num=${input%[gGmM]}
    local unit=${input##[0-9]}

    # Convert based on unit suffix
    if [[ "$unit" =~ ^[mM]$ ]]; then
        bytes=$(( num * 1024 * 1024 ))
    elif [[ "$unit" =~ ^[gG]$ ]]; then
        bytes=$(( num * 1024 * 1024 * 1024 ))
    fi

    echo "Allocating ${bytes} Bytes of cold RSS..."

    # Python script written with clean multiline formatting
    python -c "
    import time
    data = b'\x00' * ($bytes)
    print('Allocation complete. Idle...')
    while True:
        time.sleep(3600)
    "
}

##############
### DEFINE ###
##############

# CCACHE
export PATH="/usr/lib/ccache/bin:$PATH"

# Global
export PATH_65535="$HOME/65535"
export WORKSPACE="$PATH_65535/workspace"
export OSS="$WORKSPACE/oss"
export LAB="$WORKSPACE/lab"

# Env
export DOTFILES="$WORKSPACE/env/dotfiles"
export HYPRLAND="$HOME/.config/hypr"
export ZSH="$HOME/.zshrc"

# Oss
export OSS="$WORKSPACE/oss"
## Linux
export LINUX="$OSS/linux"
export LINUX_KERNEL="$LINUX/kernel"
export LINUX_MAINLINE="$LINUX_KERNEL/linux_mainline"
export LINUX_STABLE="$LINUX_KERNEL/linux_stable"

#############
### ALIAS ###
#############

# Utils
alias reload='source "$ZSH"'

alias __backup='sudo snapper -c root create --description "backup-before-update"'
alias __update='paru -Syu'
alias update='__backup && __update'
alias update-off='update && poweroff'

alias hibernate='sudo systemctl hibernate'

alias install='paru -S'
alias fdel='paru -Rns'
alias paclog='cat /var/log/pacman.log'
alias laptopmode='~/.config/hypr/workspace_mode/switch_workspace.sh laptop'

alias bilidown='yt-dlp --cookies-from-browser firefox'

# Teleport
## Global
alias cdwork='cd $WORKSPACE'
alias cddot='cd $DOTFILES'
## Linux
alias cdlinux='cd $LINUX'
alias cdmain='cd $LINUX_MAINLINE'
alias cdstable='cd $LINUX_STABLE'

# NeoVim Teleport
alias elias='$EDITOR "$ZSH"'
alias hconf='yazi $HYPRLAND'
alias nvimconf='yazi ~/.config/nvim/'

# Dev
alias sudonvim='sudo -E nvim'
alias record='wf-recorder -r 60 -a -g "$(slurp -ro)" --file="$(date +%Y-%m-%d_%H-%M-%S).mkv"'
alias cc='(watch -n 1 "ccache -s") && ccache -z'
alias bmake='bear -- make'
alias whisper-cli='/home/aethernet/65535/workspace/oss/whisper.cpp/build/bin/whisper-cli'
alias hkml-sf='/home/user/65535/workspace/oss/hackermail/hkml patch sashiko_dev --for_forwarding'
alias hkml='/home/user/65535/workspace/oss/hackermail/hkml'
alias damo='sudo /home/user/65535/workspace/oss/damo/damo'
alias masim='/home/user/65535/workspace/oss/masim/masim'

# systemd-nspawn
alias debianboot='sudo systemd-nspawn -D /mnt/debian --background=40'

# Linux
alias linuxbuild='export ARCH=x86 && make x86_64_defconfig'

# Podman
alias docker='podman'

##############
### config ###
##############
# history
HISTFILE=~/.zsh_history
SAVEHIST=10000
HISTSIZE=10000
setopt APPENDHISTORY
setopt SHAREHISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS

###########
### env ###
###########
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

############
### bean ###
############
# vi mode
bindkey -v
export KEYTIMEOUT=1

# cursor beam
cursor_block='\e[2 q'
cursor_beam='\e[6 q'

function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
        echo -ne $cursor_block
    elif [[ ${KEYMAP} == main ]] ||[[ ${KEYMAP} == viins ]] || [[ $1 = 'beam' ]]; then
        echo -ne $cursor_beam
    fi
}

zle-line-init() {
    echo -ne $cursor_beam
}

zle -N zle-keymap-select
zle -N zle-line-init
export PATH="$HOME/.cargo/bin:$PATH"
