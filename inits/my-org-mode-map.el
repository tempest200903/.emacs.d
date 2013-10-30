;; -*- mode: emacs-lisp ; coding: utf-8-unix -*-
;; #+LAST_UPDATED: 2013-10-23
;; ----------------------------------------------------------------------
;; http://hpcgi1.nifty.com/spen/index.cgi?OrgMode%2fManual1#i2
;; * [2010-11-01 月] 汎用的に使うので global-map
(defun my-org-clock-goto-u ()
  "alias of C-u M-x org-clock-goto"
  (interactive)
  (org-clock-goto t)
  (call-interactively 'set-mark-command)
  )
(fset 'my-org-clock-goto-default
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("\347\365d" 0 "%d")) arg)))
;; ----------------------------------------------------------------------
;; * global
;; 『Emacs org-modeを使ってみる: (1) インストール - 屯遁のパズルとプログラミングの日記』 http://d.hatena.ne.jp/tamura70/20100203/org
;; キーバインドの設定
(require 'org)
  (progn
    (define-key global-map (kbd "C-c l") 'org-store-link)
    (define-key global-map (kbd "C-:") 'org-agenda)
    (define-key global-map (kbd "C-x C-:") 'my-org-agenda-list-switch-to-buffer)
    (define-key global-map (kbd "M-g M-j") 'org-clock-goto)
    (define-key global-map (kbd "M-g M-u") 'my-org-clock-goto-u)
    (define-key global-map (kbd "M-g M-h") 'my-org-clock-goto-default)
    (define-key global-map (kbd "M-s M-a") 'org-occur-in-agenda-files)
    (define-key global-map (kbd "C-z C-u") 'org-time-stamp-inactive)
    (define-key global-map (kbd "C-c b") 'org-iswitchb) ; cf. http://orgmode.org/manual/Activation.html#Activation
    )
;; ----------------------------------------------------------------------
;; * org-mode-map
(define-key org-mode-map (kbd "C-c C-x d") 'org-clock-mark-default-task)

;; ----------------------------------------------------------------------
;; ;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; ;; #+LAST_UPDATED: 2013-09-11
;; ;; ======================================================================

;; ;; ----------------------------------------------------------------------
;; ;; * [2011-04-23 土] よく使う keybind を短縮したい。
;; (defun my-org-mouse-context-menu() "org-mouse-context-menu interactive"
;;   (interactive)
;;   (org-mouse-context-menu)
;;   )

;; ;; ----------------------------------------------------------------------
;; ;; * [2013-04-03 水] mouse "copy link" と同じことをキーボードで行う。
;; ;; my-org-copy-link1
;; (fset 'my-org-copy-link1
;;       (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([3 12 1 11 25 return return] 0 "%d")) arg)))
;; ;; TODO 最後に (message) でコピーした文字列を表示してほしい。
;; ;; TODO カーソルをもとの位置に戻す or C-a

;; ;; 完成
;; (fset 'my-org-copy-link2
;;       (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([3 12 1 11 25 return return 134217786 40 109 101 115 115 97 103 101 32 34 25 34 41 return] 0 "%d")) arg)))

;; ;; 未完成
;; (fset 'my-org-copy-link3
;;       (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("" 0 "%d")) arg)))

;; (defun my-org-mode-map-init ()
;;   "org-mode-map 初期化"
;;   "* outline 関連"
;;   (define-key org-mode-map (kbd "M-[") 'outline-previous-visible-heading)
;;   (define-key org-mode-map (kbd "M-]") 'outline-next-visible-heading)

;;   "* checkbox 関連"
;;   "org-mouse は emacs 本体付属。 require 必要。"
;;   (when (require 'org-mouse nil t)
;;     (define-key org-mode-map (kbd "C-z C-]") 'org-mouse-insert-checkbox) ;; alias of C-u C-c C-c
;;     )
   (define-key org-mode-map (kbd "C-c C-x r") 'org-reset-checkbox-state-subtree)
;;   "* link 関連"
;;   (define-key org-mode-map (kbd "C-c C-x l") 'my-org-convert-to-link) "前提: my-org-mode-hyperlink.el"
;;   (define-key org-mode-map (kbd "M-g M-p") 'org-previous-link)
;;   (define-key org-mode-map (kbd "M-g M-n") 'org-next-link)

;;   ;; * カレントバッファから hyperlink を occur するキーボード変換。 C-c C-SPC で元の位置に戻れる。
;;   (define-key org-mode-map (kbd "M-s [") (kbd "C-z C-SPC C-x 1 M-s o \\[ \\[ RET C-x o C-c C-f"))

;;   "* yank 関連"
  (define-key org-mode-map (kbd "C-c C-y") 'my-org-yank-link) "org-evaluate-time-range をデフォルトの C-c C-y から C-c y に移動した。"
;;   (define-key org-mode-map (kbd "C-z C-c C-y") 'my-org-yank-file-link)

;;   "* clock 関連"
;;   (define-key org-mode-map (kbd "C-c C-x d") 'org-clock-mark-default-task)
;;   "* org anything 関連"
;;   (when (require 'anything nil t)
;;     (define-key org-mode-map (kbd "C-t C-c C-y") 'anything-org-keywords)
;;                                         ; It is bound to <menu-bar> <Anything> <Org:> <Org keywords>.
;;     (define-key org-mode-map (kbd "C-t C-j") 'anything-org-headlines)
;;                                         ; It is bound to <menu-bar> <Anything> <Org:> <Org headlines>.
;;     )
;;   "* time 関連"
;;   (define-key org-mode-map (kbd "C-c y") 'org-evaluate-time-range)
;;   "* mark-ring 関連"
;;   (define-key org-mode-map (kbd "C-c C-SPC") 'org-mark-ring-goto)
;;   ;; C-c & は押しにくいので alias. (pop-global-mark) {It is bound to C-x C-@} に似せる。
;;   ;; C-c C-o で行って C-c C-SPC で帰る。 "
;;   (define-key org-mode-map (kbd "C-z C-SPC") 'org-mark-ring-push)
;;   ;; C-c % は押しにくいので alias. (set-mark-command ARG) {It is bound to C-@}
;;   ;; ほとんどの場合、 set-mark-command で十分。何が違う？
;;   "* その他"
;;   (define-key org-mode-map (kbd "C-c C-x ]") 'org-edit-agenda-file-list)
;;   (define-key org-mode-map (kbd "C-c C-x C-e") 'org-table-export)
;;   (define-key org-mode-map (kbd "C-z C-c C-:") (kbd "C-: a 7 b C-u l R w")) ;; for orgweek
;;   "前提: my-org-clock-display.el"
;;   (define-key org-mode-map (kbd "M-s M-v") 'org-toggle-inline-images) ;; alias of C-x C-c C-v
;;   (define-key org-mode-map (kbd "C-*") 'org-ctrl-c-star) ;; alias of C-c *
;;   (define-key org-mode-map (kbd "C-z C-a") 'org-toggle-checkbox) ;; alias of C-c C-x C-b

;;   ;; * mouse
;;   (when (require 'org-mouse nil t)
;;     (define-key org-mode-map (kbd "<S-non-convert>") 'my-org-mouse-context-menu) ;; alias of <mouse-3>
;;     );; 未完成


;;   ;; (define-key org-mode-map (kbd "C-z C-x C-w") 'my-org-copy-link1)
;;   (define-key org-mode-map (kbd "C-z C-l") 'my-org-copy-link2)
;;   ;; 課題 もっと短く！
;;   )
;; (add-hook 'org-mode-hook 'my-org-mode-map-init)

;; (defun my-org-agenda-mode-map-init ()
;;   "org-agenda-mode-map 初期化"
;;   (define-key org-agenda-mode-map (kbd "@") 'org-agenda-deadline) ;; alias of C-c C-d
;;   (define-key org-agenda-mode-map (kbd "`") 'org-agenda-schedule) ;; alias of C-c C-s
;;   (define-key org-agenda-mode-map (kbd "|") 'org-agenda-columns) ;; alias of C-c C-x C-c
;;   )
;; (add-hook 'org-agenda-mode-hook 'my-org-agenda-mode-map-init)
;; ;; ----------------------------------------------------------------------
