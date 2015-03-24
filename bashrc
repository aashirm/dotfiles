PATH=/usr/local/git/bin:/Library/Frameworks/Python.framework/Versions/2.7/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/texbin:/Users/Aashir/Development/Android/platform-tools:/Users/Aashir/Development/Android/tools:/Users/Aashir/bin
launchctl setenv PATH $PATH
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

[ -z "$PS1" ] && return
# Define Color Variables for later usage
c_red=$(tput setaf 1)
c_green=$(tput setaf 2)
c_yellow=$(tput setaf 3)
c_blue=$(tput setaf 4)
c_purple=$(tput setaf 5)
c_cyan=$(tput setaf 6)
c_white=$(tput setaf 7)
c_reset=$(tput sgr1)

# Set the Prompt to be more reasonable
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

export HISTSIZE=

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
