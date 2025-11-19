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

##############
### define ###
##############
# path
export WAVE="/home/aethernet"
export PATH_65535="$WAVE/Documents/65535"
export WORKSPACE="$PATH_65535/workspace"
export DOTFILES="$PATH_65535/dotfile"
export ZSH="$WAVE/.zshrc"
export CONFIG_NVIM="$WAVE/.config/nvim"
export XV6="$WORKSPACE/docker_xv6_2020"
export MYXV6="$XV6/xv6-2020"
export SOLUTION_XV6="$XV6/xv6-2020"
export BLOG="$WORKSPACE/blog"
export MIZUKI="$BLOG/mizuki"
export POST="$MIZUKI/src/content/posts"
export LINUX="$WORKSPACE/linux"
export LINUX_DOC="$PATH_65535/book/linux_documentation"
export ANDROID="$WORKSPACE/android_kernel"
export HYPRLAND="$WAVE/.config/hypr"
export RCORE="$WORKSPACE/rcore/rCore-Tutorial-v3"

#############
### alias ###
#############
# utils
alias elias='nvim "$ZSH"'
alias reload='source "$ZSH"'
alias update='sudo timeshift --check && paru -Syu'
alias editnvim='cd "$CONFIG_NVIM"'
alias manle='paccache -ruk0'
alias hconf='nvim $HYPRLAND'
alias jodebug='journalctl -b -1 -e'
alias install='paru -S'
alias fdel='paru -Rns'
alias pmlg='cat /var/log/pacman.log'
alias laptopmode='~/.config/hypr/workspace_mode/switch_workspace.sh laptop'

# study
alias cdwork='cd $WORKSPACE'
alias cdblog='cd $BLOG'
alias cdmizuki='cd $MIZUKI'
alias cdpost='cd $POST'
alias cdlinux='cd $LINUX'
alias cdread='cd $LINUX/linux_source_code'
alias cdman='cd $LINUX_DOC'
alias cdxv6='cd "$XV6"'
alias myxv6='cd "$MYXV6"'
alias cdrcore='cd "$RCORE"'

# dev
alias sudonvim='sudo -E nvim'
alias ls1='ls -1'
alias lsl='ls -l'
# docker/podman
alias docker='podman'

alias builddoc='podman build -t xv6-2020-env .'
alias rundoc='podman run -it -p 25000:25000 -v "$PWD/xv6-2020:/xv6-2020" xv6-2020-env'
alias runsol='podman run -it -p 25000:25000 -v "$PWD/xv6-labs-2020:/xv6-2020" xv6-2020-env'

alias androidbuild='podman build -t android .'
alias androidrun='podman run -it -v "/home/aethernet/Documents/65535/workspace/android_kernel:/android_kernel" -w /android_kernel android'

alias busybuild='podman build -t busybox .'
alias busyrun='podman run -it -v "$WORKSPACE/linux/busybox:/busybox" -w /busybox busybox'

alias gnubuild='podman build -t gnulinux .'
alias gnurun='podman run -it -v "$LINUX/podman:/podman" -w /podman gnulinux'

alias driverbuild='podman build -t driver .'
alias driverrun='podman run -it -v "$WORKSPACE/linux/modules/driver:/driver" -w . driver'

# zola
alias zolabuild='zola build --force --output-dir "$BLOG/docs"'
# gcc
alias kawaii='cd /home/Documents/65535/dotfile/kawaii-gcc/'
alias gcctran='msgfmt ~/Documents/65535/dotfile/kawaii-gcc/src/zh_CN-kawaii-patch.po -o ~/Documents/65535/dotfile/kawaii-gcc/gcc.mo && sudo cp ~/Documents/65535/dotfile/kawaii-gcc/gcc.mo /usr/share/locale/en/LC_MESSAGES/gcc.mo'

##############
#### BIG #####
##############
alias gnubusyd='sudo qemu-system-x86_64 \
	-m 4G \
	-kernel /home/aethernet/Documents/65535/workspace/linux/linux_source_code/arch/x86_64/boot/bzImage \
	-initrd rootfs.img.gz \
	-append "root=/dev/ram init=/linuxrc console=ttyS0 page_alloc.shuffle=1 nokaslr" \
	-serial mon:stdio -nographic \
	-s -S'
alias gnubusy=' ./build.sh &&
	sudo qemu-system-x86_64 \
	-smp 1 \
	-m 4G \
	-kernel /home/aethernet/Documents/65535/workspace/linux/linux_source_code/arch/x86_64/boot/bzImage \
	-initrd rootfs.img.gz \
	-append "root=/dev/ram init=/linuxrc console=ttyS0 page_alloc.shuffle=1" \
	-serial mon:stdio -nographic'

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

###########
### env ###
###########
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
