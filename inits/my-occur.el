;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-occur.el
;; 関連 my-occur-mode-map.el

;; ======================================================================
(defun my-occur-menu-init ()
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
    (balance-windows nil)
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
    (balance-windows nil)
    )
  )

;; ----------------------------------------------------------------------

(add-hook 'occur-mode-hook 'my-occur-menu-init)
(add-hook 'grep-mode-hook 'my-occur-menu-init)
(add-hook 'occur-mode-hook 'shrink-window-if-larger-than-buffer)
(add-hook 'occur-mode-find-occurrence-hook 'shrink-window-if-larger-than-buffer)

;; ----------------------------------------------------------------------
;; * [2014-04-17 木] 
(defun my-occur-link () "カレントバッファからリンクを occur する。"
  (interactive)
  (occur "\\[\\[.*\\]\\]" nil)
  )
;; ----------------------------------------------------------------------
;; * [2013-10-31 木] provide
(provide 'my-occur)
;; ----------------------------------------------------------------------
;; * [2014-09-18 木] TODO my-keymap-autoload.el と my-keymap.el に分離する。
;; * [2014-09-18 木] TODO moccur でカレント位置にある文字列を拾わないモードがほしい。
;; C-u 1個つけたら拾わない。
