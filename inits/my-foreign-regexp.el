;; -*- coding: utf-8-unix; mode: Emacs-Lisp; mode: orgtbl -*-
;; my-foreign-regexp.el
;; #+LAST_UPDATED: 2014-09-15
;; ======================================================================
;; * [2014-09-26 金] install
;; http://qiita.com/catatsuy/items/55d50d13ebc965e5f31e
;; ~/.emacs.d/vendor/elpa/foreign-regexp-readme.txt
;; ----------------------------------------------------------------------
(when (package-require 'foreign-regexp)
  (require 'bind-key)
  (custom-set-variables
   '(foreign-regexp/regexp-type 'perl)
   '(reb-re-syntax 'foreign-regexp))
  (bind-key "M-r" 'foreign-regexp/query-replace search-map) ; M-s M-r
  )
;; ----------------------------------------------------------------------
;; keybind
;; global-map とバッティングしている。
;; my-keymap-basis.el の方を変更する。
;; ~/.emacs.d/keymap/foreign-regexp-search-map.txt
;; ~/.emacs.d/keymap/global-map.txt
" 
| コマンド                  | 変更前      | 変更後      | 補足                                                      |
| org-occur-in-agenda-files | M-s M-a     | M-s a       |                                                           |
| moccur-grep-find          | M-s M-f     | M-s M-g M-f |                                                           |
| moccur-grep               | M-s M-g     | M-s M-g M-g |                                                           |
| moccur                    | M-s M-m     | M-s M-g M-m |                                                           |
| occur                     | M-s M-m     | M-s M-g M-o | M-s M-o foreign-regexp/occur のほうが使用頻度高いだろう。 |
| vr/query-replace          | M-s M-r     | M-s M-v M-q |                                                           |
| vr/replace                | M-s M-v     | M-s M-v M-r | vr/query-replace にあわせる。                             |
| my-kill-buffer-file-name  | M-s M-x     | C-z f       |                                                           |
| query-replace-regexp      | M-s M-s M-q | M-s M-g M-q | foreign-regexp/query-replace のほうが使用頻度高いだろう。 |
| loccur など               | M-s M-l M-c |             | M-s M-l re-builder と衝突していた。                       |
"
;; ----------------------------------------------------------------------
;; * [2014-09-26 金] TODO autoload my-foreign-regexp.el
