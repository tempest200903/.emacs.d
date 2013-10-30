;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; ======================================================================
(require 'imenu)
;; ----------------------------------------------------------------------
;; * [2011-02-02 水 18:46] org-mode 用のメニューを imenu で構築する。
;; url: http://www.network-theory.co.uk/docs/orgmode/Cooperation.html
;; M-x org-info ; 14.8.1 Packages that Org cooperates with
(defun my-imenu-add-to-menubar ()
  (interactive)
  (imenu-add-to-menubar "Imenu")
  (local-set-key (kbd "M-s M-i") 'imenu)
  )
;; [2012-09-14 金] 一部の org ファイルで不具合発生する。いったん無効にする。
;; 例。 n:/howm/2012/09/2012-09-03-185904-0000000000000000.howm.txt
(when nil
  (add-hook 'org-mode-hook              'my-imenu-add-to-menubar)
  )
(add-hook 'emacs-lisp-mode-hook       'my-imenu-add-to-menubar)
(add-hook 'sql-mode-hook              'my-imenu-add-to-menubar)
(add-hook 'php-mode-hook              'my-imenu-add-to-menubar)
(add-hook 'html-mode-hook             'my-imenu-add-to-menubar)
(add-hook 'java-mode-hook             'my-imenu-add-to-menubar)
(add-hook 'sh-mode-hook               'my-imenu-add-to-menubar)
(add-hook 'perl-mode-hook             'my-imenu-add-to-menubar)
