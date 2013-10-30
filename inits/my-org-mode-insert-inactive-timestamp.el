;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; ======================================================================
;; * [2010-11-15 月]
;; http://hpcgi1.nifty.com/spen/?OrgMode%2FOrganize_Your_Life_In_Plain_Text!%282%29
;; 私は「M-RET」または「M-S-RET」で見出しを作成したときはいつでも、その
;; hookによってその機能が発動し、次のように不活性なタイムスタンプが挿入
;; されます
;; * [2012-01-31 火] export すると timestamp が邪魔なので、 drawer LOGBOOK に収納する。
(defun my-insert-inactive-timestamp ()
  "不活性なタイムスタンプを挿入する。"
  (interactive)
  (save-excursion
    (insert "\n")
    (org-cycle)
    (insert ":LOGBOOK:")
    (org-return-indent)
    (insert "TIMESTAMP: ")
    (org-insert-time-stamp nil t t nil nil nil)
    (org-return-indent)
    (insert ":END:")
    )
  )
(add-hook 'org-insert-heading-hook 'my-insert-inactive-timestamp)
