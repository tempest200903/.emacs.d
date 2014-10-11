;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; ======================================================================
;; * [2010-11-02 火] iswitchb 導入
;; cf. url: http://www.bookshelf.jp/soft/meadow_28.html#SEC363
;; 28.2.1 バッファの切換えをもっと楽にしたい － iswitchb (2008/03/24)
(iswitchb-mode 1)
;; cf. url: http://www.bookshelf.jp/soft/meadow_28.html#SEC363
;; 28.2.1.1 iswitchb で選択中の内容を表示 (2004/06/27)
(defadvice iswitchb-exhibit
  (after
   iswitchb-exhibit-with-display-buffer
   activate)
  "選択している buffer を window に表示してみる。"
  (when (and
         (eq iswitchb-method iswitchb-default-method)
         iswitchb-matches)
    (select-window
     (get-buffer-window (cadr (buffer-list))))
    (let ((iswitchb-method 'samewindow))
      (iswitchb-visit-buffer
       (get-buffer (car iswitchb-matches))))
    (select-window (minibuffer-window))))
;; * [2010-11-02 火] C-x b RET で直前のバッファに戻ることができないため不便だ。利用中止。
;; [2011-10-26 水] 訂正。直前のバッファに戻れる。
;; ----------------------------------------------------------------------
;; * [2011-11-22 火]
;; http://aikotobaha.blogspot.com/2010/08/gnupack-ntemacs23-dotemacs.html
;; C-f, C-b, C-n, C-p で候補を切り替えることができるように。
;; 感想。体験中。やや使いづらい？
(when nil
  (add-hook 'iswitchb-define-mode-map-hook
            (lambda ()
              (define-key iswitchb-mode-map "\C-n" 'iswitchb-next-match)
              (define-key iswitchb-mode-map "\C-p" 'iswitchb-prev-match)
              (define-key iswitchb-mode-map "\C-f" 'iswitchb-next-match)
              (define-key iswitchb-mode-map "\C-b" 'iswitchb-prev-match)
              ))
  )

