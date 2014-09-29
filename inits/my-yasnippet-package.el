;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-yasnippet-package.el
;; #+LAST_UPDATED: 2014-09-28
;; ======================================================================
;; * [2014-09-28 日] 導入
;; http://qiita.com/tokomakoma123/items/1f1f0b498bd4c9a0536f
;; Emacs - yasnippet の使い方 - Qiita

(when
    (and
     (package-require 'yasnippet nil nil t)
     (package-require 'yasnippet-bundle nil nil t)
     )
  
  (defun yas-minor-mode-on () ""
    (yas-minor-mode 1)
    )

  (add-hook 'org-mode-hook 'yas-minor-mode-on)

  (setq yas-snippet-dirs
        '("~/.emacs.d/snippets"                 ;; personal snippets
          ))

  ;; default key bindings
  ;; C-c & C-f       yas/find-snippets
  ;; C-c & C-n       yas/new-snippet
  ;; C-c & C-s       yas/insert-snippet
  ;; C-c & C-v       yas/visit-snippet-file

  (bind-key "C-x y e" 'yas/expand)
  (bind-key "C-x y i" 'yas/insert-snippet)
  (bind-key "C-x y f" 'yas/find-snippets)
  (bind-key "C-x y v" 'yas/visit-snippet-file)
  (bind-key "C-x y n" 'yas/new-snippet)

  )

