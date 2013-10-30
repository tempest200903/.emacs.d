;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED:
;; ======================================================================
;; * [2011-10-20 木]
;; http://nflath.com/2010/03/org-mode-2/
;; The function and hook will prompt for an effort estimate when clocking in to a task if it doesn’t already have one; I plan on using both the clocking and estimating to improve my estimation and scheduling skills.
;;
;; (org-clock-persistence-insinuate)
;; (setq org-clock-idle-time 15)
;; (setq org-clock-out-remove-zero-time-clocks t)
;; (setq org-clock-persist 'history)
;; (defun my-org-mode-ask-effort ()
;;   "Ask for an effort estimate when clocking in."
;;   (unless (org-entry-get (point) "Effort")
;;     (let ((effort
;;            (completing-read
;;             "Effort: "
;;             (org-entry-get-multivalued-property (point) "Effort"))))
;;       (unless (equal effort "")
;;         (org-set-property "Effort" effort)))))
;; (add-hook 'org-clock-in-prepare-hook 'my-org-mode-ask-effort)
;;
;; * memo
;; ** org-clock-persistence-insinuate
;; clock-in 関連の hook を使う準備。現環境では既に準備済みのようだ。
;; ** org-clock-idle-time
;; デフォルト値は nil.
;; この変数で指定した時間、アイドルが続くと何かのトリガーを引く。単位は分。
;; 試しに使ってみる。
;; ** org-clock-out-remove-zero-time-clocks
;; デフォルト値は t. 変更しない。
;; ** org-clock-persist
;; デフォルト値は nil.
;; non-nil ならば Emacs を終了するときに動作中の clock を保存する。
;; Emacs を再起動すると clock を再開する。
;; 自分の場合、1日の終わりに Emacs を終了するときは clock を保存・再開するニーズはない。
;; Emacs がクラッシュするときは、どのみち保存できない。
;; 1日の途中にメモリ解放のため Emacs を再起動するときはいちいち clock を保存する手間が省ける程度か。
;; 追記。 clock だけでなく history も保存するようだ。 C-u M-x org-clock-goto の履歴も復元できるのか？
;; 試してみる。 customize を保存する。
;; 実験結果。履歴は復元されない。 clock の何が保存されたのか分からない。しばらく様子を見る。
;; 不要ならデフォルトに戻す。

;; 実験中
(defun my-org-mode-ask-effort ()
  "Ask for an effort estimate when clocking in."
  (unless (org-entry-get (point) "Effort")
    (let ((effort
           (completing-read
            "Effort: "
            (org-entry-get-multivalued-property (point) "Effort"))))
      (unless (equal effort "")
        (org-set-property "Effort" effort)))))
(add-hook 'org-clock-in-prepare-hook 'my-org-mode-ask-effort)
