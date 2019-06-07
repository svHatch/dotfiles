# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
# added by Anaconda3 2018.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/home/scott/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/home/scott/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/scott/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/home/scott/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

alias open='xdg-open'
# SVH additions

# SOurce user defined bash completion
# source ~/.bash_completion

# Functions

fnameconv() {
  # cp the file, but with replaced characters that we don't like on Linux
  cp $1 $(echo $1 | sed -e 's/[^A-Za-z0-9._-]/_/g')
}

# pocket-cli bash completions
# source $HOME/.config/pocket-cli-complete.sh

# Add ~/bin to path
export PATH=$HOME/bin/:$PATH

alias open='exo-open'
alias td='$HOME/bin/todo.txt-cli/todo.sh -d $HOME/bin/todo.txt-cli/todo.cfg'
alias tdwp='$HOME/bin/todo.txt-cli/todo.sh -d $HOME/bin/todo.txt-cli/todo.cfg lsp @work "([AC])"'
alias edtd='vim $HOME/Dropbox/todo.txt'
alias bklist='$HOME/bin/todo.txt-cli/todo.sh -d $HOME/Dropbox/.bklist.todo.cfg'
alias fmlist='$HOME/bin/todo.txt-cli/todo.sh -d $HOME/Dropbox/.fmlist.todo.cfg'
alias babylist='$HOME/bin/todo.txt-cli/todo.sh -d $HOME/Dropbox/Private/baby_todo_list/.babylist.todo.cfg'
alias houselist='$HOME/bin/todo.txt-cli/todo.sh -d $HOME/Dropbox/Private/house_todo_list/.houselist.todo.cfg'
export TODOTXT_DEFAULT_ACTION='lsp'
export TODO_SH='$HOME/bin/todo.txt-cli/todo.sh'

alias wist='$HOME/bin/wist/wist.sh'
alias edwist='vim $HOME/Dropbox/wist.txt'

## icsv2ledger
alias icsv2ledger='$HOME/bin/icsv2ledger/icsv2ledger.py --config-file $HOME/.icsv2ledgerrc --ledger-file $HOME/.ledger --mapping-file $HOME/.icsv2ledgerrc-mapping --template-file $HOME/.icsv2ledgerrc-template'

export EDITOR='vim'

alias myproj='vim $HOME/desk/crontiki/MasterProjectList.wiki'

alias zotero='$HOME/bin/Zotero_linux-x86_64/zotero'

alias photorename="exiftool -v3 --ext MOV -ext JPG -ext jpg -ext RAF -r '-FileName<DateTimeOriginal' -d $HOME/lib/photos/negatives/%Y/%Y_%m/%Y%m%d_%%f.%%e ./"
alias photorename_other_photogs="exiftool -v3 --ext MOV -ext JPG -ext jpg -ext RAF -r '-FileName<DateTimeOriginal' -d $HOME/lib/photos/other-photographers/%Y/%Y_%m/%Y%m%d_%%f.%%e ./"
alias videorename="exiftool -v3 -ext MOV -ext mp4 -ext m4v -ext wmv -ext avi -r '-FileName<CreateDate' -d $HOME/lib/movies/%Y/%Y_%m/%Y%m%d_%%f.%%e ./"
alias mkvideosmall="avconv -c:v libx264 -crf 22 -c:a aac -movflags faststart output.mp4"

alias wtr="curl -4 wttr.in/Raglan"

export PYTHONPATH=$PYTHONPATH:/home/scott/qgis_scripts

export RANGER_LOAD_DEFAULT_RC='FALSE'

alias aptitudeman='open /usr/share/doc/aptitude/html/en/index.html'

alias getprivate='ecryptfs-mount-private'
alias exitprivate='ecryptfs-umount-private'

alias crontiki='vim ~/desk/crontiki/index.wiki'

# Ledger aliases
alias edledger='vim ~/lib/finance/ledger/2018.lgr'
alias ledger='ledger --strict'


alias vimcfg='vim ~/.vimrc'
alias bashcfg='vim ~/.bashrc'
alias resourcecfg='vim ~/.Xresources'

alias bat='upower -i /org/freedesktop/UPower/devices/battery_BAT0'
alias heat='watch -n 1 -d sensors'

alias workread='pockyt get -n 1 -s unread -t work -o browser | pockyt mod -a 1 -i redirect'

alias ph_amazon='$HOME/ph/aws/amazon.sh'

alias scr_right='xrandr --output VGA1 --right-of LVDS1'

alias persiki='vim $HOME/desk/ph/doc/persiki/index.wiki'

alias jb01start='bash $HOME/desk/projects/ph/aws/amazon.sh start'
alias jb01stop='bash $HOME/desk/projects/ph/aws/amazon.sh stop'
alias jb01resume='bash $HOME/desk/projects/ph/aws/amazon.sh resume'
alias jb01ip='bash $HOME/desk/projects/ph/aws/amazon.sh getip'

alias win04start='bash $HOME/desk/projects/ph/aws/amazon_win4.sh start'
alias win04stop='bash $HOME/desk/projects/ph/aws/amazon_win4.sh stop'
alias win04resume='bash $HOME/desk/projects/ph/aws/amazon_win4.sh resume'

# LasZip environment variables
export LD_LIBRARY_PATH="/usr/local/lib:$LD_LIBRARY_PATH"
#export PATH="/opt/source/laszip-2.1.0/build/bin:$PATH"

alias deadlines="remind -f $HOME/.remind/deadlines.rem"
alias rem="remind -f $HOME/.reminders"

alias py_da="open /home/scott/lib/books/Michael Diener/Python Geospatial Analysis Cookbook (740)/Python Geospatial Analysis Cookbook - Michael Diener.pdf"

function gdal_size() {
    SIZE=$(gdalinfo $1 |\
        grep 'Size is ' |\
        cut -d\   -f3-4 |\
        sed 's/,//g')
    echo -n "$SIZE"
}

# TigerVPN alias
alias vpnup='sudo /usr/sbin/openvpn --config "/home/scott/set/install/tigerVPN/config/US - New York @tigervpn.com.ovpn" --auth-user-pass ~/set/install/tigerVPN/up.txt'

# PHawk shortcuts
alias sytplan='libreoffice "$HOME/desk/projects/ph/syngenta/Syngenta 2016 US_FDS Request_#0001517_20160513_INTERNAL.xlsx"'

# newsbeuter aliases
alias newsbeuter='newsbeuter -r'
alias work_news='newsbeuter -r -u ~/.newsbeuter/urls_work'

# Cheatsheet colours
export CHEATCOLORS=true

# Terminal env variable to set preferred terminal
export TERMINAL=mrxvt

# use rifle as the file opener
alias open='rifle'

# When opening feh, keep the viewport zoom as default
alias feh='feh --keep-zoom-vp'

# Alias to see my weekly assignments

# Alias to edit my work hours for the week
alias hrs='vim $HOME/desk/ph/hrs.md'

# Use Ghostscript to vastly reduce the size of a pdf file from the command line
alias reducepdf='gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=setting -sOutputFile=output.pdf'
# replace "setting" with: /screen, /ebook, /printer, /prepress

alias scp_hog='scp shatcher@172.30.0.225'

# Tab completion for the gist CLI
#source /usr/local/share/gist/gist.bash

# Install Ruby Gems to ~/gems
export GEM_HOME=$HOME/gems
export PATH=$HOME/gems/bin:$PATH

# Make abook use my addressbook file
alias abook='abook --datafile ~/lib/addressbook/addressbook'

alias open='xdg-open'
