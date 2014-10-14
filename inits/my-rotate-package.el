;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2014-09-14
;; my-rotate-package.el
;; 関連 my-rotate-keymap-autoload.el
;; ======================================================================
;; * [2014-09-10 水] rotate 導入
;; - (package-require 'rotate nil nil t) を eval する。
;; http://a-newcomer.com/56
;; https://github.com/daic-h/emacs-rotate
;; ----------------------------------------------------------------------
(when (package-require 'rotate nil nil t)

  (defun my-rotate-window-or-layout-or-tiled (&optional arg)
    "no arg rotate-window, arg rotate-layout, double arg rotate:tiled."
    (interactive "p")
    (cond
     ((equal arg 4) (my-toggle-window-split))
     ((equal arg 16) (rotate:tiled))
     ((equal arg 64) (rotate-layout))
     (t (rotate-window))
     )
    (my-shrink-other-window-if-larger-than-buffer)
    )

  (defun my-rotate-horizontal (&optional arg)
    "no arg rotate:main-horizontal, arg rotate:even-horizontal."
    (interactive "p")
    (cond
     ((equal arg 4) (rotate:even-horizontal))
     (t (rotate:main-horizontal))
     )
    )

  (defun my-rotate-vertical (&optional arg)
    "no arg rotate:main-vertical, arg rotate:even-vertical."
    (interactive "p")
    (cond
     ((equal arg 4) (rotate:even-vertical))
     (t (rotate:main-vertical))
     )
    )

  )

;; ----------------------------------------------------------------------
;; * [2014-09-16 火] http://whattheemacsd.com/
;; http://whattheemacsd.com/
(defun my-toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
             (next-win-buffer (window-buffer (next-window)))
             (this-win-edges (window-edges (selected-window)))
             (next-win-edges (window-edges (next-window)))
             (this-win-2nd (not (and (<= (car this-win-edges)
                                         (car next-win-edges))
                                     (<= (cadr this-win-edges)
                                         (cadr next-win-edges)))))
             (splitter
              (if (= (car this-win-edges)
                     (car (window-edges (next-window))))
                  'split-window-horizontally
                'split-window-vertically)))
        (delete-other-windows)
        (let ((first-win (selected-window)))
          (funcall splitter)
          (if this-win-2nd (other-window 1))
          (set-window-buffer (selected-window) this-win-buffer)
          (set-window-buffer (next-window) next-win-buffer)
          (select-window first-win)
          (if this-win-2nd (other-window 1))))))

;; ----------------------------------------------------------------------
(provide 'my-rotate-package)
;; ----------------------------------------------------------------------
