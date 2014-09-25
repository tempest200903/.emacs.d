;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; ======================================================================
;; [2011-03-10 木] isearch で C-w のように文字を 1 文字ずつ追加
;; url: http://www.bookshelf.jp/soft/meadow_49.html#SEC714
;; Emacs 23.2 では既に定義されている。
;; [[n:/tool/emacs-23.2/lisp/isearch.el]]
;; (define-key map    "\C-w" 'isearch-yank-word-or-char) ;; バッファからミニバッファに1単語転送する。
;; (define-key map "\M-\C-w" 'isearch-del-char) ;; ミニバッファ末尾1文字を削除する。
;; (define-key map "\M-\C-y" 'isearch-yank-char) ;; バッファからミニバッファに1文字転送する。
;; (define-key map    "\C-y" 'isearch-yank-line) ;; バッファからミニバッファに1行転送する。
;; (define-key map    "\M-e" 'isearch-edit-string) ;; ミニバッファの編集を開始する。
(define-key isearch-mode-map (kbd "C-d") 'isearch-yank-char) ;; バッファからミニバッファに1文字転送する。
(define-key isearch-mode-map (kbd "<S-backspace>") 'isearch-del-char) ;; ミニバッファ末尾1文字を削除する。
;; TODO C-s だと isearch から query-replace に引き継がれるが、 M-s M-q や M-s M-r だと引き継がれない。なぜ？
;; (define-key isearch-mode-map (kbd "M-s M-q") 'query-replace) 
;; (define-key isearch-mode-map (kbd "M-s M-r") 'query-replace-regexp)
;; ----------------------------------------------------------------------
;; * [2011-09-01 木] カスタマイズ Lazy Highlight
;;
;; EmacsWiki: Highlight From Isearch -
;; http://emacswiki.org/emacs/HighlightFromIsearch
;;
;; Customize option ‘lazy-highlight-cleanup’ to ‘nil’.  When you
;; end Isearch, its normal highlighting remains. You can later remove
;; this highlighting using command ‘lazy-highlight-cleanup’.
;;
;; Use the code below to highlight your Isearch hits only on demand,
;; when you hit a particular key (e.g. ‘C-TAB’) during Isearch. You
;; can remove this highlighting using ‘C-x w r’
;; (‘unhighlight-regexp’). This uses command ‘highlight-phrase’
;; from HiLock – see HighlightTemporarily.
;;
;; (defun isearch-highlight-phrase () ...
;; 後略
;;
;; - [[file:n:/.emacs.d/my-emacs-custom.el::lazy-highlight-cleanup]]
;; (setq lazy-highlight-cleanup nil)
(global-set-key (kbd "M-s M-z") 'lazy-highlight-cleanup)
;;
(defun isearch-highlight-phrase ()
  "Invoke `highligh-phrase' from within isearch."
  (interactive)
  (let ((case-fold-search isearch-case-fold-search))
    (highlight-phrase (if isearch-regexp
                          isearch-string
                        (regexp-quote isearch-string)))))
;;
(define-key isearch-mode-map (kbd "M-h") 'isearch-highlight-phrase)
;; ----------------------------------------------------------------------
;; * [2011-09-02 金] OccurFromIsearch この Elisp を応用して isearch から 
;; search-in-multi-files を
;; 起動するコマンドを作るべし。
;; (multi-occur-in-matching-buffers BUFREGEXP REGEXP &optional ALLBUFS)
;; http://www.emacswiki.org/emacs/OccurFromIsearch
;; (defun isearch-occur ()
;;   "Invoke `occur' from within isearch."
;;   (interactive)
;;   (let ((case-fold-search isearch-case-fold-search))
;;     (occur (if isearch-regexp isearch-string (regexp-quote isearch-string)))))
;; (defun my-isearch-multi-occur-in-matching-buffers (BUFREGEXP)
;;   "Invoke `multi-occur-in-matching-buffers' from within isearch."
;;   (interactive)
;;   (let ((case-fold-search isearch-case-fold-search))
;;     (multi-occur-in-matching-buffers BUFREGEXP (if isearch-regexp isearch-string (regexp-quote isearch-string)))))
;; (define-key isearch-mode-map (kbd "M-m") 'my-isearch-multi-occur-in-matching-buffers)
;; 失敗。
