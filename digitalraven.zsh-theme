# Prompt based on my bash prompt

precmd() { myprompt; }

myprompt() {
  local EXIT="$?"
  PS1=""

  if [[ $EXIT != 0 ]]; then
    PS1+="%{$fg_bold[red]%}✘ "
  else
    PS1+="%{$fg[cyan]%}✔ "
  fi

  if [[ $UID -eq 0 ]]; then
    # Add lightning bolt and red username
    PS1+="⚡️ %{$fg_bold[red]%}"
  fi

  PS1+="%n%{$reset_color%}@"
  
  if [[ -n "$SSH_CLIENT" ]]; then
    PS1+="%2m"
  else
    PS1+="%m"
  fi

  PS1+=":%~%(!.#.$) "
}