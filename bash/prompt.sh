#!/bin/bash

source ~/.bash/git-prompt.sh

export GIT_PS1_SHOWDIRTYSTATE=1

function prompt {
  newPWD="${PWD}"
  user="whoami"
  host=$(echo -n $HOSTNAME | sed -e "s/[\.].*//")
  git_branch=$(__git_ps1 " [%s]")

  let promptsize=$(echo -n "($user@$host ddd., DD mmm YY)(${PWD}${git_branch})" | wc -c | tr -d " ")
  let fillsize=${COLUMNS}-${promptsize}
  fill=""
  while [ "$fillsize" -gt "0" ]
  do
    fill="${fill}—"
    let fillsize=${fillsize}-1
  done
  if [ "$fillsize" -lt "0" ]
  then
    let cutt=3-${fillsize}
    newPWD="...$(echo -n $PWD | sed -e "s/\(^.\{$cutt\}\)\(.*\)/\2/")"
  fi
}

PROMPT_COMMAND=prompt

export base03=$(tput setaf 234)
export base02=$(tput setaf 235)
export base01=$(tput setaf 240)
export base00=$(tput setaf 241)
export base0=$(tput setaf 244)
export base1=$(tput setaf 245)
export base2=$(tput setaf 254)
export base3=$(tput setaf 230)
export yellow=$(tput setaf 136)
export orange=$(tput setaf 166)
export red=$(tput setaf 160)
export magenta=$(tput setaf 125)
export violet=$(tput setaf 61)
export blue=$(tput setaf 33)
export cyan=$(tput setaf 37)
export green=$(tput setaf 64)

PS1="\[$yellow\](\[$orange\]\u\[$base1\]@\[$violet\]\h \[$blue\]\$(date \"+%a, %d %b %y\")\[$yellow\])—\${fill}—(\[$magenta\]\$newPWD\[$green\]\$(__git_ps1 \" [%s]\")\[$yellow\])\n\[$yellow\](\[$blue\]\$(date \"+%H:%M\")\[$yellow\])\[$base1\]\$ "

export PS1


set -o vi

