;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-wdired.el
;; #+LAST_UPDATED: 2013-11-03
;; ======================================================================
(require 'wdired)
(setq wdired-allow-to-change-permissions t)
;; ----------------------------------------------------------------------
;; * [2013-11-03] n:/download/Emacs/sample_emacs_d/github.com.shishi/shishi-.emacs.d-9d470cf/inits/20-wdired.el
;; ----------------------------------------------------------------------
;; * [2014-09-08 ��] http://coderepos.org/share/browser/dotfiles/emacs/kentaro/.emacs.d/conf/init-dired.el
;;
;; wdired
;; ;; http://www.bookshelf.jp/soft/meadow_25.html#SEC292
;; (require 'wdired)
;;
;; ;; r��dired�o�b�t�@�𒼐ڕҏW�ł���悤�ɂȂ�B
;; (define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)
;;
;; ;;�p�[�~�b�V�������ύX�\��
;; (setq wdired-allow-to-change-permissions t)
;;
;; ;; ls�̑���Emacs���̂̋@�\�𗘗p���ăf�B���N�g�������X�g
;; ;; http://www.namazu.org/~tsuchiya/elisp/#dired
;; (require 'ls-lisp)
;; (let (current-load-list)
;;   (defadvice insert-directory
;;     (around reset-locale activate compile)
;;     (let ((system-time-locale "C"))
;;       ad-do-it)))
;;
;; ----------------------------------------------------------------------
(provide 'my-wdired)
