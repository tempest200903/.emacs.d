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
  (interactive "*")
  (when (equal arg 4)   (progn (insert-for-yank (concat "《" (current-kill 0) "》")))
        (equal arg 16) (progn (insert-for-yank (concat "〔" (current-kill 0) "〕")))
        (progn (insert-for-yank (concat "〔" (current-kill 0) "〕")))
        )
  )
(global-set-key (kbd "C-z C-c C-y") 'my-insert-shell-bracket)
;; ----------------------------------------------------------------------
;; * [2011-08-25 木] org-mouse-yank-link と同じことをキーボードで行う。
(defun my-org-yank-link-arg (&optional arg)
  (interactive "*P")
  (when (equal arg 4)  (call-interactively 'my-org-yank-link)
        (equal arg 16) (call-interactively 'my-org-yank-file-link)
        )) ;; 未完成
(defun my-org-yank-link () 
  (interactive "*")
  (progn (insert-for-yank (concat "[[" (current-kill 0) "]]")))
  )
(defun my-org-yank-file-link () 
  (interactive "*")
  (progn (insert-for-yank (concat "[[file:" (current-kill 0) "]]")))
  )
