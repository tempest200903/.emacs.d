;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-org-mode-hilight.el
;; ======================================================================
;; * [2014-10-18 土] 

(defun my-org-mode-hilight-category ()
  "カテゴリをハイライトする"
  (interactive)
  (unhighlight-regexp "〈[^〉]*〉")
  (unhighlight-regexp "〔[^〕].*〕")
  (highlight-regexp "〈[^〉]*〉" "hi-blue")
  (highlight-regexp "〔[^〕].*〕" "hi-pink")
  )
;; * [2014-10-18 土] TODO 2回実行で unhighlight-regexp 。トグルする。

(define-key org-agenda-mode-map (kbd "M-s h c") 'my-org-mode-hilight-category)

(when nil
  (add-hook 'org-agenda-after-show-hook 'my-org-mode-hilight-category) ; 実験中。効果なし？
  )
