;;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-anything-map.el
;; ======================================================================
(setq anything-command-map-prefix-key "s-:")

;; ----------------------------------------------------------------------
;; * [2010-11-27 土] キーマップ my-anything-map
(define-prefix-command 'my-anything-map)
(global-set-key (kbd "C-t") 'my-anything-map)
(define-key my-anything-map (kbd "SPC") 'anything-execute-anything-command)
(define-key my-anything-map (kbd "C-t") 'anything-at-point)
                                        ; when C-u is pressed, the initial input is the symbol at point.
(define-key my-anything-map (kbd "C-q") 'anything-resume)
                                        ; 直前に利用した Anything コマンドの結果を再現してくれます。
(define-key my-anything-map (kbd "C-l") 'anything-bookmarks)
(define-key my-anything-map (kbd "C-k") 'anything-for-files)
(define-key my-anything-map (kbd "C-x C-f") 'anything-find-files)
(define-key my-anything-map (kbd "b") 'anything-buffers-list)
(define-key my-anything-map (kbd "C-;") 'anything-recentf)
(define-key my-anything-map (kbd "C-i") 'anything-imenu) 
(define-key my-anything-map (kbd "C-o") 'anything-occur)
(define-key my-anything-map (kbd "C-y") 'anything-show-kill-ring)
(define-key my-anything-map (kbd "C-p") 'anything-minibuffer-history)
(define-key my-anything-map (kbd "r") 'anything-register)
(define-key my-anything-map (kbd "C-r") 'anything-regexp)
(define-key my-anything-map (kbd "C-a") 'anything-c-apropos)
(define-key my-anything-map (kbd "M-x") 'anything-M-x)
(define-key my-anything-map (kbd "C-e") 'anything-calcul-expression)
(define-key my-anything-map (kbd "C-@") 'anything-all-mark-rings)
(define-key my-anything-map (kbd "C-d") 'anything-do-grep)
(define-key my-anything-map (kbd "C-]") 'anything-bm-list)

;; 実験中
(define-key my-anything-map (kbd "C-s") 'anything-minibuffer-history)
(define-key my-anything-map (kbd "C-w") 'anything-info-at-point) ;; lisp ドキュメント, info, Google suggest で検索する。 C-w でカーソル位置の単語を取り込み。
(define-key my-anything-map (kbd "s") 'anything-c-etags-select)
(define-key my-anything-map (kbd "g") 'anything-google-suggest)

;; ----------------------------------------------------------------------
;; * [2012-05-20 日] キーマップ isearch-mode-map
;; * [2012-05-20 日] cf. n:/download/Emacs/sample_emacs_d/github.com.shishi/shishi-.emacs.d-9d470cf/inits/05-util.el
;; isearch から anything-occur に移行する。
;; cf. N:\tool\gnupack\gnupack_devel-11.00\home\.emacs.d.subversion\elisp\anything-c-moccur.el
(autoload 'anything-c-moccur-from-isearch "my-anything-c-moccur" nil t)
(define-key isearch-mode-map (kbd "C-t") 'anything-c-moccur-from-isearch)

;; ----------------------------------------------------------------------
;; * [2013-11-01 金] autoload
(autoload 'my-anything-static-keywords "my-anything-static-keywords" nil t)
(global-set-key (kbd "C-t C-:") 'my-anything-static-keywords)

;; ----------------------------------------------------------------------
