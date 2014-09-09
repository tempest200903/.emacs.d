;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-org-mode-hyperlink.el
;; ======================================================================
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
(defun my-insert-shell-bracket (&optional arg)
  (interactive "p")
  (if (equal arg 4) (my-org-yank-DOUBLE-ANGLE-BRACKET)
    (my-org-yank-TORTOISE-SHELL-BRACKET)
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
(defun my-org-yank-link-arg (&optional arg) "my-org-yank-link or my-org-yank-file-link"
  (interactive "p")
  (cond
   ((equal arg 4) (my-org-yank-file-link))
   ((equal arg 16) (my-org-yank-shell-link))
   (t (my-org-yank-link)))
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
;; TODO 
;; input: \\fileserver\a\b.xls
;; output: [[shell:cmd /c N:\\work\\myscript\\dos\\fileserver-localopen.bat \\\\fileserver\\a\\b.xls]]
;; もしくは
;; output: [[elisp:fileserver-localopen \\\\fileserver\\a\\b.xls]]
;; defun fileserver-localopen を別途定義する。
;; ----------------------------------------------------------------------
;; * [2014-09-08 月 13:20] TODO
;; パスが \\filserver\a\b\c である場合、
;; [[shell:cygstart \\\\a\\b\\c][\\filserver\a\b\c]] 形式に変換する。
;; ----------------------------------------------------------------------
(provide 'my-org-mode-hyperlink)
;; ----------------------------------------------------------------------
