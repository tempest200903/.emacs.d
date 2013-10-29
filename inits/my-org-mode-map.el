;; -*- mode: emacs-lisp ; coding: utf-8-unix -*-
;; #+LAST_UPDATED: 2013-10-23
;; ----------------------------------------------------------------------
;; * global
;; 『Emacs org-modeを使ってみる: (1) インストール - 屯遁のパズルとプログラミングの日記』 http://d.hatena.ne.jp/tamura70/20100203/org
;; キーバインドの設定
(define-key global-map (kbd "C-c l") 'org-store-link)
(define-key global-map (kbd "C-:") 'org-agenda)
;; (define-key global-map (kbd "C-x C-:") 'my-org-agenda-list-switch-to-buffer)
(define-key global-map (kbd "M-g M-j") 'org-clock-goto)
;; (define-key global-map (kbd "M-g M-u") 'my-org-clock-goto-u)
;; (define-key global-map (kbd "M-g M-h") 'my-org-clock-goto-default)
(define-key global-map (kbd "M-s M-a") 'org-occur-in-agenda-files)
;; (define-key global-map (kbd "C-z C-u") 'org-time-stamp-inactive)
(define-key global-map (kbd "C-c b") 'org-iswitchb) ; cf. http://orgmode.org/manual/Activation.html#Activation
;; ----------------------------------------------------------------------
;; * org-map
