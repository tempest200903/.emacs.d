;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-anything-migemo.el
;; ======================================================================
;; * [2013-10-03 木] http://d.hatena.ne.jp/Tan90909090/20120928/1348765648
;; (require 'anything-migemo)
;; (setq my-anything-sources
;;       '(
;;         ;; 色々な情報源
;;         ))
;; (global-set-key (kbd "C-;")
;;                 (lambda()
;;                   (interactive)
;;                   (anything-migemo t my-anything-sources)))
;; ----------------------------------------------------------------------
(when (not (require 'anything-migemo nil t))
  (progn
    (install-elisp-from-emacswiki "anything-migemo.el")
    )
  )
;; n:/tool/gnupack/gnupack_devel-11.00/home/.emacs.d/auto-install/anything-migemo.el
;;
(when (require 'anything-migemo nil t)
  (progn
    (setq my-anything-sources-migemo
          '(
            ;; 色々な情報源
            anything-c-source-occur ;; カレントバッファを occur する。常に末尾に表示される。
            ))
    (defun my-anything-migemo () ""
      (interactive)
      (anything-migemo t my-anything-sources-migemo)
      )
    ;; (global-set-key (kbd "C-;") 'my-anything-migemo)
    )
  )
;; [2013-10-03 木] 未完成！ M-x my-anything-migemo しても何も出てこない。
