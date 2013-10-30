;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-wgrep.el
;; ======================================================================
;; * [2012-05-31 木] 
;; http://twitter.com/rubikitch/statuses/22352119320
;; grep-edit.elからwgrep.elに乗り換えた。defadviceを使ってないなど、こっちのがクリーンな設計だ。 (install-elisp-from-emacswiki "wgrep.el")
;; 使い方。 xxxxx
;;
(when (not (require 'wgrep nil t))
  (progn
    (message "require package false")
    (install-elisp-from-emacswiki "wgrep.el")
    (message "see http://emacswiki.org/emacs/wgrep.el")
    (message "wgrep.el --- Writable grep buffer and apply the changes to files")
    (message "see ~/.emacs.d/auto-install/wgrep.el")
    (popwin:messages)
    )
  )
;;
(when (require 'wgrep nil t)
  (progn
    (message "require package true")
    (setq wgrep-enable-key "r")
    (popwin:messages)
    )
  )
