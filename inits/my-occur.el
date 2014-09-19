;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-occur.el
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
  (if (and (not arg) (get-buffer "*Occur*"))
      (switch-to-buffer-other-window "*Occur*")
    (occur (read-from-minibuffer "Regexp: ")
           (if (listp arg) 0 arg)))
  (balance-windows nil)
  )
(defun my-moccur-or-switch-to-buffer (arg)
  "Switch to *Moccur* buffer, or run `moccur'."
  (interactive "P")
  (if (and (not arg) (get-buffer "*Moccur*"))
      (switch-to-buffer-other-window "*Moccur*")
    (call-interactively 'moccur)
    )
  (balance-windows nil)
  )
;; ----------------------------------------------------------------------
(add-hook 'occur-mode-hook 'my-occur-menu-init)
(add-hook 'grep-mode-hook 'my-occur-menu-init)
(add-hook 'occur-mode-hook 'shrink-window-if-larger-than-buffer)
(add-hook 'occur-mode-find-occurrence-hook 'shrink-window-if-larger-than-buffer)
;; ----------------------------------------------------------------------
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
