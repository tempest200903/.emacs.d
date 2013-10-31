;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-moccur-edit.el
;; =============================================================================
;; * [2012-08-06 月] 50.6 すべてのバッファを検索し，編集したい ― moccur-edit (2008/07/29)
;; http://www.bookshelf.jp/soft/meadow_50.html#SEC769
;; http://qiita.com/icb54615/items/8cacf69fbcc7fc4f2ea5
;; ** インストール手順 以下のS式を eval
;; (when (not (require 'moccur-edit nil t))
;;   (when (require 'auto-install nil t)
;;     (auto-install-from-url "http://www.bookshelf.jp/elc/moccur-edit.el")
;;     )
;;   )
;; または
;; (install-elisp-from-emacswiki "http://www.emacswiki.org/emacs/moccur-edit.el")
(when (require 'moccur-edit nil t)
  (message
   "(moccur-edit-mode-in) It is bound to r, C-x C-q, C-c TAB. バッファが編集できるようになります．"
   "(moccur-edit-finish-edit) It is bound to C-x C-s, C-c C-c, C-c C-f. 編集を適用する"
   "(moccur-edit-remove-change BEG END) It is bound to C-c C-r. リージョンで選択した部分をの変更は適用されなくなります．"
   )
  )
