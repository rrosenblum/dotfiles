#!/usr/bin/env zsh
#https://wiki.archlinux.org/index.php/zsh
#http://zanshin.net/2013/02/02/zsh-configuration-from-the-ground-up/

autoload -U run-help
autoload run-help-git
autoload run-help-svn
autoload run-help-svk
unalias run-help
alias help=run-help

export HELPDIR=/usr/local/share/zsh/help
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

source ~/.setopts
source ~/.aliases
source ~/.git_completions/git-prompt.sh

#fpath=(/usr/local/share/zsh-completions:~/.git_completions/:$fpath)
fpath=(~/.git_completions $fpath)

export LC_ALL=$LANG
export TERM=xterm-256color
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_21.jdk/Contents/Home
export PROMPT='%n@%m:%~$(__git_ps1 " (%s)")\$ '
export CLICOLOR=1
export GREP_OPTIONS='--color=auto'
export EDITOR=vim

# MacPorts Installer addition on 2012-12-13_at_20:59:13: adding an appropriate PATH variable for use with MacPorts.
#export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/scala/bin:/usr/local/heroku/bin:$PATH
path=(/opt/local/bin /opt/local/sbin /usr/local/scala/bin /usr/local/heroku/bin $path)
# Finished adapting your PATH environment variable for use with MacPorts.

#if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if command -v rbenv > /dev/null; then eval "$(rbenv init -)"; fi

bindkey '^[[3~' delete-char # make delete work
bindkey -e  #emacs
#bindkey -v  #viins
#bindkey -a  #vicmd

autoload -U colors && colors # Enable colors in prompt

autoload -U compinit # Command completion
compinit

zstyle ':completion:*:*:git:*' script ~/.git_completions/git-completion.bash
#zstyle '*' hosts $hosts

autoload -U promptinit # Autoload prompts
promptinit

is_mac() { [[ $OSTYPE == darwin* ]] }
is_freebsd() { [[ $OSTYPE == freebsd* ]] }
is_linux() { [[ $OSTYPE == linux-gnu ]] }
has_brew() { [[ -n ${commands[brew]} ]] }
has_apt() { [[ -n ${commands[apt-get]} ]] }
has_yum() { [[ -n ${commands[yum]} ]] }
