;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-setup-macro.el
;; ======================================================================
;; * [2014-09-10 水] setup.el 導入
;; https://gist.github.com/zk-phi/9935048
;; https://github.com/zk-phi/setup
;; ~/.emacs.d/auto-install/setup.el
;; ----------------------------------------------------------------------
(when (not (require 'setup nil t))
  (progn
    (when (require 'my-auto-install nil t)
      (auto-install-from-url "https://raw.githubusercontent.com/zk-phi/setup/master/setup.el")
      )
    )
  )
;; ----------------------------------------------------------------------
(when (require 'setup nil t)
  (progn
    (setup-initialize)
    (setup-lazy
     '(rotate-layout
       rotate-window
       rotate:even-horizontal
       rotate:even-vertical
       rotate:main-horizontal
       rotate:main-vertical
       rotate:tiled
       ) "my-rotate-package"
         :prepare (setup-keybinds 
                   nil
                   "C-M-S-l" 'rotate-layout
                   "C-M-S-w" 'rotate-window
                   "C-M-S-h" 'rotate:even-horizontal
                   "C-M-S-v" 'rotate:even-vertical
                   "C-M-S-m" 'rotate:main-horizontal
                   "C-M-S-n" 'rotate:main-vertical
                   "C-M-S-t" 'rotate:tiled
                   )
         )
    )
  )
