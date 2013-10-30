;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; filename: my-programming-defun.el
;; --------------------------------------------------------------
;; * [2011-04-06 水] 42.9.4 対応する括弧へ飛ぶ (2006/03/16) url: http://www.bookshelf.jp/soft/meadow_42.html#SEC646
;; C-x %で対応する括弧に簡単に飛べるようになります. 
(progn
  (defvar com-point nil
    "Remember com point as a marker. \(buffer specific\)")
  (set-default 'com-point (make-marker))
  (defun getcom (arg)
    "Get com part of prefix-argument ARG."
    (cond ((null arg) nil)
          ((consp arg) (cdr arg))
          (t nil)))
  (defun paren-match (arg)
    "Go to the matching parenthesis."
    (interactive "P")
    (let ((com (getcom arg)))
      (if (numberp arg)
          (if (or (> arg 99) (< arg 1))
              (error "Prefix must be between 1 and 99.")
            (goto-char
             (if (> (point-max) 80000)
                 (* (/ (point-max) 100) arg)
               (/ (* (point-max) arg) 100)))
            (back-to-indentation))
        (cond ((looking-at "[\(\[{]")
               (if com (move-marker com-point (point)))
               (forward-sexp 1)
               (if com
                   (paren-match nil com)
                 (backward-char)))
              ((looking-at "[])]}")
               (forward-char)
               (if com (move-marker com-point (point)))
               (backward-sexp 1)
               (if com (paren-match nil com)))
              (t (error ""))))))
  (define-key ctl-x-map "%" 'paren-match))
;; --------------------------------------------------------------
;; * [2011-04-06 水] 42.9.4 対応する括弧へ飛ぶ (2006/03/16) url: http://www.bookshelf.jp/soft/meadow_42.html#SEC646
;; %で対応する括弧へカーソルを移動できます．カーソルが括弧の上になければ，単に%が挿入されます． 
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))
(global-set-key "%" 'match-paren)
;; ----------------------------------------------------------------------
;; * [2011-11-11 金] 
(font-lock-add-keywords 'sh-mode '(("declare" . font-lock-keyword-face)))
;; ----------------------------------------------------------------------
;; * [2012-05-20 日] cf. n:/download/Emacs/sample_emacs_d/github.com.shishi/shishi-.emacs.d-9d470cf/inits/05-util.el
;; バッファを全体をインデント
(defun indent-whole-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))
(define-key global-map (kbd "C-z C-x TAB") 'indent-whole-buffer)
;; ----------------------------------------------------------------------
;; * [2012-06-14 木] Quick Tip: Spaces instead of Tabs | M-x all-things-emacs
;; http://emacsblog.org/2007/09/30/quick-tip-spaces-instead-of-tabs/
(setq-default indent-tabs-mode nil)
