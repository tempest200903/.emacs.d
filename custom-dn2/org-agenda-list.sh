echo 2014-10-29 実験中
export HOME=N:/tool/gnupack/gnupack_devel-11.00/home
export EMACS_CUSTOM=custom-dn2
emacs -batch -l $HOME/.emacs.d/init.el -eval '(org-agenda-list)'
