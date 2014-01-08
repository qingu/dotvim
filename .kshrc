########################################################

# set emacs-mode in command line
case $- in
  *i*)  #interactive ksh
  #This stuff lets the arrow keys work in an xterm...
  set -o emacs
  alias __A=`echo "\020"`   #set up arrow key
  alias __B=`echo "\016"`   #set down arrow key
  alias __C=`echo "\006"`   #set right arrow key
  alias __D=`echo "\002"`   #set left arrow key
  #alias __H=`echo "\001"`   #Home
  alias __H=
  alias __F=            #End
esac

#customize alias
alias l='ls -la'
alias la='ls -lA'
alias ls='ls -F'
alias ll='ls -l'
alias sl=ls

alias cdgu='cd /cma/g3/jinzhy/jqg'
alias ..='cd ..'
alias ...='cd ../../'
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'

alias mv='mv -i'
alias md='mkdir -p'
alias vi='vim'
alias tailf='tail -f'
alias r='fc -e -'     #repeat the last command

#job manager alias
alias llj='llq -u jinzhy'  #query my queue
alias llg='llsubmit grapes.cmd'   #submit grapes job
alias llk="llcancel `llq -u jinzhy|grep jinzhy|awk '{print $1}'`"  #cancel job



