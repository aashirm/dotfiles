PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/texbin:/Users/Aashir/bin
launchctl setenv PATH $PATH

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

export PYTHONSTARTUP=$HOME/.pythonstartup

#[ -z "$PS1" ] && return

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

export HISTSIZE=

export ANDROID_HOME=/usr/local/opt/android-sdk
