p;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; ----------------------------------------------------------------------
;; * [2010-11-04 月]
;; インストール。
;; cf. WEB+DEB PRESS Vol.58 p.80 color-moccur 検索結果をリストアップ
;; 記事では auto-install を使っているが、今は package がある。
(when (require 'color-moccur nil t)
  (progn
    (define-key global-map (kbd "M-s M-c") 'occur-by-moccur)
    (define-key global-map (kbd "M-s M-m") 'moccur)
    (define-key global-map (kbd "M-s M-g") 'moccur-grep)
    (define-key global-map (kbd "M-s M-f") 'moccur-grep-find)
    (define-key global-map (kbd "M-s M-d") 'dmoccur)
    (setq moccur-split-word t) ;; スペース区切りで AND 検索
    ;; dmoccur-exclusion-mask ディレクトリ検索のとき除外するファイル
    (add-to-list 'dmoccur-exclusion-mask "\\.DS_Store")
    (add-to-list 'dmoccur-exclusion-mask "^#.+#$")
    (add-to-list 'dmoccur-exclusion-mask ".svn")
    (add-to-list 'dmoccur-exclusion-mask ".git")
    )
  )
