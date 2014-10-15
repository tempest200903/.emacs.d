;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-occur-mode-map.el
;; 関連 my-occur.el
;; ======================================================================

(define-key occur-mode-map (kbd "u") 'rename-uniquely)
(define-key occur-mode-map (kbd "n") 'occur-next)
(define-key occur-mode-map (kbd "p") 'occur-prev)
(define-key occur-mode-map (kbd "h") 'highlight-regexp)
(define-key occur-mode-map (kbd "-") 'fit-window-to-buffer)
(define-key occur-mode-map (kbd "SPC") 'occur-mode-display-occurrence)
(define-key occur-mode-map (kbd "b") 'multi-occur-in-matching-buffers)
(define-key occur-mode-map (kbd "f") 'next-error-follow-minor-mode)

;; ----------------------------------------------------------------------

(autoload 'my-occur-menu-init "my-occur.el")
(add-hook 'occur-mode-hook                      'my-occur-menu-init)
(add-hook 'grep-mode-hook                       'my-occur-menu-init)
(add-hook 'occur-mode-hook                      'shrink-window-if-larger-than-buffer)
(add-hook 'grep-mode-hook                       'shrink-window-if-larger-than-buffer)
(add-hook 'occur-mode-find-occurrence-hook      'shrink-window-if-larger-than-buffer)

;; * [2014-10-15 水] TODO occur や grep buffer を shrink したい。
;; 上記の hook では実現できない。

;; ----------------------------------------------------------------------

;; * [2014-08-30 土] idea
;; idea.1 (kbd "M-s M-g ***") を prefix にする。 
;; idea.1 (kbd "M-g M-s ***") を prefix にする。 
;; idea.1 (kbd "M-s M-s ***") を prefix にする。 
;; idea.1 (kbd "M-g M-g ***") を prefix にする。 
;; 例。 (global-set-key (kbd "M-s b") 'my-occur-or-switch-to-buffer) は IME on だと不発するので面倒。
;; (global-set-key (kbd "M-g M-s M-o") 'my-occur-or-switch-to-buffer) にする。
;; (global-set-key (kbd "M-s M-o") 'occur) の前に prefix M-g を追加すればいいので覚えやすい。
;; 欠点は3ストロークになること。
;; (kbd "M-g p"), (kbd "M-g n") も IME on 不発問題がある。
;; (kbd "M-s M-p"), (kbd "M-s M-n") に変更するべし。
;; あちこちに散らばって把握しにくい。集約するか？

;; ----------------------------------------------------------------------

