;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-benchmark.el
;; =============================================================================
;; http://d.hatena.ne.jp/sugyan/20120105/1325756767
;; defadvice を使って require にかかる時間を計測する
(defadvice require (around require-benchmark activate)
  (let* ((before (current-time))
         (result ad-do-it)
         (after  (current-time))
         (time (+ (* (- (nth 1 after) (nth 1 before)) 1000)
                  (/ (- (nth 2 after) (nth 2 before)) 1000))))
    (when (> time 20)
      (message "%s: %d msec" (ad-get-arg 0) time))))
(defadvice load (around require-benchmark activate)
  (let* ((before (current-time))
         (result ad-do-it)
         (after  (current-time))
         (time (+ (* (- (nth 1 after) (nth 1 before)) 1000)
                  (/ (- (nth 2 after) (nth 2 before)) 1000))))
    (when (> time 20)
      (message "%s: %d msec" (ad-get-arg 0) time))))
;; ----------------------------------------------------------------------
;; 『起動時間を計測する』 http://d.hatena.ne.jp/sugyan/20120120/1327037494
(add-hook 'after-init-hook
  (lambda ()
  (message "init time: %.3f sec"
  (float-time (time-subtract after-init-time before-init-time)))))
