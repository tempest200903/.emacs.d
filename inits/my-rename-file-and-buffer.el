;; #+LAST_UPDATED: 2013-11-03
;; my-rename-file-and-buffer
;; ----------------------------------------------------------------------
;; [2013-10-15] http://qiita.com/ironsand/items/98c6d5ab01105a694af1
;; Emacsで編集中のバッファのファイル名を変更する - Qiita [キータ]
;; source: http://steve.yegge.googlepages.com/my-dot-emacs-file
;;;###autoload
(defun my-rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))
;; TODO これを anything-buffers-list の action に入れてほしい。
;; ----------------------------------------------------------------------
;; * [2013-11-03 日]
(provide 'my-rename-file-and-buffer)
