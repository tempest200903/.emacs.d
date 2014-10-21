;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-yank-special.el
;; 入力支援自作コマンド。
;; =============================================================================

(require 'my-prefix-arg-commands)

;; ----------------------------------------------------------------------
;; * [2011-10-31 月] 入力支援
;; DONE my-yank-special.el として独立させる。
;; DONE キーバインド体系を見直す。括弧関連は末尾が [, ], クォート関連は末尾が ", ' など。
;; DONE if mark-active 先に選択リージョンを kill-region する。
;; DONE リファクタリング。関数を抽出する。
;; TODO (current-kill 0) の末尾にだけ改行コードがある場合、改行コードを除去する。
;; TODO カッコをつけたり外したりするコマンドがほしい。特に <!--   -->. 参考: Eclipse の C-/
;; TODO 入力文字列が"〔abc〕" であるとき、 C-u M-x my-yank-with-ANGLE-BRACKET で "〈abc〉" を出力したい。
;; ----------------------------------------------------------------------
(defun my-yank-with-bracket (bracket-left bracket-right) "yank with bracket"
  (if mark-active (kill-region (region-beginning) (region-end)))
  (insert-for-yank (concat bracket-left (current-kill 0) bracket-right))
  )
(defun my-yank-with-PARENTHESIS () "yank with ()"
  (interactive "*")
  (my-yank-with-bracket "(" ")")
  )
(defun my-yank-with-CURLY-BRACKET () "yank with {}"
  (interactive "*")
  (my-yank-with-bracket "{" "}")
  )
(defun my-yank-with-TORTOISE-SHELL-BRACKET () "yank with 〔〕"
  (interactive "*")
  (my-yank-with-bracket "〔" "〕")
  )
(defun my-yank-with-CORNER-BRACKET () "yank with 「」"
  (interactive "*")
  (my-yank-with-bracket "「" "」")
  )
(defun my-yank-with-WHITE-CORNER-BRACKET () "yank with 『』"
  (interactive "*")
  (my-yank-with-bracket "『" "』")
  )
(defun my-yank-with-QUOTATION-MARK () "yank with \"\""
  (interactive "*")
  (my-yank-with-bracket "\"" "\"")
  )
(defun my-yank-with-APOSTROPHE () "yank with ''"
  (interactive "*")
  (my-yank-with-bracket "'" "'")
  )
(defun my-yank-with-BLACK-LENTICULAR-BRACKET () "yank with 【】"
  (interactive "*")
  (my-yank-with-bracket "【" "】")
  )
(defun my-yank-with-ANGLE-BRACKET () "yank with 〈〉"
  (interactive "*")
  (my-yank-with-bracket "〈" "〉")
  )
(defun my-yank-with-DOUBLE-ANGLE-BRACKET () "yank with 《》"
  (interactive "*")
  (my-yank-with-bracket "《" "》")
  )
(defun my-yank-with-SQUARE-BRACKET () "yank with []"
  (interactive "*")
  (my-yank-with-bracket "[" "]")
  )
(defun my-yank-with-xml-comment () "yank with <!--  -->"
  (interactive "*")
  (my-yank-with-bracket "<!-- " " -->")
  )
(defun my-yank-with-xml-tag () "yank with < >"
  (interactive "*")
  (my-yank-with-bracket "<" ">")
  )

(defun my-yank-with-link-occur () "yank with link occur"
  (interactive "*")
  (my-yank-with-bracket "[[elisp:(occur \"" "\")]]")
  )

(defun my-yank-with-link-moccur () "yank with link moccur"
  (interactive "*")
  (my-yank-with-bracket "[[elisp:(moccur \"" "\" nil)]]")
  )

(defun my-yank-with-link-org-occur () "yank with link org-occur"
  (interactive "*")
  (my-yank-with-bracket "[[elisp:(org-occur-in-agenda-files \"" "\" 1)]]")
  )

(defun my-yank-with-erb-print () "yank with erb print"
  (interactive "*")
  (my-yank-with-bracket "<%= " " %>")
  )

(defun my-yank-with-org-bold () "yank with org bold"
  (interactive "*")
  (my-yank-with-bracket " ＊" "＊ ")
  )

;; ----------------------------------------------------------------------
;; * [2014-08-06 水] org-mode ディレクティブ

(prefix-arg-commands-create my-yank-org-example-arg
                            '(my-yank-org-example
                              my-yank-org-quote
                              my-yank-org-src
                              )
                            )

(defun my-yank-org-example () "前後に #+BEGIN_EXAMPLE と #+END_EXAMPLE をつけて yank する。"
  (interactive "*")
  (my-yank-with-bracket "#+BEGIN_EXAMPLE\n" "\n#+END_EXAMPLE\n")
  )
(defun my-yank-org-quote () "前後に #+BEGIN_QUOTE と #+END_QUOTE をつけて yank する。"
  (interactive "*")
  (my-yank-with-bracket "#+BEGIN_QUOTE\n" "\n#+END_QUOTE\n")
  )
(defun my-yank-org-src () "前後に #+BEGIN_SRC と #+END_SRC をつけて yank する。"
  (interactive "*")
  (my-yank-with-bracket "#+BEGIN_SRC\n" "\n#+END_SRC\n")
  )

;; TODO BEGIN_EXAMPLE など他のディレクティブを追加する。
;; TODO my-yank-special.el にも類似のコマンドがある。マージするべし。
;; TODO yasnippet で実現する。

;; ----------------------------------------------------------------------

(provide 'my-yank-special)
