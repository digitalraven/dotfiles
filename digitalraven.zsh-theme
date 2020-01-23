# Not sure if this can properly be called a "theme"; it's more a series of helper functions.

# First, set the prompt
precmd() { myprompt; }

# Use terminal-notifier for alerts. iTerm has a built in 'watch' but this function works
# for background processes, and can run multiple times in the same session. 
alert() {
  if [[ ! -e /usr/local/bin/terminal-notifier ]]; then
    echo "Terminal notifier not found"
  fi

  start=$(date +%s)
  command $@
  dur=$(echo "$(date +%s) - $start" | bc)

  terminal-notifier -title "iTerm" -message "Finished: $1 took $dur seconds to run"
}

# Use pygmentize to add syntax highlighting in less
cless() {
  if [[ $# -eq 0 ]]; then
    pygmentize -g -O style=solarized-dark |less -R
  else
    pygmentize -g -O style=solarized-dark "$1" |less -R 
  fi
}

# Prompt, with conditions.
myprompt() {
  local EXIT="$?"
  PS1=""

  # Highlight when we don't have a Kerberos ticket
  if klist -s 2>/dev/null; then
    PS1+=""
  else
    PS1+="%{$fg_bold[magenta]%}✨ KRB✨  %{$reset_color%}"
  fi

  # Indicate last command status with colour and a simple unicode indicator
  if [[ $EXIT != 0 ]]; then
    PS1+="%{$fg_bold[red]%}✘ "
  else
    PS1+="%{$fg[cyan]%}✔ "
  fi

  # Additional indicators for working as root or other user.
  if [[ $UID -eq 0 ]]; then
    # Add lightning bolt and coloured username
    PS1+="⚡️ %{$fg_bold[red]%}"
  elif [[ "$(id -un)" != "$(basename $HOME)" ]]; then
    # Add coloured username
    PS1+="✨ %{$fg_bold[magenta]%}"
  fi

  PS1+="%n%{$reset_color%}@"

  # If we're remote, add the next higher level domain name to the machine name
  if [[ -n "$SSH_CLIENT" ]]; then
    PS1+="%2m"
  else
    PS1+="%m"
  fi

  # Use ~ to indicate home directory in path
  PS1+=":%~"

  # Add appropriate prompt terminator for root/nonroot
  PS1+="%(!.#.$)%{$reset_color%} "
}

# Use zsh on remote hosts where it's available but not default
ssh() {
  command ssh -t $@ "zsh -l"
}

# Use VLC's stream-ripper to take a stream of a radio programme from BOB and render to an MP3.
bobrip() {
  VLCCMD="/Applications/VLC.app/Contents/MacOS/VLC -I rc -v $1 --sout "#transcode{vcodec=none,acodec=mp3,ab=128,channels=2,samplerate=44100}:file{dst=$2}""
  echo VLC Command: $VLCCMD
  $VLCCMD
}
