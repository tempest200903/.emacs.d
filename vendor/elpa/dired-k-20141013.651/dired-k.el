;;; dired-k.el --- highlight dired buffer by file size, modified time, git status -*- lexical-binding: t; -*-

;; Copyright (C) 2014 by Syohei YOSHIDA

;; Author: Syohei YOSHIDA <syohex@gmail.com>
;; URL: https://github.com/syohex/emacs-dired-k
;; Version: 0.11
;; Package-Requires: ((cl-lib "0.5") (emacs "24"))

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This package provides highlighting dired buffer like k.sh which is
;; zsh script.
;;
;; Example usage:
;;
;;   (require 'dired-k)
;;   (define-key dired-mode-map (kbd "K") 'dired-k)
;;

;;; Code:

(require 'cl-lib)
(require 'dired)

(defgroup dired-k nil
  "k.sh in dired"
  :group 'dired)

(defcustom dired-k-style nil
  "Style for representing git status"
  :type '(choice (const :tag "k.sh style" nil)
                 (const :tag "Like 'git status --short'" git))
  :group 'dired-k)

(defcustom dired-k-human-readable nil
  "Use human readable size format option."
  :type 'boolean
  :group 'dired-k)

(defface dired-k-modified
  '((t (:foreground "red" :weight bold)))
  "Face of modified file in git repository"
  :group 'dired-k)

(defface dired-k-commited
  '((t (:foreground "green" :weight bold)))
  "Face of commited file in git repository"
  :group 'dired-k)

(defface dired-k-added
  '((t (:foreground "magenta" :weight bold)))
  "Face of added file in git repository"
  :group 'dired-k)

(defface dired-k-untracked
  '((t (:foreground "orange" :weight bold)))
  "Face of untracked file in git repository"
  :group 'dired-k)

(defface dired-k-ignored
  '((t (:foreground "cyan" :weight bold)))
  "Face of ignored file in git repository"
  :group 'dired-k)

(defface dired-k-directory
  '((t (:foreground "blue")))
  "Face of directory"
  :group 'dired-k)

(defcustom dired-k-size-colors
  '((1024 . "chartreuse4") (2048 . "chartreuse3") (3072 . "chartreuse2")
    (5120 . "chartreuse1") (10240 . "yellow3") (20480 . "yellow2") (40960 . "yellow")
    (102400 . "orange3") (262144 . "orange2") (524288 . "orange"))
  "assoc of file size and color"
  :type '(repeat (cons (integer :tag "File size")
                       (string :tag "Color")))
  :group 'dired-k)

(defcustom dired-k-date-colors
  '((0 . "red") (60 . "white") (3600 . "grey80")
    (86400 . "grey70") (604800 . "grey40") (2419200 . "grey40")
    (15724800 . "grey30") (31449600 . "grey25") (62899200 . "grey10"))
  "assoc of file modified time and color"
  :type '(repeat (cons (integer :tag "Elapsed seconds from last modified")
                       (string :tag "Color")))
  :group 'dired-k)

(defsubst dired-k--git-status-color (stat)
  (cl-case stat
    (modified 'dired-k-modified)
    (normal 'dired-k-commited)
    (added 'dired-k-added)
    (untracked 'dired-k-untracked)
    (ignored 'dired-k-ignored)))

(defsubst dired-k--decide-status (status)
  (cond ((string= status " M") 'modified)
        ((string= status "??") 'untracked)
        ((string= status "!!") 'ignored)
        ((string= status "A ") 'added)
        (t 'normal)))

(defsubst dired-k--subdir-status (current-status new-status)
  (cond ((eq current-status 'modified) 'modified)
        ((eq new-status 'added) 'added)
        ((not current-status) new-status)
        (t 'normal)))

(defun dired-k--is-in-child-directory (here path)
  (let ((relpath (file-relative-name path here)))
    (string-match-p "/" relpath)))

(defun dired-k--child-directory (here path)
  (let ((regexp (concat here "\\([^/]+\\)")))
    (when (string-match regexp path)
      (concat here (match-string 1 path)))))

(defun dired-k--fix-up-filename (file)
  ;; If file name contains spaces, then it is wrapped double quote.
  (if (string-match "\\`\"\\(.+\\)\"\\'" file)
      (match-string-no-properties 1 file)
    file))

(defun dired-k--parse-git-status (root proc deep)
  (with-current-buffer (process-buffer proc)
    (goto-char (point-min))
    (let ((files-status (make-hash-table :test 'equal))
          (here (expand-file-name default-directory)))
      (while (not (eobp))
        (let* ((line (buffer-substring-no-properties
                      (line-beginning-position) (line-end-position)))
               (status (dired-k--decide-status (substring line 0 2)))
               (file (substring line 3))
               (full-path (concat root (dired-k--fix-up-filename file))))
          (if (and (not deep) (dired-k--is-in-child-directory here full-path))
              (let* ((subdir (dired-k--child-directory here full-path))
                     (cur-status (gethash subdir files-status)))
                (puthash subdir (dired-k--subdir-status cur-status status)
                         files-status))
            (puthash full-path status files-status)))
        (forward-line 1))
      files-status)))

(defsubst dired-k--process-buffer ()
  (get-buffer-create (format "*dired-k-%s*" dired-directory)))

(defun dired-k--start-git-status (cmds root proc-buf callback)
  (let ((curbuf (current-buffer))
        (deep (not (eq major-mode 'dired-mode)))
        (old-proc (get-buffer-process proc-buf)))
    (when (and old-proc (process-live-p old-proc))
      (kill-process old-proc))
    (with-current-buffer proc-buf
      (erase-buffer))
    (let ((proc (apply 'start-process "dired-k-git-status" proc-buf cmds)))
      (set-process-query-on-exit-flag proc nil)
      (set-process-sentinel
       proc
       (lambda (proc _event)
         (when (eq (process-status proc) 'exit)
           (let ((stats (dired-k--parse-git-status root proc deep)))
             (funcall callback stats curbuf)
             (kill-buffer proc-buf))))))))

(defsubst dired-k--root-directory ()
  (expand-file-name (locate-dominating-file default-directory ".git/")))

(defsubst dired-k--git-style-char (stat)
  (cl-case stat
    (modified (propertize "M " 'face 'dired-k-modified))
    (added (propertize "A " 'face 'dired-k-added))
    (untracked (propertize "??" 'face 'dired-k-untracked))
    (otherwise "  ")))

(defun dired-k--highlight-line-normal (stat)
  (let ((ov (make-overlay (1- (point)) (point)))
        (stat-face (dired-k--git-status-color stat)))
    (overlay-put ov 'display (propertize "|" 'face stat-face))))

(defun dired-k--highlight-line-git-like (stat)
  (goto-char (line-beginning-position))
  (let ((ov (make-overlay (point) (+ (point) 2)))
        (char (dired-k--git-style-char stat)))
    (overlay-put ov 'display char)))

(defun dired-k--highlight-line (file stats)
  (let ((stat (gethash file stats 'normal)))
    (unless (and (file-directory-p file) (eq stat 'normal))
      (cl-case dired-k-style
        (git (dired-k--highlight-line-git-like stat))
        (otherwise (dired-k--highlight-line-normal stat))))))

(defun dired-k--highlight-git-information (stats buf)
  (with-current-buffer buf
    (save-excursion
      (goto-char (point-min))
      (dired-next-line 2)
      (while (not (eobp))
        (let ((filename (dired-get-filename nil t)))
          (when filename
            (dired-k--highlight-line filename stats)))
        (dired-next-line 1)))))

(defsubst dired-k--size-face (size)
  (cl-loop for (border . color) in dired-k-size-colors
           when (< size border)
           return `((:foreground ,color :weight bold))
           finally
           return '((:foreground "red" :weight bold))))

(defsubst dired-k--date-face (modified-time)
  (cl-loop with current-time = (float-time (current-time))
           with diff = (- current-time modified-time)
           for (val . color) in dired-k-date-colors
           when (< diff val)
           return `((:foreground ,color :weight bold))
           finally
           return '((:foreground "grey50" :weight bold))))

(defun dired-k--highlight-by-size (size start end)
  (let ((ov (make-overlay start end))
        (size-face (dired-k--size-face size)))
    (overlay-put ov 'face size-face)))

(defun dired-k--highlight-by-date (modified-time start end)
  (let* ((ov (make-overlay start end))
         (size-face (dired-k--date-face (float-time modified-time))))
    (overlay-put ov 'face size-face)))

(defsubst dired-k--size-to-regexp (size)
  (concat "\\_<" (number-to-string size) "\\_>"))

(defun dired-k--highlight-directory ()
  (save-excursion
    (back-to-indentation)
    (when (eq (char-after) ?d)
      (let ((ov (make-overlay (point) (1+ (point)))))
        (overlay-put ov 'face 'dired-k-directory)))))

(defun dired-k--move-to-file-size-column ()
  (goto-char (line-beginning-position))
  (dotimes (i 4)
    (skip-chars-forward " ")
    (skip-chars-forward "^ "))
  (skip-chars-forward " "))

(defun dired-k--highlight-by-file-attribyte ()
  (save-excursion
    (goto-char (point-min))
    (dired-next-line 2)
    (while (not (eobp))
      (let* ((file-attrs (file-attributes (dired-get-filename nil t)))
             (modified-time (nth 5 file-attrs))
             (file-size (nth 7 file-attrs))
             (date-end-point (1- (point)))
             end)
        (dired-k--highlight-directory)
        (when file-size
          (if dired-k-human-readable
              (progn
                (dired-k--move-to-file-size-column)
                (let ((start (point)))
                  (skip-chars-forward "^ ")
                  (dired-k--highlight-by-size file-size start (point))))
            (when (re-search-backward (dired-k--size-to-regexp file-size) nil t)
              (dired-k--highlight-by-size file-size (match-beginning 0) (match-end 0))))
          (skip-chars-forward "^ \t")
          (skip-chars-forward " \t")
          (dired-k--highlight-by-date modified-time (point) date-end-point))
        (dired-next-line 1)))))

(defun dired-k--inside-git-repository-p ()
  (with-temp-buffer
    (when (zerop (call-process "git" nil t nil "rev-parse" "--is-inside-work-tree"))
      (goto-char (point-min))
      (string= "true" (buffer-substring-no-properties
                       (point) (line-end-position))))))

(defun dired-k--highlight ()
  (revert-buffer nil t)
  (save-excursion
    (dired-k--highlight-by-file-attribyte)
    (when (dired-k--inside-git-repository-p)
      (let ((root (dired-k--root-directory)))
        (when root
          (dired-k--start-git-status
           '("git" "status" "--porcelain" "--ignored" "--untracked-files=normal" ".")
           root (dired-k--process-buffer)
           'dired-k--highlight-git-information))))))

;;;###autoload
(defun dired-k ()
  "Highlighting dired buffer by file size, last modified time, and git status.
This is inspired by `k' zsh script"
  (interactive)
  (dired-k--highlight))

(provide 'dired-k)

;;; dired-k.el ends here
