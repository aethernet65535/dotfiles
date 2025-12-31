#################
### zshconfig ###
#################
#
stty -ixon
export PS1='%~: >' 
export EDITOR=nvim

################
### function ###
################

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

if [ "$TERM" = "xterm-kitty" ]; then
    export TERM=xterm-256color
    printf "\e]11;#2C2A24\a"
fi

##############
### define ###
##############
# path
export PATH_65535="$HOME/Documents/65535"
export WORKSPACE="$PATH_65535/workspace"
export DOTFILES="$WORKSPACE/dotfiles"
export ZSH="$HOME/.zshrc"
export BLOG="$WORKSPACE/blog"
export MIZUKI="$BLOG/mizuki"
export POST="$MIZUKI/src/content/posts"
export LINUX="$WORKSPACE/linux"
export LINUX_KERNEL="$LINUX/kernel"
export LINUX_MAINLINE="$LINUX_KERNEL/linux_mainline"
export LINUX_STABLE="$LINUX_KERNEL/linux_stable"
export ANDROID="$WORKSPACE/android_kernel"
export HYPRLAND="$HOME/.config/hypr"

# lab path
export RCORE="$WORKSPACE/rcore/rCore-Tutorial-v3"
export XV6="$WORKSPACE/docker_xv6_2020"
export MYXV6="$XV6/xv6-2020"
export SOLUTION_XV6="$XV6/xv6-2020"

#############
### ALIAS ###
#############

# Utils
alias reload='source "$ZSH"'

alias __backup='sudo timeshift --check'
alias __update='paru -Syu'
alias update='__backup && __update'
alias update-off='update && poweroff'

alias manle='paccache -ruk0'
alias jdebug='journalctl -b -1 -e'
alias install='paru -S'
alias fdel='paru -Rns'
alias paclog='cat /var/log/pacman.log'
alias laptopmode='~/.config/hypr/workspace_mode/switch_workspace.sh laptop'

# Teleport
alias cdwork='cd $WORKSPACE'
alias cddot='cd $DOTFILES'
alias cdblog='cd $BLOG'
alias cdmizuki='cd $MIZUKI'
alias cdpost='cd $POST'
alias cdlinux='cd $LINUX'
alias cdmain='cd $LINUX_MAINLINE'
alias cdstable='cd $LINUX_STABLE'
alias cduser='cd $LINUX/user'
alias cdandroid='cd $ANDROID'
alias cdztc='cd $ANDROID/ztc_kernel/android_gki_kernel_5.10_common'
alias cdmelt='cd $ANDROID/melt_kernel/android_kernel_xiaomi_marble'
alias cdbusy='cd $WORKSPACE/busybox/busybox-1.37.0'
alias cdman='cd $LINUX_DOC'
alias cdxv6='cd "$XV6"'
alias myxv6='cd "$MYXV6"'
alias cdrcore='cd "$RCORE"'

# NeoVim Teleport
alias elias='$EDITOR "$ZSH"'
alias hconf='$EDITOR $HYPRLAND'
alias nvimconf='$EDITOR ~/.config/nvim/'

# Dev
alias sudonvim='sudo -E $EDITOR'
alias ls1='ls -1'
alias lsl='ls -l'

# systemd-nspawn
alias debianboot='sudo systemd-nspawn -D /mnt/debian --background=40'

# Docker/Podman
alias builddoc='podman build -t xv6-2020-env .'
alias rundoc='podman run -it -p 25000:25000 -v "$PWD/xv6-2020:/xv6-2020" xv6-2020-env'
alias runsol='podman run -it -p 25000:25000 -v "$PWD/xv6-labs-2020:/xv6-2020" xv6-2020-env'

alias busybuild='podman build -t busybox .'
alias busyrun='podman run -it -v "$WORKSPACE/linux/busybox:/busybox" -w /busybox busybox'

alias gnubuild='podman build -t gnulinux .'
alias gnurun='podman run -it -v "$LINUX:/linux" -w /linux gnulinux'

alias workbuild='podman build -t workspace .'
alias workrun='podman run -it -v "$WORKSPACE:/workspace" -w . workspace'

##############
#### BIG #####
##############
alias gnubusy='./run.sh'
alias gnubusyd='./run.sh d'

alias linuxbuild='	export ARCH=x86 &&
			make x86_64_defconfig CC=clang'

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
