;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; ======================================================================
;; * [2011-08-30 火] word-count.el 導入。
;; - http://www.emacswiki.org/emacs/WordCount
;;   - Show the number of words in the mode-line
;;   - from: N:\download\Emacs\plugin\taiyaki.org\word-count.el
;;   - to: N:\.emacs.d\elisp\word-count.el
(autoload 'word-count-mode "word-count"
          "Minor mode to count words." t nil)
;; word-count-mode モードをON/OFFする
(global-set-key "\M-+" 'word-count-mode) ;; word-count.el にて定義済み。検索用に再掲。
;; (global-unset-key "\M-+") ;; キャンセル
(global-set-key (kbd "C-x w w") 'word-count-mode)
;; word-count-set-area リージョンまたはパラグラフをカウント対象領域にする。
(define-key word-count-mode-map "\M- " 'word-count-set-area) ;; word-count.el にて定義済み。検索用に再掲。
(define-key word-count-mode-map "\M- " nil) ;; キャンセル。
(define-key word-count-mode-map (kbd "C-x w a") 'word-count-set-area)
;; word-count-set-marker カウント基点を現在位置にマークする。最初はバッファ末尾にマークしてある。
(define-key word-count-mode-map (kbd "C-x w m") 'word-count-set-marker)
