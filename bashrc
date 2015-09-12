# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature
:
# export SYSTEMD_PAGE=

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# User specific aliases and functions

source ~/.bash/prompt.sh
source ~/.bash/path.sh
source ~/.bash/alias.sh

source /usr/local/share/chruby/chruby.sh
chruby 2.2.2

