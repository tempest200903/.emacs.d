;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-prefix-arg-commands.el
;; #+LAST_UPDATED: 2014-10-02
;; ======================================================================
;; * [2014-10-02 木] C-uを押した回数によって実行するコマンドを変えるコマンドを定義する為の拡張 prefix-arg-commands.el
;; http://d.hatena.ne.jp/tm8st/20101203/1291386289
;; ~/.emacs.d/auto-install/prefix-arg-commands.el

(when (not (require 'prefix-arg-commands nil t))
  (if (require 'my-auto-install nil t)
      (if (auto-install-from-url "https://github.com/tm8st/emacs-prefix-arg-commands/raw/master/prefix-arg-commands.el")
          (message "auto-install-from-url success.")
          (message "auto-install-from-url fail.")
          )
    (message "need my-auto-install.")
    )
  )
(when (require 'prefix-arg-commands nil t)
  (message "(require 'prefix-arg-commands) success.")
  ;; C-uを押した回数によって異なる値をフレームの半透明度に設定するコマンド
  (global-set-key (kbd "<C-pause>") 'prefix-arg-commands-set-frame-alpha)
    )

(provide 'my-prefix-arg-commands)
