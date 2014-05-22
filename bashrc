source ~/.aliases
source ~/mvnColor

export LC_ALL=$LANG

for file in /usr/local/etc/bash_completion.d/*; do
  # Do not load ag.bashcomp.sh. It has a dependency on bash-completion that causes it to not work
  # https://github.com/Homebrew/homebrew/issues/27418
  if [ "$file" != "/usr/local/etc/bash_completion.d/ag.bashcomp.sh" ]; then
    source "$file";
  fi
done

#source /Users/rrosenblum/Library/Python/2.7/lib/python/site-packages/powerline/bindings/bash/powerline.sh

export PS1='[\u@\h \w$(__git_ps1 " (%s)")]\$ '
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_21.jdk/Contents/Home

# MacPorts Installer addition on 2012-12-13_at_20:59:13: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/scala/bin:/usr/local/heroku/bin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

#if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if command -v rbenv > /dev/null; then eval "$(rbenv init -)"; fi
