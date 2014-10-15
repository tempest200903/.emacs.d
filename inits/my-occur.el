;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-occur.el
;; 関連 my-occur-mode-map.el

;; ======================================================================
(defun my-occur-menu-init ()
  (when menu-bar-mode
    (when (require 'easymenu nil t)
      (easy-menu-add-item nil '("Occur") ["multi-occur-in-matching-buffers" multi-occur-in-matching-buffers t])
      (easy-menu-add-item nil '("Occur") ["rename-uniquely" rename-uniquely t])
      (easy-menu-add-item nil '("Occur") ["occur-next" occur-next t])
      (easy-menu-add-item nil '("Occur") ["occur-prev" occur-prev t])
      (easy-menu-add-item nil '("Occur") ["highlight-regexp" highlight-regexp t])
      (easy-menu-add-item nil '("Occur") ["fit-window-to-buffer" fit-window-to-buffer t])
      (easy-menu-add-item nil '("Occur") ["occur-mode-display-occurrence" occur-mode-display-occurrence t])
      (easy-menu-add-item nil '("Occur") ["multi-occur-in-matching-buffers" multi-occur-in-matching-buffers t])
      (easy-menu-add-item nil '("Occur") ["next-error-follow-minor-mode" next-error-follow-minor-mode t])
      )
    )
  )

;; ----------------------------------------------------------------------

;; * [2014-09-13 土]
;; http://www.emacswiki.org/emacs/OccurMode
;; argument なし => 目的バッファへスイッチする。なければ新たに occur 実行。
;; argument あり => 常に新たに occur 実行。
;; 
(defun my-occur-or-switch-to-buffer (arg)
  "Switch to *Occur* buffer, or run `occur'."
  (interactive "P")
  (let ((buffer-name "*Occur*"))
    (if (and (not arg) (get-buffer buffer-name))
        (switch-to-buffer-other-window buffer-name)
      (occur (read-from-minibuffer "Regexp: ")
             (if (listp arg) 0 arg)))
    ;; (balance-windows nil)
    )
  )
(defun my-moccur-or-switch-to-buffer (arg)
  "Switch to *Moccur* buffer, or run `moccur'."
  (interactive "P")
  (let ((buffer-name "*Moccur*"))
    (if (and (not arg) (get-buffer buffer-name))
        (switch-to-buffer-other-window buffer-name)
      (call-interactively 'moccur)
      )
    ;; (balance-windows nil)
    )
  )

;; ----------------------------------------------------------------------
;; * [2014-04-17 木] 
(defun my-occur-link () "カレントバッファからリンクを occur する。"
  (interactive)
  (occur "\\[\\[.*\\]\\]" nil)
  )

;; ----------------------------------------------------------------------
;; * [2014-10-15 水] 2単語のOR検索
(when nil
  (defun test-my-occur-by-moccur-split-word-or ()
    (interactive)
    (my-occur-by-moccur-split-word-or "defun nil message")
    )
  )

(defun my-convert-regexp-split-word-or (words)
  (format "\\(%s\\)" (replace-regexp-in-string " " "\\\\|" words))
  )

(defun my-moccur-split-word-or (words)
  "2単語のOR検索"
  (interactive "MList lines matching regexp: ")
  (let (
        (regexp (my-convert-regexp-split-word-or words))
        )
    (message "regexp { %s }" regexp)
    (moccur regexp nil)
    )
  )

(defun my-occur-by-moccur-split-word-or (words)
  "2単語のOR検索"
  (interactive "MList lines matching regexp: ")
  (let (
        (regexp (my-convert-regexp-split-word-or words))
        )
    (message "regexp { %s }" regexp)
    (occur-by-moccur regexp nil)
    )
  )

(defun my-highlight-regexp-split-word-or (words)
  "2単語のOR検索"
  (interactive "MList lines matching regexp: ")
  (let (
        (regexp (my-convert-regexp-split-word-or words))
        )
    (message "regexp { %s }" regexp)
    (highlight-regexp regexp nil)
    )
  )

(when nil
  (define-key global-map (kbd "<f8>") 'test-my-occur-by-moccur-split-word-or)
  )

(define-key global-map (kbd "M-s M-s M-m") 'my-moccur-split-word-or)
(define-key global-map (kbd "M-s M-s o") 'my-occur-by-moccur-split-word-or)
(define-key global-map (kbd "M-s M-s r") 'my-highlight-regexp-split-word-or)


;; * [2014-10-15 水] TODO my-occur-by-moccur-split-word-or, my-highlight-regexp-split-word-or を define-key する。

;; ----------------------------------------------------------------------
;; * [2013-10-31 木] provide
(provide 'my-occur)
;; ----------------------------------------------------------------------
;; * [2014-09-18 木] TODO my-keymap-autoload.el と my-keymap.el に分離する。
;; * [2014-09-18 木] TODO moccur でカレント位置にある文字列を拾わないモードがほしい。
;; C-u 1個つけたら拾わない。
