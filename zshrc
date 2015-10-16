# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="digitalraven"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git osx)

# User configuration

export PATH="/bin:/sbin:/usr/local/bin:/usr/local/etc:/usr/bin:/usr/local/share/etc:/usr/etc:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/MacGPG2/bin:/usr/local/munki:$HOME/bin:$HOME/bin/share:/usr/local/bin:/usr/local/share/bin:/usr/local/pack/X11/bin:/usr/local/bin/X11:/usr/dt/bin:/bin:/home/forte_6/SUNWspro/bin:/usr/ccs/bin:/bin:/usr/bin:/usr/hosts:/usr/ucb:/usr/NX/bin:/usr/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

if [[ -n "$VIRTUAL_ENV" ]]; then
  export PATH="$VIRTUAL_ENV/bin:$PATH"
fi

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

if [[ -f '/usr/local/share/etc/dir' ]]; then
  alias dir="/usr/local/share/etc/dir"
fi

alias ls="ls -G"
alias ll="ls -AlhF"
alias la="ls -A"
alias lr="ls -lAhrt"
alias ffs='sudo $(fc -ln -1)'
alias rdesktop="rdesktop -g 94% -PKD"
alias vi='vim'
alias kinit="kinit swilso11@EASE.ED.AC.UK"
alias emacs='vim'
export EDITOR=vim
export VISUAL=vim
export LD_LIBRARY_PATH=/usr/local/lib:
export ONE_AUTH=/var/lib/.one/one_auth
setopt hist_ignore_all_dups
setopt hist_ignore_space
