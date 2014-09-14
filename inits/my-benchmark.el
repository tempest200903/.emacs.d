;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-benchmark.el
;; =============================================================================
;; http://d.hatena.ne.jp/sugyan/20120105/1325756767
;; defadvice を使って require にかかる時間を計測する
;; 
(defvar benchmark-threashold 1)
(defadvice require (around require-benchmark activate)
  (let* ((before (current-time))
         (result ad-do-it)
         (after  (current-time))
         (time (+ (* (- (nth 1 after) (nth 1 before)) 1000)
                  (/ (- (nth 2 after) (nth 2 before)) 1000))))
    (when (> time benchmark-threashold)
      (message "{benchmark require} %s: %d msec" (ad-get-arg 0) time))))
(defadvice load (around load-benchmark activate)
  (let* ((before (current-time))
         (result ad-do-it)
         (after  (current-time))
         (time (+ (* (- (nth 1 after) (nth 1 before)) 1000)
                  (/ (- (nth 2 after) (nth 2 before)) 1000))))
    (when (> time benchmark-threashold)
      (message "{benchmark load} %s: %d msec" (ad-get-arg 0) time))))
(defadvice install-elisp-from-emacswiki (around install-elisp-from-emacswiki-benchmark activate)
  (message "{install-elisp-from-emacswiki:begin} %s" (ad-get-arg 0))
  (let* ((before (current-time))
         (result ad-do-it)
         (after  (current-time))
         (time (+ (* (- (nth 1 after) (nth 1 before)) 1000)
                  (/ (- (nth 2 after) (nth 2 before)) 1000))))
    (message "{install-elisp-from-emacswiki:end} %s {time:%s}" (ad-get-arg 0) time)
    ))
;; TODO [2014-09-14 日] DRY
;; ----------------------------------------------------------------------
;; 『起動時間を計測する』 http://d.hatena.ne.jp/sugyan/20120120/1327037494
(defun my-after-init-hook ()
  "起動時間を計測する"
  (message "init time: %.3f sec"
           (float-time (time-subtract after-init-time before-init-time)))
  )
(add-hook 'after-init-hook 'my-after-init-hook)
;; ----------------------------------------------------------------------
