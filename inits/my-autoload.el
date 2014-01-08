;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-autoload.el
;; ======================================================================
;; my-auto-install.el
(autoload 'auto-install-from-url "my-auto-install" nil t)
;; my-howm.el
(autoload 'howm-create "my-howm" nil t)
(autoload 'howm-mode "my-howm" nil t)
(autoload 'my-howm-view-directory "my-howm" nil t)
(autoload 'howm-menu "my-howm" nil t)
(autoload 'howm-list-grep-fixed "my-howm" nil t)
(autoload 'howm-remember "my-howm" nil t)
(autoload 'howm-list-buffers "my-howm" nil t)
(autoload 'howm-list-mark-ring "my-howm" nil t)
(autoload 'howm-occur "my-howm" nil t)
(autoload 'howm-toggle-search-other-dir "my-howm" nil t)
;;
(autoload 'my-copy-line "my-copy-line" nil t)
(autoload 'my-join-line-next "my-copy-line" nil t)
;;
(autoload 'redo "redo+" nil t)
;;
(autoload 'kill-region-or-backward-kill-word "my-backward-kill-word" nil t)
(autoload 'kill-word-at-point "my-backward-kill-word" nil t)
;;
(autoload 'my-goto-line-with-linum-mode "my-goto-line" nil t)
;;
(autoload 'my-rename-file-and-buffer "my-rename-file-and-buffer" nil t)
;; 
(autoload 'my-toggle-truncate-lines "my-toggle-truncate-lines" nil t)
