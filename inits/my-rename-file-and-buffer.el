;; #+LAST_UPDATED: 2013-11-03
;; my-rename-file-and-buffer
;; ----------------------------------------------------------------------
;; [2013-10-15] http://qiita.com/ironsand/items/98c6d5ab01105a694af1
;; Emacsで編集中のバッファのファイル名を変更する - Qiita [キータ]
;; source: http://steve.yegge.googlepages.com/my-dot-emacs-file
;; source: http://whattheemacsd.com/
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
;; * [2014-09-16 火]
;; source: http://whattheemacsd.com/
;; (global-set-key (kbd "C-x C-k") 'delete-current-buffer-file)
;; This is it. C-x C-k: file begone!
;; I like the feel between C-x k to kill the buffer and C-x C-k to kill the file.
(defun my-delete-current-buffer-file ()
  "Removes file connected to current buffer and kills buffer."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (ido-kill-buffer)
      (when (yes-or-no-p "Are you sure you want to remove this file? ")
        (delete-file filename)
        (kill-buffer buffer)
        (message "File '%s' successfully removed" filename)))))
;; ----------------------------------------------------------------------
;; * [2013-11-03 日]
(provide 'my-rename-file-and-buffer)
;; ----------------------------------------------------------------------
