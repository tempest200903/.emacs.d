;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-org-capture.el
;; #+LAST_UPDATED: 2014-10-14

;; ======================================================================
;; * [2014-10-14 火] org-capture 開始。
;;
;; ~/.emacs.d/custom-dn2/my-emacs-custom.el
;; '(org-directory "N:/howm")
;; ~/.emacs.d/custom-goat/my-emacs-custom.el
;; '(org-directory "f:/goat-pc-data/mydropbox/Dropbox/trunksync/notes")

(setq org-default-notes-file (concat org-directory "/inbox.org"))
(define-key global-map (kbd "<non-convert> <non-convert>") 'org-capture)
(when nil
  (define-key global-map (kbd "<pause> <pause> ") (lambda () (interactive) (org-capture nil "p")))
  (define-key global-map (kbd "<non-convert> m") (lambda () (interactive) (org-capture nil "m")))
  (define-key global-map (kbd "<non-convert> d") (lambda () (interactive) (org-capture nil "d")))
  )

(setq org-capture-templates
      '(
        ("p" "phone interrupt" entry (file+headline (concat org-directory "/interrupt.org") "phone")
         "* TODO  %?
  %U" :clock-in t :clock-resume t
  )
        ("e" "email interrupt" entry (file+headline (concat org-directory "/interrupt.org") "email")
         "* TODO  %?
  %U" :clock-in t :clock-resume t)
        ("m" "meeting interrupt" entry (file+headline (concat org-directory "/interrupt.org") "meeting")
         "* TODO  %?
  %U" :clock-in t :clock-resume t)
        ("a" "active" item (file+headline (concat org-directory "/task.org") "active")
         "[ ] %K")
        ("i" "task inbox" entry (file+headline (concat org-directory "/task.org") "inbox")
         "* TODO  %?
  %U" :clock-in t :clock-resume t)
        ("d" "dailyplan" item (file+headline "n:/howm/2014/10/2014-10-01-100529.howm.txt" "inbox")
         "[ ] %K")
        )
      )

;; TODO task.org の代わりに dailyplan ファイルを指定する。

(defun my-org-insert-link-dailyplan ()
  ""
  (interactive)
  (org-store-link)
  (my-org-clock-goto-default)
  (outline-next-visible-heading 1)
  (open-line 1)
  (insert "- [ ] ")
  (org-insert-link)
  )
;; [2014-10-15 水] TODO org-insert-link でユーザからの入力待ちになる。これを自動化したい。
