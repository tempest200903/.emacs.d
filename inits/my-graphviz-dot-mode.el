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
    (define-key graphviz-dot-mode-map (kbd ";") 'self-insert-command) ;; electric-graphviz-dot-semi は邪魔なので付け替える。
    )
  )
;; (global-set-key (kbd "M-g M-k") 'graphviz-dot-mode)
;; (define-key map "\M-\t"    'graphviz-dot-complete-word)
;; (define-key map "\C-\M-q"  'graphviz-dot-indent-graph)
;; (define-key map "\C-cp"    'graphviz-dot-preview)
;; (define-key map "\C-cc"    'compile)
;; (define-key map "\C-cv"    'graphviz-dot-view)
;; (define-key map "\C-c\C-c" 'comment-region)
;; (define-key map "\C-c\C-u" 'graphviz-dot-uncomment-region)
;; ----------------------------------------------------------------------
;; * [2014-12-05 金] graphviz comile
;; # (compile "./dot ticket2717-pfd-level1-d20141205")
;; いちいち dot という名前のシェルスクリプトをあちこちにばら撒くのは面倒。
;; # (progn (setenv "PATH" (concat (getenv "PATH") ";c:\\tool\\Graphviz2.30\\bin")) (compile (format "dot -Goverlap=false -Nfontname='MS UI Gothic' -Tgif %s.dot -o %s.gif && cygstart 'C:\\Program Files\\IrfanView\\i_view32.exe' %s.gif" "ticket2717-pfd-level1-d20141205" "ticket2717-pfd-level1-d20141205" "ticket2717-pfd-level1-d20141205")))
;; 長い。短縮する。

(setq my-graphviz-dot-image-viewer "cygstart 'C:\\Program Files\\IrfanView\\i_view32.exe'")

(defun my-graphviz-dot-compile (basename)
  (progn
    (setenv "PATH" (concat (getenv "PATH") ";c:\\tool\\Graphviz2.30\\bin"))
    (compile (format "dot -Goverlap=false -Gfontname='MS UI Gothic'  -Nfontname='MS UI Gothic' -Tgif %s.dot -o %s.gif && %s %s.gif" basename basename my-graphviz-dot-image-viewer basename)))
  )

;; ----------------------------------------------------------------------
(provide 'my-graphviz-dot-mode)
