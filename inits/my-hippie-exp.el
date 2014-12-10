;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-hippie-exp.el
;; ======================================================================
;; http://www.gnu.org/software/emacs/manual/html_node/autotype/Hippie-Expand.html
;; https://github.com/xiaohanyu/oh-my-emacs/blob/master/core/ome-completion.org
;; http://dev.ariel-networks.com/Members/matsuyama/emacs-abbrev/
;; http://www.emacswiki.org/emacs/HippieExpand

(setq hippie-expand-try-functions-list
      '(try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs
        try-expand-list try-expand-line
        try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))

(bind-key "M-s M-/" 'hippie-expand)

