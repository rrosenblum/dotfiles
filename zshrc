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

source ~/.aliases
source ~/mvnColor
source ~/.git_completions/git-prompt.sh
source ~/.colors.zsh

#fpath=(/usr/local/share/zsh-completions:~/.git_completions/:$fpath)
#fpath=(~/.git_completions $fpath)

export LC_ALL=$LANG
export TERM=xterm-256color
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_21.jdk/Contents/Home
export PROMPT='%n@%m:%~$(__git_ps1 " (%s)")\$ '
export CLICOLOR=1
export GREP_OPTIONS='--color=auto'

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

setopt notify globdots correct pushdtohome cdablevars autolist
setopt recexact longlistjobs
setopt HIST_IGNORE_DUPS
setopt prompt_subst # Enable parameter expansion, command substitution, and arithmetic expansion in the prompt
setopt nohashdirs
setopt no_beep # don't beep on error
setopt auto_cd # If you type foo, and it isn't a command, and it is a directory in your cdpath, go there
setopt pushd_ignore_dups # don't push multiple copies of the same directory onto the directory stack
# setopt extended_glob # treat #, ~, and ^ as part of patterns for filename generation

setopt append_history # Allow multiple terminal sessions to all append to one zsh command history
setopt extended_history # save timestamp of command and duration
setopt inc_append_history # Add comamnds as they are typed, don't wait until shell exit
setopt hist_expire_dups_first # when trimming history, lose oldest duplicates first
setopt hist_ignore_dups # Do not write events to history that are duplicates of previous events
setopt hist_ignore_space # remove command line from history list when first character on the line is a space
setopt hist_reduce_blanks # Remove extra blanks from each command line being added to history
#setopt hist_find_no_dups # When searching history don't display results already cycled through twice
#setopt hist_verify # don't execute, just expand history
setopt share_history # imports new commands and appends typed commands to history

autoload -U colors && colors # Enable colors in prompt

autoload -U compinit # Command completion
compinit

zstyle ':completion:*:*:git:*' script ~/.git_completions/git-completion.bash
#zstyle '*' hosts $hosts

autoload -U promptinit # Autoload prompts
promptinit
