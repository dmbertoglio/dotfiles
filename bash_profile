function parse_git_branch {
        git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \[\1\]/'
}

function proml {
  tput sgr0
  local        BOLD=$(tput bold)
  local        RESET=$(tput sgr0)

# Colors
  local        BLUE=$(tput setaf 33)
  local        BLACK=$(tput setaf 0)
  local        CYAN=$(tput setaf 37)
  local        GREEN=$(tput setaf 64)
  local        ORANGE=$(tput setaf 166)
  local        PURPLE=$(tput setaf 125)
  local        RED=$(tput setaf 124)
  local        WHITE=$(tput setaf 15)
  local        YELLOW=$(tput setaf 136)

  # if logged in as root
  if [[ "$USER" == "root" ]]; then
    userStyle="\[$BOLD$RED\]"
  else
    userStyle="\[$ORANGE\]"
  fi

  # connected via ssh?
  if [[ "$SSH_TTY" ]]; then
    hostStyle="\[$BOLD$RED\]"
  else
    hostStyle="\[$YELLOW\]"
  fi
  
  # set title to current working directory
  PS1="\[$PURPLE\]\w"

  PS1+="\n"
  PS1+="\[$userStyle\]\u"
  PS1+="\[$RESET$WHITE\]@"
  PS1+="\[$hostStyle\]\h"
  PS1+="\[$RESET$WHITE\]: "
  PS1+="\$(parse_git_branch \"$WHITE on $CYAN\")"
  PS1+="\n"
  PS1+="\[$RESET$WHITE\]\$ \[$RESET\]"
  
  export PS1
}

proml

alias ll='ls -lG'
