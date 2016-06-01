#!/bin/bash
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Source other files
source ~/.git-completion.bash

# Set prompt
PS1="[\u \W]\$ "

# Path additions
export PATH=/usr/local/apache-maven-3.3.1/bin:$PATH
export GIT_PROXY_COMMAND=~/bin/git-proxy.sh
#export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH

# User specific aliases and functions
alias ...='cd ../..'
alias ..='cd ..'
alias a='cd && clear'
alias c='clear'
#alias diff='colordiff'
alias grep='grep --color=auto'
alias h='history'
alias k='komodo'
alias kbash='komodo ~/.bashrc'
alias la='ls -laG'
alias ll='ls -lG'
alias ls='ls -G'
alias master='git checkout master'
alias maven='mvn clean generate-sources'
alias p3='python3'
alias p='python'
alias sbash='source ~/.bashrc'

# Handle differences betwen Mac and Linux OS
if [[ $OSTYPE =~ ^darwin ]]; then
    alias fox='open -a "firefox"'
    alias go='open'
    alias komodo='open -a "Komodo Edit 9"'
    alias show='open build/html/index.html'
    alias work='fox && komodo && open -a "mail" && xchat'
    alias xchat='open -a "xchat azure"'
else
    alias fox='firefox'
    alias go='gnome-open'
    alias show='fox build/html/index.html'
    alias work='fox && komodo && xchat'
fi

# bash script aliases
alias backup='~/scripts/bash/backup.sh'
alias branchlist='~/scripts/bash/branchlist.sh'
alias clean='~/scripts/bash/clean.sh'
alias md2rst='~/scripts/bash/md2rst.sh'
alias xml2rst='~/scripts/bash/xml2rst.sh'
alias devstack='~/scripts/bash/devstack/devstack.sh'
alias mailip='~/scripts/bash/mailip.sh'
alias mygit='~/scripts/bash/mygit.sh'
alias newpy='~/scripts/bash/newpy.sh'
alias rackup='~/scripts/bash/rackup.sh'
alias rax='~/scripts/bash/rax.sh'
alias repocheck='~/scripts/bash/repocheck.sh'
alias room='~/scripts/bash/room.sh'
alias stack='~/scripts/bash/stack.sh'
alias tldr='~/scripts/bash/tldr.sh'
alias t='~/scripts/bash/t.sh'
alias up='~/scripts/bash/up.sh'
alias ups='~/scripts/bash/ups.sh'
alias stable='~/scripts/bash/stable.sh'

# python script aliases
alias check='p3 ~/scripts/python/uptime/uptime.py'
alias coms='p3 ~/scripts/python/alias.py'
alias grit='p3 ~/scripts/python/grit/grit.py'
alias linkcheck='p3 ~/scripts/python/linkcheck/linkcheck.py'
alias numerate='p3 ~/scripts/python/numerate/numerate.py'
alias table='p3 ~/scripts/python/table/table.py'
alias zen='p3 ~/code/python/dailyzen/dailyzen.py'
