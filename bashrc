# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

PS1="\u@\h:\w\\$ "

if [[ $UID -eq 0 ]]; then
  PS1='\[\033[1;31m\]\u@\h:\w\$\[\033[0m\] '
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias vi='vim'
alias ll='ls -alF'
alias la='ls -A'
alias lr='ls -lrt'
alias l='ls -CF'
alias dwim='sudo'
alias ffs='sudo '
alias rdesktop='rdesktop -g 94% -PKD'
export EDITOR=vim
export VISUAL="/usr/local/bin/mate -w"
export PATH="/bin:/sbin:/usr/local/bin:/usr/local/etc:/usr/bin:/usr/local/share/etc:/usr/etc:$PATH:$HOME/bin/$ARCHOS:$HOME/bin/share:/usr/local/bin:/usr/local/share/bin:/usr/local/pack/X11/bin:/usr/local/bin/X11:/usr/dt/bin:$OPENWINHOME/bin:/home/forte_6/SUNWspro/bin:/usr/ccs/bin:/bin:/usr/bin:/usr/hosts:/usr/ucb:/usr/NX/bin":/usr/sbin


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
export LD_LIBRARY_PATH=/usr/local/lib:
export ONE_AUTH=/var/lib/one/.one/one_auth
