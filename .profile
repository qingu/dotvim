PATH=$PATH:/usr/bin:/etc:/usr/sbin:/usr/ucb:$HOME/bin:/usr/bin/X11:/sbin:/usr/vacpp/bin:/opt/freeware/bin:/opt/freewware/sbin:/usr/local/bin:/usr/local/bin:/usr/lpp/mmfs/bin:.

export PATH

if [ -s "$MAIL" ]           # This is at Shell startup.  In normal
then echo "$MAILMSG"        # operation, the Shell checks
fi                          # periodically.

if [ `basename $SHELL` = "bash" ]
then
export PS1='[\u@\h \w]\$'
else
export PS1="[\$LOGNAME@`hostname` \$PWD]$"
fi

#set -o vi
export WORKDIR=/cma/g3/jinzhy
# Perforce PATH seting
export P4CONFIG=/cma/u/jinzhy/p4config
export PATH=$PATH:/cma/u/app/perforce:/cma/u/app/perforce/bin
export PATH=$PATH:/cma/u/app/totalview/bin
export TVDSVRLAUNCHCMD=ssh
export PATH=$PATH:/cma/u/app/allinea/tools/bin
export PATH=~/bin:$PATH

#vim 7.4 &ctags
export PATH=/cma/g3/jinzhy/jqg/ctags/bin:/cma/g3/jinzhy/jqg/vim74/bin:$PATH



if [ `basename $SHELL` = "ksh" ]; then
   export ENV=$HOME/.kshrc
elif [ `basename $SHELL` = "bash" ]; then
   . $HOME/.bashrc
fi


#export TERM=xterm-color



