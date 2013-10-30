;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; ======================================================================
;; http://aikotobaha.blogspot.com/2010/08/gnupack-ntemacs23-dotemacs.html
;; 起動時間を測定
;; init.el の最後に load すればいい？
(defun my-time-lag ()
  (interactive)
  (let* ((now (current-time))
         (min (- (car now) (car my-time-zero)))
         (sec (- (car (cdr now)) (car (cdr my-time-zero))))
         (msec (/ (- (car (cdr (cdr now)))
                     (car (cdr (cdr my-time-zero))))
                     1000))
         (lag (+ (* 60000 min) (* 1000 sec) msec)))
    (message "'.emacs.el' loading time: %d msec." lag)))
(setq my-time-zero (current-time)) 
(my-time-lag)
