;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-org-mode-effort.el
;; #+LAST_UPDATED: 2014-11-14

;; ======================================================================
;; * [2014-11-14 金] 
;; https://github.com/takaishi/.emacs.d/blob/master/conf.d/30_org-mode.org
;; .emacs.d/30_org-mode.org at master · takaishi/.emacs.d · GitHub
;; 時間計測を開始する前に必ず見積りを行う

(defadvice org-clock-in (before is-set-effort-before-clock-in)
  (let ((effort (org-entry-get (point) "Effort")))
    (unless effort
      (error "[Error: Is not set a effort!]"))))

(ad-activate-regexp "is-set-effort-before-clock-in")

;; TODO 全てのファイルで強制するのではなく、
;; レベル1の引き出しに特定の属性がついているサブツリーの範囲内でのみ有効にしたい。
;; TODO error 発生させるのではなく、 mode-line に通常とは異なる配色を表示したい。
