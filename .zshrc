# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="gentoo"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#export PATH=$PATH:/opt/intel/composer_xe_2011_sp1.8.273/bin/ia32:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/metman/.rvm/bin:/opt/intel/composer_xe_2011_sp1.8.273/mpirt/bin/ia32

#export PATH=/home/metman/bin:/home/metman/anaconda/bin:$PATH
export PATH=/home/metman/anaconda/bin:$PATH

export GEOS_DIR=/home/metman/GEOS

#intel compiler
source /opt/intel/bin/compilervars.sh intel64
#customize alias
alias vi='vim'
alias rake='noglob rake'
alias down='sudo shutdown -h now'
#alias -s pdf=evince
alias -s pdf=okular
alias -s mobi=okular
alias gvim='gvim -f 2>/dev/null'

# ssh uranus
alias uranus='ssh jinzhy@10.20.49.116'
alias jinzhy='sshfs -o cache=yes -o workaround=rename -o allow_other -o uid=1020902 -o gid=10209 jinzhy@10.20.49.131:/cma/g3/jinzhy/jqg/GRAPES/GRAPES/SRC ~/research'


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 
