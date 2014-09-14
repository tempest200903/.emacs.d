;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2012-03-28
;; my-goto-last-change.el
;; ======================================================================
;; * [2010-10-18 月]
;; url: http://www.bookshelf.jp/soft/meadow_44.html#SEC662
;; url: http://www.emacswiki.org/cgi-bin/wiki/goto-chg.el
;; * [2014-09-06 土] インストール手順
;; M-x package-install goto-last-change
;; ----------------------------------------------------------------------
;; * [2014-09-13 土] goto-last-change-reverse 
;; ** http://qiita.com/icb54615/items/ce366054d15472134a72
;; 移動しすぎた際には、 goto-last-change-reverse で元に戻ります。
;; ** http://www.emacswiki.org/emacs/goto-chg.el
;; Version: 20121115.1014
;; Negative argument, C-u -, for reverse direction.
;; と書いてあるが、いまいち挙動が分からない。
;;
;; ----------------------------------------------------------------------
(when (and
       (package-require 'goto-last-change nil nil t)
       t)
  (when (require 'my-use-package nil t)
    (use-package loccur
      :bind (
             ("M-g M-l"     . goto-last-change)                 ;; (define-key global-map (kbd "M-g M-l")     'goto-last-change)
             ("M-g M-<SPC>" . goto-last-change-with-auto-marks) ;; (define-key global-map (kbd "M-g M-<SPC>") 'goto-last-change-with-auto-marks)
             ("M-g M-k"     . goto-last-change-reverse)         ;; (define-key global-map (kbd "M-g M-k")     'goto-last-change-reverse)
             )
      )
    )
  )
;; ----------------------------------------------------------------------
;;###autoload
(defun goto-last-change-reverse (arg)
  "Go back to more recent changes after \\[goto-last-change] have been used.
See `goto-last-change' for use of prefix argument."
  (interactive "P")
  ;; Negate arg, all kinds
  (cond ((eq arg nil)  (setq arg '-))
	((eq arg '-)   (setq arg nil))
	((listp arg)   (setq arg (list (- (car arg)))))
	(t (setq arg   (- arg))))
  ;; Make 'goto-last-change-reverse' look like 'goto-last-change'
  (cond ((eq last-command this-command)
	 (setq last-command 'goto-last-change)))
  (setq this-command 'goto-last-change)
  ;; Call 'goto-last-change' to do the job
  (goto-last-change arg))
;; ----------------------------------------------------------------------
(provide 'my-goto-last-change)
