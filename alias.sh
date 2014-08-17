#**********************************************************************
#   alias & functions
#**********************************************************************

# ls
alias lrt='ls -lrt'
alias la='ls -A'
alias ll='ls -alF'
alias l='ls -CF'
alias lf='ls -Gl | grep ^d' #Only list directories
alias lsd='ls -Gal | grep ^d' #Only list directories, including hidden ones


# cd
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'

alias vi='vim'
alias gvim='gvim -f 2>/dev/null'


# ssh
alias jqg='ssh jiangqg@10.20.49.116'
alias jinzhy='ssh jinzhy@10.20.49.116'
alias sw='ssh gp_pal@10.20.73.18'

alias rake='noglob rake'

alias c='clear'

alias grep='grep --color=auto'

# screen
alias sc="screen -S"
alias sl="screen -ls"
alias sr="screen -r"

# show which commands you use the most
alias freq='cut -f1 -d" " ~/.bash_history | sort | uniq -c | sort -nr | head -n 30'

# ubuntu system
alias down='sudo shutdown -h now'
alias upgrade='apt-get update && apt-get upgrade && apt-get clean'
alias install='sudo apt-get install'


# find the biggest in a folder
alias ds='du -ks *|sort -n'

# extract archive with different compress formats
extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}


# create a directory and cd in
function mcd() {
  mkdir -p "$1" && cd "$1";
}

# tail with search highlight
t() { 
tail -f $1 | perl -pe "s/$2/\e[1;31;43m$&\e[0m/g"
}
 

# Create a file of $1 MB
cf() {
    upload_file="upload_file.txt"
    mbs=1048576
 
    if [ -n "$2" ]; then
        upload_file="$2"
    fi  
 
    let size=`expr $mbs*$1`;
    dd if=/dev/zero of="$upload_file" bs=$size count=1
}
