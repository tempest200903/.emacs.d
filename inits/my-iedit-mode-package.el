;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-iedit-mode.el
;; ======================================================================
;; - http://d.hatena.ne.jp/tototoshi/20120717/1342531319
;;   - iedit-mode が便利 - tototoshiの日記
;; ----------------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/vendor/elpa/iedit-20120306/")
(when (not (require 'iedit nil t))
      (progn
        (when (require 'package nil t)
              (progn
                (package-install 'iedit)
                )
              )
        )
      )
(when (require 'iedit nil t)
  (progn
    ;; Default key bindings:
    ;; (define-key global-map (kbd "C-;") 'iedit-mode)
    ;; (define-key isearch-mode-map (kbd "C-;") 'iedit-mode)
    ;; (define-key esc-map (kbd "C-;") 'iedit-execute-last-modification)
    ;; (define-key help-map (kbd "C-;") 'iedit-mode-on-function)
    ;; (define-key global-map [C-return] 'iedit-rectangle-mode)
    )
  )
