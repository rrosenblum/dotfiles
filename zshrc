#!/usr/bin/env zsh
#https://wiki.archlinux.org/index.php/zsh
#http://zanshin.net/2013/02/02/zsh-configuration-from-the-ground-up/

# zmodload zsh/zprof # uncomment to debug performance

autoload -U run-help
autoload run-help-git
autoload run-help-svn
autoload run-help-svk
unalias run-help
alias help=run-help

export HELPDIR=/usr/local/share/zsh/help
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history

source ~/.setopts
source ~/.aliases
source ~/.git_completions/git-prompt.sh

fpath=(~/.git_completions $fpath)

export LC_ALL=$LANG
GIT_PS1_SHOWUPSTREAM=(verbose name)
export PROMPT='%n@%m:%~$(__git_ps1 " (%s)")\$ '
export CLICOLOR=1
export EDITOR=nvim

if [ !is_mac ]; then
  #export PATH=/opt/local/bin:/opt/local/sbin:$PATH
  path=(/usr/local/opt/python/libexec/bin /usr/local/sbin /opt/local/bin /opt/local/sbin $path)
fi

command -v rbenv > /dev/null && eval "$(rbenv init -)"
command -v goenv > /dev/null && eval "$(goenv init -)"
command -v nodenv > /dev/null && eval "$(nodenv init -)"
command -v jenv > /dev/null && eval "$(jenv init -)"

bindkey -e # emacs
# bindkey -v # vi
# set editing-mode vi
bindkey "^[[3~" delete-char
#bindkey -v  #viins
#bindkey -a  #vicmd

autoload -U colors && colors # Enable colors in prompt

autoload -U compinit # Command completion
compinit

#zstyle ':completion:*:*:git:*' script ~/.git_completions/git-completion.bash
#zmodload -i zsh/complist # git-completion alternative. What else does this do?
#zstyle '*' hosts $hosts

autoload -U promptinit # Autoload prompts
promptinit

is_mac() { [[ $OSTYPE == darwin* ]] }
is_freebsd() { [[ $OSTYPE == freebsd* ]] }
is_linux() { [[ $OSTYPE == linux-gnu ]] }
has_brew() { [[ -n ${commands[brew]} ]] }
has_apt() { [[ -n ${commands[apt-get]} ]] }
has_yum() { [[ -n ${commands[yum]} ]] }

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# zprof # uncomment to debug performance
