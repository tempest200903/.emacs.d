export HOME=N:/tool/gnupack/gnupack_devel-11.00/home
echo "bash HOME => " $HOME
emacs -batch -eval '(message "in emacs getenv HOME => %s" (getenv "HOME"))'
emacs -batch -load "~/.emacs.d/experimental/init.el" 
