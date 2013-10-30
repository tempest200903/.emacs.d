;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-dired-view-file.el
;; =============================================================================
;; http://d.hatena.ne.jp/yuheiomori0718/20120219/1329657774
;; dired-view-fileで開くバッファはdiredのバッファを隠してしまいますので、なんとなく操作感がanythingと遠いと感じました。
(defun dired-view-file-other-window ()
  (interactive)
  (let ((file (dired-get-file-for-visit)))
    (if (file-directory-p file)
	(or (and (cdr dired-subdir-alist)
		 (dired-goto-subdir file))
	    (dired file))
      (view-file-other-window file)
      )))
;; デフォルトは V runs the command dired-do-run-mail, which is an interactive compiled Lisp function in `dired-x.el'.
;; このコマンドは使わないので別の用途に使う。
(define-key dired-mode-map (kbd "V") 'dired-view-file-other-window)
;; やってることは「dired-view-fileを別windowで開き、さらにnやpで前後のファイルを開く」です。
(defun dired-view-file-next (&optional reverse)
  (interactive)
  (View-quit)
  (if reverse (previous-line)
    (next-line))
  (dired-view-file-other-window))
(defun dired-view-file-previous ()
  (interactive)
  (dired-view-file-next 1))
(define-key view-mode-map (kbd "N") 'dired-view-file-next)
(define-key view-mode-map (kbd "P") 'dired-view-file-previous)
