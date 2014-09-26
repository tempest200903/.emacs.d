;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-chmod.el
;; #+LAST_UPDATED: 2014-09-27
;; ----------------------------------------------------------------------
;; * [2014-09-27 土] https://github.com/znz/dot-emacs/blob/8434c73ba833791eedc1411360e10441e52b370e/init.el.d/50after-save.el
;;; http://www-nagao.kuee.kyoto-u.ac.jp/member/tsuchiya/elisp/
;;; スクリプトを save する時、自動的に chmod +x を行なう
;;;  Katsumi Yamaoka <yamaoka@ga.sony.co.jp> さん作
;;;  ファイル名が . で始まる場合は chmod +x を行わないように改造 (Sep 9, 1997)
(when (fboundp 'executable-make-buffer-file-executable-if-script-p)
    (add-hook
     'after-save-hook
     'executable-make-buffer-file-executable-if-script-p)
  (add-hook
   'after-save-hook
   #'(lambda ()
       (save-restriction
         (widen)
         (if (or
              (string= "#!" (buffer-substring 1 (min 3 (point-max))))
              (string-match ".cgi$" (buffer-file-name)))
             (let ((name (buffer-file-name)))
               (or (char-equal ?. (string-to-char (file-name-nondirectory name))
                               )
                   (let ((mode (file-modes name)))
                     (set-file-modes name (logior mode (logand (/ mode 4) 73)))
                     (message (concat "Wrote " name " (+x)"))))
               ))))))
