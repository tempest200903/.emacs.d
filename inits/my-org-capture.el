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
(define-key global-map (kbd "<oem-attn> j") 'org-capture)
(define-key global-map (kbd "<pause> <pause> ") (lambda () (interactive) (org-capture nil "p")))
(define-key global-map (kbd "<oem-attn> m") (lambda () (interactive) (org-capture nil "m")))

(setq org-capture-templates
      '(
        ("p" "phone interrupt" entry (file+headline (concat org-directory "/interrupt.org") "phone")
         "* TODO  %?
  %U" :clock-in t :clock-resume t
         )
        ("m" "mail interrupt" entry (file+headline (concat org-directory "/interrupt.org") "mail")
         "* TODO  %?
  %U" :clock-in t :clock-resume t)
        ("a" "active" item (file+headline (concat org-directory "/task.org") "active")
         "[ ] %K")
        ("i" "task inbox" entry (file+headline (concat org-directory "/task.org") "inbox")
         "* TODO  %?
  %U" :clock-in t :clock-resume t)
        )
      )

;; TODO task.org の代わりに dailyplan ファイルを指定する。
