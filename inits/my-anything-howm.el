;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2014-10-02
;; my-anything-howm.el
;; ======================================================================
;; * [2014-10-02 木] howm の anything インターフェース
;; https://github.com/mori-dev/anything-howm
;; http://d.hatena.ne.jp/kitokitoki/20110103/p1
;; ~/.emacs.d/auto-install/anything-howm.el
;;

(when nil

  (when (not (require 'anything-howm nil t))
    (if (require 'my-auto-install nil t)
        (auto-install-from-url "https://raw.githubusercontent.com/mori-dev/anything-howm/master/anything-howm.el")
      (message "need my-auto-install to intall anything-howm")
      )
    )
  (when
      (and
       (require 'anything-howm nil t)
       (require 'anything-config nil t)
       )

    (defun my-anything-buffers-howm-title ()
      (interactive)
      (anything-other-buffer
       '(
         ;; anything-c-source-buffers  ;;これをやめて
         anything-c-source-buffers+-howm-title ;;これを追加
         ;;       anything-c-source-recentf ;;など
         ;; ...
         )
       "*Buffer+File*"))

    (global-set-key (kbd "C-t C-j") 'my-anything-buffers-howm-title)

    ;; 「最近のメモ」をいくつ表示するか
    (setq anything-howm-recent-menu-number-limit 20)

    ;; (global-set-key (kbd "C-2") 'anything-howm-menu-command)
    ;; (global-set-key (kbd "C-3") 'anything-cached-howm-menu)

    ;; howm のデータディレクトリへのパス
    (setq anything-howm-data-directory "f:/goat-pc-data/mydropbox/Dropbox/trunksync/notes")

    )

  )

;; 不具合1 M-x howm-menu で作った *howmM* buffer が存在すると失敗する。
;; (add-hook 'howm-mode-hook 'howm-mode-set-buffer-name) でバッファ名を変更して anything-buffers+ すれば十分。
