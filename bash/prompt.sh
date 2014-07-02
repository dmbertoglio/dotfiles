#!/bin/bash
# Script to define the bash prompt, isolating it from any other configuration
function prompt {
  tput sgr0
  local bold=$(tput bold)
  local reset=$(tput sgr0)

  # Colors
  local blue=$(tput setaf 33)
  local black=$(tput setaf 0)
  local cyan=$(tput setaf 37)
  local green=$(tput setaf 46)
  local orange=$(tput setaf 202)
  local purple=$(tput setaf 92)
  local red=$(tput setaf 124)
  local white=$(tput setaf 15)
  local yellow=$(tput setaf 226)

  # who's logged in?
  if [[ "$USER" == "root" ]]; then
    userStyle="\[$bold$red\]"
  else
    userStyle="\[$orange\]"
  fi
  
  # how connected?
  if [[ "$SSH_TTY" ]]; then
    hostStyle="\[$bold$red\]"
  else
    hostStyle="\[$yellow\]"
  fi

  PS1="\[$blue\][\A \d] \[$purple\]\w\n\[$userStyle\]\u\[$reset$white\]@\[$hostStyle\]\h\[$reset$white\]: \[$reset$white\]\$ \[$reset\]"
  export PS1
}

prompt
