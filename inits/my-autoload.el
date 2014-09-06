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
;;
(autoload 'match-paren "my-programming-defun" nil t)
;;
(autoload 'graphviz-dot-mode "my-graphviz-dot-mode" nil t)
;;
(autoload 'picture-duplicate-line "picture" nil t)
;; ---- my-org-mode-buffer.el ----
(autoload 'my-org-edit-agenda-file-list-switch-to-buffer "my-org-mode-buffer" nil t)
(autoload 'my-org-agenda-list-switch-to-buffer "my-org-mode-buffer")
;; ---- my-occur.el ----
;; [2014-05-14 水] auto-load 失敗。 Message: "Cannot open load file"
;; (autoload 'my-occur-or-switch-to-buffer "my-occur" nil t)
;; 
;; [2014-05-14 水] auto-load 失敗。 Message: "Cannot open load file"
;; (autoload 'moccur "my-moccur" nil t) 
;; ---- my-explorer.el ----
(autoload 'my-explorer-current-directory "my-explorer" nil t)
;; my-yank-special.el
(autoload 'my-yank-with-bracket "my-yank-special" nil t)
(autoload 'my-yank-with-PARENTHESIS "my-yank-special" nil t)
(autoload 'my-yank-with-CURLY-BRACKET "my-yank-special" nil t)
(autoload 'my-yank-with-TORTOISE-SHELL-BRACKET "my-yank-special" nil t)
(autoload 'my-yank-with-CORNER-BRACKET "my-yank-special" nil t)
(autoload 'my-yank-with-WHITE-CORNER-BRACKET "my-yank-special" nil t)
(autoload 'my-yank-with-QUOTATION-MARK "my-yank-special" nil t)
(autoload 'my-yank-with-APOSTROPHE "my-yank-special" nil t)
(autoload 'my-yank-with-BLACK-LENTICULAR-BRACKET "my-yank-special" nil t)
(autoload 'my-yank-with-ANGLE-BRACKET "my-yank-special" nil t)
(autoload 'my-yank-with-DOUBLE-ANGLE-BRACKET "my-yank-special" nil t)
(autoload 'my-yank-with-SQUARE-BRACKET "my-yank-special" nil t)
(autoload 'my-yank-with-xml-comment "my-yank-special" nil t)
(autoload 'my-yank-with-xml-tag "my-yank-special" nil t)
(autoload 'my-yank-with-link-occur "my-yank-special" nil t)
(autoload 'my-yank-with-link-org-occur "my-yank-special" nil t)
(autoload 'my-yank-with-erb-print "my-yank-special" nil t)
(autoload 'my-yank-org-example-arg "my-yank-special" nil t)
;; my-seq.el
(autoload 'seq "my-seq" nil t)
;; my-date.el
(autoload 'my-date-insert-today "my-date" nil t)
(autoload 'my-date-today "my-date" nil t)
(autoload 'my-date-replace-today "my-date" nil t)
;; my-occur.el
(autoload 'my-occur-link "my-occur" nil t)
;; my-org-mode-hyperlink.el
(autoload 'my-org-convert-to-link "my-org-mode-hyperlink" nil t)
(autoload 'my-insert-shell-bracket "my-org-mode-hyperlink" nil t)
(autoload 'my-org-open-at-point "my-org-mode-hyperlink" nil t)
(autoload 'my-org-yank-link-arg "my-org-mode-hyperlink" nil t)
(autoload 'my-org-yank-link "my-org-mode-hyperlink" nil t)
;; my-color-moccur.el
(autoload 'occur-by-moccur   "my-color-moccur" nil t)
(autoload 'moccur            "my-color-moccur" nil t)
(autoload 'moccur-grep       "my-color-moccur" nil t)
(autoload 'moccur-grep-find  "my-color-moccur" nil t)
(autoload 'dmoccur           "my-color-moccur" nil t)
(define-key global-map (kbd "M-s M-c") 'occur-by-moccur)
(define-key global-map (kbd "M-s M-m") 'moccur)
(define-key global-map (kbd "M-s M-g") 'moccur-grep)
(define-key global-map (kbd "M-s M-f") 'moccur-grep-find)
(define-key global-map (kbd "M-s M-d") 'dmoccur)
;; my-wc.el
(autoload 'my-region-command-wc-to-minibuffer "my-wc" nil t)
(define-key global-map (kbd "C-z C-x l") 'my-region-command-wc-to-minibuffer)
;; my-other-window-or-split.el
(autoload 'my-other-window-or-split "my-other-window-or-split" nil t)
;; my-kill-ring-save.el
(autoload 'my-kill-ring-save-or-ffap-copy-string-as-kill "my-kill-ring-save" nil t)
(autoload 'my-kill-buffer-file-name "my-kill-ring-save" nil t)
;; ffap.el
(autoload 'ffap-other-window "ffap" nil t)
;; my-org-clock.el
(autoload 'my-org-clock-goto-u "my-org-clock.el" nil t)
(autoload 'my-org-clock-goto-default "my-org-clock.el" nil t)
;; my-color-moccur.el
(autoload 'moccur "my-color-moccur.el" nil t)
