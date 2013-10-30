;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; * [2011-12-14 水] viewer.el
;; http://d.hatena.ne.jp/rubikitch/20111211/smalldisplay
;; おまけ viewer.elでview-modeの使い勝手をさらに高めることができます。
;; M-x install-elisp-from-emacswiki viewer.el
;; でインストールし、以下の設定を加えてください。
;; (require 'viewer)
;; ;; 書き込めないファイルは常にview-mode
;;(viewer-stay-in-setup)
;; ;; view-modeのときはモードラインの色を変える
;; (setq viewer-modeline-color-unwritable "tomato"
;;       viewer-modeline-color-view "orange")
;; (viewer-change-modeline-color-setup)
;;
(when (require 'view nil t)
  (progn
    (when (not (require 'viewer nil t))
      (progn
        (install-elisp-from-emacswiki "viewer.el")
        )
      )
    (when (require 'viewer nil t)
      (progn
        ;; 書き込めないファイルは常にview-mode
        (viewer-stay-in-setup)
        ;; view-modeのときはモードラインの色を変える
        (setq viewer-modeline-color-unwritable "tomato"
              viewer-modeline-color-view "orange")
        (viewer-change-modeline-color-setup)
        ;; web browser と同様のキー割り当てにする。
        (define-key view-mode-map (kbd "S-SPC") 'View-scroll-page-backward)
        (define-key view-mode-map (kbd "b") 'View-scroll-page-backward)
        ;; homw-mode の <return> action-lock-magic-return が上書きされるので、別の解を用意する。
        (define-key view-mode-map (kbd "<S-return>") 'action-lock-magic-return)
        )
      )
))
