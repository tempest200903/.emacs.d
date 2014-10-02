;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-org-mode-hyperlink.el
;; ======================================================================

(require 'my-prefix-arg-commands)

;; * [2011-07-08 金] "Convert to Link" 
;; cf. n:/tool/emacs-23.2/site-lisp/org-7.3/lisp/org-mouse.el defun org-mouse-context-menu
;; リージョン選択してから <MOUSE-3> を押すとポップアップメニューが出る。
;; このメニューの "convert to link" と同じことをキーボードで起動したい。
(defun my-org-convert-to-link () 
  (interactive "*")
  (progn (save-excursion (goto-char (region-beginning)) (insert "[["))
         (save-excursion (goto-char (region-end)) (insert "]]")))
  )
;; ----------------------------------------------------------------------
;; * [2011-07-08 金] 〔〕 を挿入する。 org-mode とは関係ないので独立させる。 anything で選択式にしてほしい。
(prefix-arg-commands-create my-insert-shell-bracket
                            '(my-org-yank-TORTOISE-SHELL-BRACKET
                              my-org-yank-DOUBLE-ANGLE-BRACKET
                              )
                            )

(defun my-org-yank-DOUBLE-ANGLE-BRACKET ()  "前後に 《 と 》 をつけて yank する。"
  (interactive "*")
  (progn (insert-for-yank (concat "《" (current-kill 0) "》")))
  )

(defun my-org-yank-TORTOISE-SHELL-BRACKET () "前後に 〔 と 〕 をつけて yank する。"
  (interactive "*")
  (progn (insert-for-yank (concat "〔" (current-kill 0) "〕")))
  )

;; TODO my-yank-special.el にも類似のコマンドがある。マージするべし。

;; ----------------------------------------------------------------------
;; * [2011-08-25 木] org-mouse-yank-link と同じことをキーボードで行う。
;; C-u なし my-org-yank-link; C-u 1回 my-org-yank-file-link; C-u 2回 my-org-yank-shell-link
(prefix-arg-commands-create my-org-yank-link-univ
                            '(my-org-yank-link
                              my-org-yank-file-link
                              my-org-yank-shell-link
                              )
                            )
(defun my-org-yank-link ()  "前後に [[ と ]] をつけて yank する。"
  (interactive "*")
  (progn (insert-for-yank (concat "[[" (current-kill 0) "]]")))
  )
(defun my-org-yank-file-link () "前後に [[file: と ]] をつけて yank する。"
  (interactive "*")
  (progn (insert-for-yank (concat "[[file:" (current-kill 0) "]]")))
  )
(defun my-org-yank-shell-link () "前後に [[shell:cygstart と ]] をつけて yank する。"
  (interactive "*")
  (progn (insert-for-yank (concat "[[shell:cygstart " (current-kill 0) "]]")))
  )
;; ----------------------------------------------------------------------
;; * [2014-09-08 月 13:10] TODO fileserver-localopen.bat で開くリンクを挿入する。
;; input: \\fileserver\a\b.xls
;; output: [[shell:cmd /c N:\\work\\myscript\\dos\\fileserver-localopen.bat \\\\fileserver\\a\\b.xls]]
;; もしくは
;; output: [[elisp:fileserver-localopen \\\\fileserver\\a\\b.xls]]
;; defun fileserver-localopen を別途定義する。
;; ----------------------------------------------------------------------
;; * [2014-09-08 月 13:20] TODO \\filserver を変換する。
;; パスが \\filserver\a\b\c である場合、
;; [[shell:cygstart \\\\a\\b\\c][\\filserver\a\b\c]] 形式に変換する。
;; ----------------------------------------------------------------------
;; * [2014-09-19 金 11:32] TODO 
;; my-org-yank-link-arg などで入力文字列末尾に改行文字がある場合は chomp する。
;; echo-args-clip.bat バッチファイルで @echo %*|clip のようにすると末尾に改行文字がついてしまう。
;; チケットやメールなど外部からマウスでコピーすると末尾に改行文字がついてしまう。

;; ----------------------------------------------------------------------
;; * [2014-10-02 木] TODO - [[elisp:(moccur "WORK" nil)]] を yank するコマンド。

(defun my-org-yank-elisp-moccur-link () "前後に [[elisp:(moccur と ]] をつけて yank する。"
  (interactive "*")
  (progn (insert-for-yank (concat "[[elisp:(progn (moccur \"" (current-kill 0) "\" nil))]]")))
  )

;; ----------------------------------------------------------------------
(provide 'my-org-mode-hyperlink)
;; ----------------------------------------------------------------------
