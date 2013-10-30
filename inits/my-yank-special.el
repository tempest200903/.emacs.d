;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-yank-special.el
;; =============================================================================
;; 入力支援自作コマンド。
;; ----------------------------------------------------------------------
;; * [2011-10-31 月] 入力支援
;; DONE my-yank-special.el として独立させる。
;; DONE キーバインド体系を見直す。括弧関連は末尾が [, ], クォート関連は末尾が ", ' など。
;; DONE if mark-active 先に選択リージョンを kill-region する。
;; DONE リファクタリング。関数を抽出する。

(defun my-yank-with-bracket (bracket-left bracket-right) "yank with bracket"
  (interactive "*")
  (if mark-active (kill-region (region-beginning) (region-end)))
  (insert-for-yank (concat bracket-left (current-kill 0) bracket-right))
  )

(defun my-yank-with-PARENTHESIS () "yank with ()"
  (interactive "*")
  (my-yank-with-bracket "(" ")")
  )
(global-set-key (kbd "C-z C-8") 'my-yank-with-PARENTHESIS)

(defun my-yank-with-CURLY-BRACKET () "yank with {}"
  (interactive "*")
  (my-yank-with-bracket "{" "}")
  )
(global-set-key (kbd "C-z C-9") 'my-yank-with-CURLY-BRACKET)

(defun my-yank-with-TORTOISE-SHELL-BRACKET () "yank with 〔〕"
  (interactive "*")
  (my-yank-with-bracket "〔" "〕")
  )
(global-set-key (kbd "C-z C-3") 'my-yank-with-TORTOISE-SHELL-BRACKET)

(defun my-yank-with-QUOTATION-MARK () "yank with \"\""
  (interactive "*")
  (my-yank-with-bracket "\"" "\"")
  )
(global-set-key (kbd "C-z C-2") 'my-yank-with-QUOTATION-MARK)

(defun my-yank-with-APOSTROPHE () "yank with ''"
  (interactive "*")
  (my-yank-with-bracket "'" "'")
  )
(global-set-key (kbd "C-z C-7") 'my-yank-with-APOSTROPHE)

(defun my-yank-with-BLACK-LENTICULAR-BRACKET () "yank with 【】"
  (interactive "*")
  (my-yank-with-bracket "【" "】")
  )
(global-set-key (kbd "C-z C-0") 'my-yank-with-BLACK-LENTICULAR-BRACKET)

(defun my-yank-with-ANGLE-BRACKET () "yank with 〈〉"
  (interactive "*")
  (my-yank-with-bracket "〈" "〉")
  )
(global-set-key (kbd "C-z C-1") 'my-yank-with-ANGLE-BRACKET)

(defun my-yank-with-DOUBLE-ANGLE-BRACKET () "yank with 《》"
  (interactive "*")
  (my-yank-with-bracket "《" "》")
  )
(global-set-key (kbd "C-z C-4") 'my-yank-with-DOUBLE-ANGLE-BRACKET)

(defun my-yank-with-SQUARE-BRACKET () "yank with []"
  (interactive "*")
  (my-yank-with-bracket "[" "]")
  )
(global-set-key (kbd "C-z C-[ C-]") 'my-yank-with-SQUARE-BRACKET)

(defun my-yank-with-xml-comment () "yank with <!--  -->"
  (interactive "*")
  (my-yank-with-bracket "<!-- " " -->")
  )
(global-set-key (kbd "C-z C-,") 'my-yank-with-xml-comment)

(defun my-yank-with-xml-tag () "yank with < >"
  (interactive "*")
  (my-yank-with-bracket "<" ">")
  )
(global-set-key (kbd "C-z C-.") 'my-yank-with-xml-tag)

(when (require 'org-mode nil t)
  (progn

    (defun my-yank-with-link-occur () "yank with link occur"
      (interactive "*")
      (my-yank-with-bracket "[[elisp:(occur \"" "\")]]")
      )
    (define-key org-mode-map (kbd "C-z C-o") 'my-yank-with-link-occur)

    (defun my-yank-with-link-org-occur () "yank with link org-occur"
      (interactive "*")
      (my-yank-with-bracket "[[elisp:(org-occur-in-agenda-files \"" "\")]]")
      )
    (define-key org-mode-map  (kbd "C-z M-s M-a") 'my-yank-with-link-org-occur)

    )
  )

;; 以下、 erb 用。

(defun my-yank-with-erb-print () "yank with erb print"
  (interactive "*")
  (my-yank-with-bracket "<%= " " %>")
  )
(global-set-key (kbd "C-z C--") 'my-yank-with-erb-print)

;; ----------------------------------------------------------------------
;; カッコをつけたり外したりするコマンドがほしい。特に <!--   -->
;; Eclipse の C-/
