#!/bin/bash

source ~/.bash/git-prompt.sh

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

export blue=$(tput setaf 33)
export black=$(tput setaf 0)
export cyan=$(tput setaf 37)
export green=$(tput setaf 46)
export orange=$(tput setaf 202)
export purple=$(tput setaf 92)
export red=$(tput setaf 124)
export white=$(tput setaf 15)
export yellow=$(tput setaf 226)

PS1="\[$green\](\[$orange\]\u\[$white\]@\[$yellow\]\h \[$cyan\]\$(date \"+%a, %d %b %y\")\[$green\])—\${fill}—(\[$purple\]\$newPWD\[$red\]\$(__git_ps1 \" [%s]\")\[$green\])\n\[$green\](\[$blue\]\$(date \"+%H:%M\")\[$green\])\[$white\]\$ "

export PS1


set -o vi

