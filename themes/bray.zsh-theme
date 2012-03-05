
# local time, color coded by last return code
time_enabled="%(?.%{$fg[green]%}.%{$fg[red]%})%*%{$reset_color%}"
time_disabled="%{$fg[green]%}%*%{$reset_color%}"
time=$time_enabled

# Compacted $PWD
#local pwd="%{$fg[blue]%}%~%{$reset_color%}"

#PROMPT='${time} ${user}${host} ${pwd} $(git_prompt_info)'
#PROMPT='${time} ${pwd} $(git_prompt_info)$ '
PROMPT='${time} %{$fg[blue]%}${PWD/#$HOME/~}%{$reset_color%} $(git_prompt_info)$ '

ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%})"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%} %{$fg[yellow]%}?%{$fg[green]%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}"


# elaborate exitcode on the right when >0
return_code_enabled="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
return_code_disabled=
return_code=$return_code_enabled

RPS1='${return_code}'

function accept-line-or-clear-warning () {
  if [[ -z $BUFFER ]]; then
    time=$time_disabled
    return_code=$return_code_disabled
  else
    time=$time_enabled
    return_code=$return_code_enabled
  fi
  zle accept-line
}
zle -N accept-line-or-clear-warning
bindkey '^M' accept-line-or-clear-warning

