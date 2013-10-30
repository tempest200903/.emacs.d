;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-graphviz-dot-mode.el
;; ======================================================================
;; http://d.hatena.ne.jp/n9d/20080419/1208614482
;; http://users.skynet.be/ppareit/projects/graphviz-dot-mode/graphviz-dot-mode.html
;; ~/.emacs.d/vendor/elpa/graphviz-dot-mode-20120627/graphviz-dot-mode.el
(when (not (require 'graphviz-dot-mode nil t))
  (progn
    (if (require 'package nil t)
        (package-install 'graphviz-dot-mode)
      (auto-install-from-url "http://users.skynet.be/ppareit/projects/graphviz-dot-mode/graphviz-dot-mode.el")
      )
    )
  )
(when (require 'graphviz-dot-mode nil t)
  (progn
    (global-set-key (kbd "M-g M-k") 'graphviz-dot-mode)
    (define-key graphviz-dot-mode-map (kbd ";") 'self-insert-command) ;; electric-graphviz-dot-semi は邪魔なので付け替える。
    )
  )
;; (define-key map "\M-\t"    'graphviz-dot-complete-word)
;; (define-key map "\C-\M-q"  'graphviz-dot-indent-graph)
;; (define-key map "\C-cp"    'graphviz-dot-preview)
;; (define-key map "\C-cc"    'compile)
;; (define-key map "\C-cv"    'graphviz-dot-view)
;; (define-key map "\C-c\C-c" 'comment-region)
;; (define-key map "\C-c\C-u" 'graphviz-dot-uncomment-region)
