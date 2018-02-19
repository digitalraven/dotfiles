# Prompt based on my bash prompt

precmd() { myprompt; }

alert() {
  if [[ ! -d /Applications/terminal-notifier.app ]]; then
    echo "Terminal notifier not found"
  fi

  start=$(date +%s)
  command $@
  dur=$(echo "$(date +%s) - $start" | bc)

  terminal-notifier -title "iTerm" -message "Command $@ took $dur seconds to run"
}

myprompt() {
  local EXIT="$?"
  PS1=""

  if klist -s 2>/dev/null; then
    PS1+=""
  else
    PS1+="%{$fg_bold[magenta]%}✨ KRB✨  %{$reset_color%}"
  fi

  if [[ $EXIT != 0 ]]; then
    PS1+="%{$fg_bold[red]%}✘ "
  else
    PS1+="%{$fg[cyan]%}✔ "
  fi

  if [[ $UID -eq 0 ]]; then
    # Add lightning bolt and red username
    PS1+="⚡️ %{$fg_bold[red]%}"
  elif [[ "$(id -un)" != "$(basename $HOME)" ]]; then
    # Add colored username
    PS1+="✨ %{$fg_bold[magenta]%}"
  fi

  PS1+="%n%{$reset_color%}@"

  if [[ -n "$SSH_CLIENT" ]]; then
    PS1+="%2m"
  else
    PS1+="%m"
  fi

  PS1+=":%~"

  if [[ -n "$VIRTUAL_ENV" ]]; then
    RPROMPT="%{$fg_bold[magenta]%}✨ `basename \"$VIRTUAL_ENV\"`✨ %{$reset_color%}"
    PS1+="%{$fg_bold[magenta]%}"
  fi

  PS1+="%(!.#.$)%{$reset_color%} "
}

ssh() {

  command ssh -t $@ "zsh -l"
}
