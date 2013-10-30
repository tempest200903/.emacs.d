;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-bm-package.el
;; =============================================================================
;; インストール手順
;; M-x package-list-packages
;; bm を選択して install ボタンをクリックする。
;; 
(add-to-list 'load-path "~/.emacs.d/vendor/elpa/bm-1.53")
(when (not (require 'bm nil t))
  (progn
    (message "require package false")
    (when (require 'package nil t)
      (progn
        (package-install 'bm)
        )
      )
    )
  )
(when (require 'bm nil t)
  (progn
    (message "require package true")
    (global-set-key (kbd "M-g M-t") 'bm-toggle)
    (global-set-key (kbd "M-g M-]") 'bm-next)
    (global-set-key (kbd "M-g M-[") 'bm-previous)
    (global-set-key (kbd "M-g M-r") 'bm-bookmark-regexp)
    (global-set-key (kbd "M-g M-i") 'bm-show)
    (global-set-key (kbd "M-g M-I") 'bm-show-all)
    (global-set-key (kbd "M-g 0 M-i") 'bm-remove-all-current-buffer)
    (global-set-key (kbd "M-g 0 M-o") 'bm-remove-all-all-buffers)
    (global-set-key (kbd "M-g M-a") 'bm-bookmark-annotate)
    )
  )
(defun my-bm-tips () ""
  (message "- 長所。emacs 標準付属の bookmark-set コマンドではできないことができる。"
           "  - 非ファイルバッファを bookmark する。"
           "- 使い方"
           "  - M-x bm-toggle ブックマーク トグル"
           "  - M-x bm-next 次のブックマークへジャンプ"
           "  - M-x bm-previous 前のブックマークへジャンプ"
           "  - M-x bm-bookmark-regexp 正規表現にマッチする行を全てブックマークする"
           "  - bm-cycle-all-buffers t にすると 全てのバッファを巡回する。 TODO C-u M-x bm-next で一時的に t にするコマンドを作る。"
           )
  (popwin:messages)
  )
;; ----------------------------------------------------------------------
;; * [2012-05-31 木] customize
;; (setq bm-buffer-persistence t) ;; *Specify if bookmarks in a buffer should be persistent.
