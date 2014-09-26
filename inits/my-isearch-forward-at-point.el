;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-isearch-forward-at-point.el
;; 関連 my-isearch-forward-at-point-keymap-autoload.el
;; ----------------------------------------------------------------------
;; * [2014-09-26 金] 
;; http://d.hatena.ne.jp/syohex/20140925/1411648801
;; isearch-forward-symbol-at-point - Life is very short
;; Emacs 24.4で追加されたコマンド.
;; http://www.emacswiki.org/emacs/SearchAtPoint
;; EmacsWiki: Search At Point
;; http://ergoemacs.org/emacs/emacs_search_current_word.html
;; Emacs: Search ＆ Highlight Words
;; 【Alt+s .】	isearch-forward-symbol-at-point	search the symbol under cursor. (new in emacs 24.4)
;; http://qiita.com/scalper/items/c8b06af858f3f390c3a0
;; Emacs - カーソル位置の単語を簡単に検索 - Qiita
;; isearch-forward-at-point.el
;; ----------------------------------------------------------------------
(defvar isearch-initial-string nil)
(defun isearch-set-initial-string ()
  (remove-hook 'isearch-mode-hook 'isearch-set-initial-string)
  (setq isearch-string isearch-initial-string)
  (isearch-search-and-update))
(defun isearch-forward-at-point (&optional regexp-p no-recursive-edit)
  "Interactive search forward for the symbol at point."
  (interactive "P\np")
  (if regexp-p (isearch-forward regexp-p no-recursive-edit)
    (let* ((end (progn (skip-syntax-forward "w_") (point)))
           (begin (progn (skip-syntax-backward "w_") (point))))
      (if (eq begin end)
          (isearch-forward regexp-p no-recursive-edit)
        (setq isearch-initial-string (buffer-substring begin end))
        (add-hook 'isearch-mode-hook 'isearch-set-initial-string)
        (isearch-forward regexp-p no-recursive-edit)))))

