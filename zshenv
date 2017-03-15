# http://stackoverflow.com/questions/9853584/how-to-use-correct-ruby-in-vim-how-to-modify-path-in-vim/12146694#12146694
if [ is_mac ]; then
  fpath=(~/.git_completions $fpath)
  path=(/usr/local/sbin /opt/local/bin /opt/local/sbin /usr/local/scala/bin $path)
fi
