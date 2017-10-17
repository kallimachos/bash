#!/bin/bash
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Set prompt
PS1="[\u \W]\$ "

# Path additions
# export PATH=/usr/local/apache-maven-3.3.1/bin:$PATH
# export PATH=/opt/Komodo-Edit-9/bin:$PATH
# export PATH=/opt/Komodo-Edit-10/bin:$PATH
# export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
# export PATH=/home/bmoss/.local/bin:$PATH

# Set Tidy config file
# export HTML_TIDY=/home/bmoss/.tidy

# Source git completion
. /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash

# User specific aliases and functions
alias ...='cd ../..'
alias ..='cd ..'
alias a='cd && clear'
alias c='clear'
alias diff='colordiff'
alias grep='grep --color=auto'
alias h='history'
alias k='komodo'
alias kbash='komodo ~/.bashrc'
alias la='ls -laG'
alias ll='ls -lG'
alias master='git checkout master'
alias p='python'
alias p3='python3'
alias pm='ps -A | grep mongo'
alias sbash='source ~/.bashrc'
alias v='vagrant'
alias yak='yakstack'

# Handle differences between Mac and Linux OS
if [[ $OSTYPE =~ ^darwin ]]; then
    alias fox='open -a "firefox"'
    alias go='open'
    alias komodo='open -a "Komodo Edit 10"'
    alias ls='ls -G'
    alias music='open -a "itunes"'
    alias slack='open -a "slack"'
    alias typora='open -a "typora"'
    alias work='fox && komodo && slack'
    alias xchat='open -a "xchat azure"'
else
    alias bs='setsid /opt/battlescribe/RosterEditor.sh >/dev/null 2>&1'
    alias calibre='setsid calibre >/dev/null 2>&1'
    alias fin='up && backup && shutdown now'
    alias fox='setsid firefox >/dev/null 2>&1'
    alias go='gnome-open'
    alias hattrick='setsid bash -x ~/hattrick/HO.sh >/dev/null 2>&1'
    alias kbash='setsid komodo ~/.bashrc >/dev/null 2>&1'
    alias kol='setsid java -jar /opt/KoLmafia-17.4.jar >/dev/null 2>&1'
    alias komodo='setsid komodo >/dev/null 2>&1'
    alias ls='ls -G --color=auto'
    alias shutter='setsid shutter >/dev/null 2>&1'
    alias synergy='setsid synergy >/dev/null 2>&1'
    alias music='setsid vlc >/dev/null 2>&1'
    alias work='synergy && fox && komodo && xchat'
    alias xchat='setsid xchat >/dev/null 2>&1'
fi

# bash script aliases
alias backup='~/scripts/bash/backup.sh'
alias bump='~/scripts/bash/bump.sh'
alias branchlist='~/scripts/bash/branchlist.sh'
alias clean='~/scripts/bash/clean.sh'
alias kickstack='~/scripts/bash/kickstack/kickstack.sh'
alias md2rst='~/scripts/bash/md2rst.sh'
alias xml2rst='~/scripts/bash/xml2rst.sh'
alias mygit='~/scripts/bash/mygit.sh'
alias newpy='~/scripts/bash/newpy.sh'
alias rackstack='~/scripts/bash/rackstack/rackstack.sh'
alias mup='~/scripts/bash/mup.sh'
alias repocheck='~/scripts/bash/repocheck.sh'
alias room='~/scripts/bash/room.sh'
alias stack='~/scripts/bash/stack.sh'
alias t='~/scripts/bash/t.sh'
alias up='~/scripts/bash/up.sh'
alias ups='~/scripts/bash/ups.sh'
alias stable='~/scripts/bash/stable.sh'
alias swap='~/scripts/bash/swap.sh'

# python script aliases
alias bugs='p3 ~/scripts/python/scripts/bugs.py'
alias check='p3 ~/scripts/python/scripts/uptime.py'
alias grit='p3 ~/scripts/python/scripts/grit.py'
alias linkcheck='p3 ~/scripts/python/scripts/linkcheck.py'
alias table='p3 ~/scripts/python/scripts/table.py'
alias zen='p3 ~/code/python/dailyzen/dailyzen.py'

# added by travis gem
[ -f /Users/bmoss/.travis/travis.sh ] && source /Users/bmoss/.travis/travis.sh
