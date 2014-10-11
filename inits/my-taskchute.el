;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-taskchute.el

;; ======================================================================
;; * [2014-10-10 金]
;; - タスクシュートの「常に仕事の終わる時刻をリアルタイムに把握する」 org-mode で実現できたらいいな。
;; - cf. https://www.evernote.com/shard/s5/nl/409467/31f3b6e5-10de-417a-a467-fec734f44235
;; - 実現方法
;;   - org-agenda-mode で . (org-agenda-goto-today) に hook してトリガーを引く。
;; http://orgmode.org/org.html#Column-attributes
;; http://orgmode.org/worg/org-tutorials/org-column-view-tutorial.html
;; ----------------------------------------------------------------------

(defun my-taskchute-unittest ()
  ""
  (interactive)
  (find-file "~/.emacs.d/memo/sample.org.txt")
  (org-agenda-file-to-front)
  (org-agenda-list)
  (org-agenda-day-view)
  (save-excursion
    (setq org-columns-default-format "%33ITEM %TODO %3PRIORITY %TAGS %17Effort{:} %CLOCKSUM %CLOCKSUM_T")
    (org-agenda-columns)
    (search-forward "TODO")
    )
  )

(define-key global-map (kbd "<non-convert> a") 'my-taskchute-unittest)
