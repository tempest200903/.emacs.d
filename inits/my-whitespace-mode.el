;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; ======================================================================
;; * [2011-04-12 火] 行末のスペースを強調表示
;; cf. url: http://hawaii.naist.jp/~chihiro-o/index.html
;; (when (boundp 'show-trailing-whitespace) (setq-default show-trailing-whitespace t))
;; (when (boundp 'show-trailing-whitespace) (setq-default show-trailing-whitespace nil))
;; (set-face-background 'trailing-whitespace "CornflowerBlue") 
;; (set-face-underline 'trailing-whitespace t) 
;; face は M-x customize-face で行う。
;; goto [[n:/.emacs.d/init.el]]
;; 例
;;   '(highlight-indent-face ((t (:inherit fringe :background "red" :foreground "blue"))))
;;   '(trailing-whitespace ((t (:background "CornflowerBlue" :underline t)))))
;; TODO t と nil を toggle するコマンド。
;; ------------------------------------------------------------
;; http://d.hatena.ne.jp/syohex/20110119/1295450495
;; for whitespace-mode
;; (require 'whitespace)
;; ;; see whitespace.el for more details
;; (setq whitespace-style '(face tabs tab-mark spaces space-mark))
;; (setq whitespace-display-mappings
;;       '((space-mark ?\u3000 [?\u25a1])
;;         ;; WARNING: the mapping below has a problem.
;;         ;; When a TAB occupies exactly one column, it will display the
;;         ;; character ?\xBB at that column followed by a TAB which goes to
;;         ;; the next TAB column.
;;         ;; If this is a problem for you, please, comment the line below.
;;         (tab-mark ?\t [?\xBB ?\t] [?\\ ?\t])))
;; (setq whitespace-space-regexp "\\(\u3000+\\)")
;; (set-face-foreground 'whitespace-tab "#adff2f")
;; (set-face-background 'whitespace-tab 'nil)
;; (set-face-underline  'whitespace-tab t)
;; (set-face-foreground 'whitespace-space "#7cfc00")
;; (set-face-background 'whitespace-space 'nil)
;; (set-face-bold-p 'whitespace-space t)
;; (global-whitespace-mode 1)
;; (global-set-key (kbd "C-x w") 'global-whitespace-mode)
;; タブと全角スペースのみ見えるようにしています。半角スペースや改行は
;; そのままです。参考サイトのものではあんまり目立たなかったので、
;; タブにアンダーラインを引き、全角スペースはボールドで強調してます。
;; 見た目を示します。


(require 'whitespace)
;; see whitespace.el for more details
(setq whitespace-style '(face tabs tab-mark spaces space-mark))
(setq whitespace-display-mappings
      '((space-mark ?\u3000 [?\u25a1])
        ;; WARNING: the mapping below has a problem.
        ;; When a TAB occupies exactly one column, it will display the
        ;; character ?\xBB at that column followed by a TAB which goes to
        ;; the next TAB column.
        ;; If this is a problem for you, please, comment the line below.
        (tab-mark ?\t [?\xBB ?\t] [?\\ ?\t])))
(setq whitespace-space-regexp "\\(\u3000+\\)")
(set-face-foreground 'whitespace-tab "#adff2f")
(set-face-background 'whitespace-tab 'nil)
(set-face-underline  'whitespace-tab t)
(set-face-foreground 'whitespace-space "#7cfc00")
(set-face-background 'whitespace-space 'nil)
(set-face-bold-p 'whitespace-space t)
(global-whitespace-mode 1)
(global-set-key (kbd "C-x w") 'global-whitespace-mode)
