;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-indirect-mode.el
;; 関連 my-narrow-indirect-package.el
;; ======================================================================

;; * [2014-10-15 水 01:49] TODO http://www.emacswiki.org/emacs/IndirectBuffers

(defvar indirect-mode-name nil
      "Mode to set for indirect buffers.")
    (make-variable-buffer-local 'indirect-mode-name)
    (defun indirect-region (start end)
      "Edit the current region in another buffer.
    If the buffer-local variable `indirect-mode-name' is not set, prompt
    for mode name to choose for the indirect buffer interactively.
    Otherwise, use the value of said variable as argument to a funcall."
      (interactive "r")
      (let ((buffer-name (generate-new-buffer-name "*indirect*"))
            (mode
             (if (not indirect-mode-name)
                 (setq indirect-mode-name
                       (intern
                        (completing-read 
                         "Mode: "
                         (mapcar (lambda (e) 
                                   (list (symbol-name e)))
                                 (apropos-internal "-mode$" 'commandp))
                         nil t)))
               indirect-mode-name)))
        (pop-to-buffer (make-indirect-buffer (current-buffer) buffer-name))
        (funcall mode)
        (narrow-to-region start end)
        (goto-char (point-min))
        (shrink-window-if-larger-than-buffer)))

;; リージョンを indirect して任意の major-mode に切り替える。
;; HTML + CSS + JavaScript ファイルや
;; org-mode の BEGIN_SRC block で複数 mode 混在するときに便利そうだ。

;; my-indirect-mode.el と機能が重なっていそうだ。両方実験してみる。
