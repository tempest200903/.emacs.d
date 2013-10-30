;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2013-02-07
;; ============================================================
;; * [2013-02-07 木] 
;; - url: http://d.hatena.ne.jp/syohex/20130202/1359814263

;; direx
(when (not (require 'direx nil t))
  (progn
    (auto-install-from-url "https://raw.github.com/m2ym/direx-el/master/direx.el")
    (auto-install-from-url "https://raw.github.com/m2ym/direx-el/master/direx-project.el")
    )
  )
(when (require 'direx nil t)
  (progn
    (defun my/dired-jump ()
      (interactive)
      (cond (current-prefix-arg
             (dired-jump))
            ((not (one-window-p))
             (or (ignore-errors
                   (direx-project:jump-to-project-root) t)
                 (direx:jump-to-directory)))
            (t
             (or (ignore-errors
                   (direx-project:jump-to-project-root-other-window) t)
                 (direx:jump-to-directory-other-window)))))

    (global-set-key (kbd "C-x C-j") 'my/dired-jump)

    ;; widthは環境に合わせて調整してください。
    (push '(direx:direx-mode :position left :width 40 :dedicated t)
          popwin:special-display-config)
    )
  )
;; direx を install すると anything が動作しないなどの障害が出る。使用中止する。
