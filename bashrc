PATH=/usr/local/git/bin:/Library/Frameworks/Python.framework/Versions/2.7/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/texbin:/Users/Aashir/bin
launchctl setenv PATH $PATH
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

#[ -z "$PS1" ] && return

# Set the Prompt to be more reasonable
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

export HISTSIZE=
