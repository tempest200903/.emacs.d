;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-autoload.el
;; ======================================================================
;; my-auto-install.el
(autoload 'auto-install-from-url                         "my-auto-install" nil t)
;; my-howm.el
(autoload 'howm-create                                   "my-howm" nil t)
(autoload 'my-howm-view-directory                        "my-howm" nil t)
(autoload 'howm-menu                                     "my-howm" nil t)
(autoload 'howm-list-grep-fixed                          "my-howm" nil t)
(autoload 'howm-remember                                 "my-howm" nil t)
(autoload 'howm-list-buffers                             "my-howm" nil t)
(autoload 'howm-list-mark-ring                           "my-howm" nil t)
(autoload 'howm-occur                                    "my-howm" nil t)
(autoload 'howm-toggle-search-other-dir                  "my-howm" nil t)
(autoload 'howm-bayesian-set                             "my-howm" nil t)
(autoload 'howm-bug-report                               "my-howm" nil t)
(autoload 'howm-bug-shot                                 "my-howm" nil t)
(autoload 'howm-date-backward                            "my-howm" nil t)
(autoload 'howm-date-backward-month                      "my-howm" nil t)
(autoload 'howm-date-backward-year                       "my-howm" nil t)
(autoload 'howm-date-forward                             "my-howm" nil t)
(autoload 'howm-date-forward-month                       "my-howm" nil t)
(autoload 'howm-date-forward-year                        "my-howm" nil t)
(autoload 'howm-dup                                      "my-howm" nil t)
(autoload 'howm-elp                                      "my-howm" nil t)
(autoload 'howm-extend-deadlines                         "my-howm" nil t)
(autoload 'howm-find-past                                "my-howm" nil t)
(autoload 'howm-first-memo                               "my-howm" nil t)
(autoload 'howm-from-change-log                          "my-howm" nil t)
(autoload 'howm-initialize-buffer                        "my-howm" nil t)
(autoload 'howm-keyword-add                              "my-howm" nil t)
(autoload 'howm-last-memo                                "my-howm" nil t)
(autoload 'howm-list-active-todo                         "my-howm" nil t)
(autoload 'howm-list-around                              "my-howm" nil t)
(autoload 'howm-list-sleeping-todo                       "my-howm" nil t)
(autoload 'howm-list-title                               "my-howm" nil t)
(autoload 'howm-list-toggle-title                        "my-howm" nil t)
(autoload 'howm-menu-edit                                "my-howm" nil t)
(autoload 'howm-menu-invoke                              "my-howm" nil t)
(autoload 'howm-menu-mode                                "my-howm" nil t)
(autoload 'howm-menu-refresh                             "my-howm" nil t)
(autoload 'howm-mode                                     "my-howm" nil t)
(autoload 'howm-narrow-to-memo                           "my-howm" nil t)
(autoload 'howm-next-memo                                "my-howm" nil t)
(autoload 'howm-open-directory-independently             "my-howm" nil t)
(autoload 'howm-open-past                                "my-howm" nil t)
(autoload 'howm-open-today                               "my-howm" nil t)
(autoload 'howm-previous-memo                            "my-howm" nil t)
(autoload 'howm-refresh                                  "my-howm" nil t)
(autoload 'howm-remember-discard                         "my-howm" nil t)
(autoload 'howm-remember-mode                            "my-howm" nil t)
(autoload 'howm-remember-submit                          "my-howm" nil t)
(autoload 'howm-reminder-goto-today                      "my-howm" nil t)
(autoload 'howm-return-to-list                           "my-howm" nil t)
(autoload 'howm-save-buffer                              "my-howm" nil t)
(autoload 'howm-schedule-sort-by-date                    "my-howm" nil t)
(autoload 'howm-search-namazu                            "my-howm" nil t)
(autoload 'howm-search-past                              "my-howm" nil t)
(autoload 'howm-search-today                             "my-howm" nil t)
(autoload 'howm-show-buffer-as-howm                      "my-howm" nil t)
(autoload 'howm-switch-to-howm-buffer                    "my-howm" nil t)
(autoload 'howm-switch-to-nonhowm-buffer                 "my-howm" nil t)
(autoload 'howm-to-change-log                            "my-howm" nil t)
(autoload 'howm-toggle-narrow                            "my-howm" nil t)
(autoload 'howm-version                                  "my-howm" nil t)
(autoload 'howm-view-contents-mode                       "my-howm" nil t)
(autoload 'howm-view-contents-open                       "my-howm" nil t)
(autoload 'howm-view-dired                               "my-howm" nil t)
(autoload 'howm-view-filter                              "my-howm" nil t)
(autoload 'howm-view-filter-by-around                    "my-howm" nil t)
(autoload 'howm-view-filter-by-contents                  "my-howm" nil t)
(autoload 'howm-view-filter-by-date                      "my-howm" nil t)
(autoload 'howm-view-filter-by-mtime                     "my-howm" nil t)
(autoload 'howm-view-filter-by-name                      "my-howm" nil t)
(autoload 'howm-view-filter-by-region                    "my-howm" nil t)
(autoload 'howm-view-filter-by-reminder                  "my-howm" nil t)
(autoload 'howm-view-filter-by-summary                   "my-howm" nil t)
(autoload 'howm-view-filter-uniq                         "my-howm" nil t)
(autoload 'howm-view-kill-buffer                         "my-howm" nil t)
(autoload 'howm-view-lift-by-name                        "my-howm" nil t)
(autoload 'howm-view-lift-by-summary                     "my-howm" nil t)
(autoload 'howm-view-lift-by-summary-substring           "my-howm" nil t)
(autoload 'howm-view-sort                                "my-howm" nil t)
(autoload 'howm-view-sort-by-date                        "my-howm" nil t)
(autoload 'howm-view-sort-by-mtime                       "my-howm" nil t)
(autoload 'howm-view-sort-by-name                        "my-howm" nil t)
(autoload 'howm-view-sort-by-name-match                  "my-howm" nil t)
(autoload 'howm-view-sort-by-numerical-name              "my-howm" nil t)
(autoload 'howm-view-sort-by-random                      "my-howm" nil t)
(autoload 'howm-view-sort-by-reminder                    "my-howm" nil t)
(autoload 'howm-view-sort-by-reverse                     "my-howm" nil t)
(autoload 'howm-view-sort-by-reverse-date                "my-howm" nil t)
(autoload 'howm-view-sort-by-summary                     "my-howm" nil t)
(autoload 'howm-view-sort-by-summary-match               "my-howm" nil t)
(autoload 'howm-view-sort-by-summary-match-string        "my-howm" nil t)
(autoload 'howm-view-sort-reverse                        "my-howm" nil t)
(autoload 'howm-view-summary-mode                        "my-howm" nil t)
(autoload 'howm-view-summary-next-section                "my-howm" nil t)
(autoload 'howm-view-summary-open                        "my-howm" nil t)
(autoload 'howm-view-summary-open-sub                    "my-howm" nil t)
(autoload 'howm-view-summary-previous-section            "my-howm" nil t)
(autoload 'howm-view-summary-shell-command               "my-howm" nil t)
(autoload 'howm-view-summary-to-contents                 "my-howm" nil t)
;;
(autoload 'my-copy-line                                  "my-copy-line" nil t)
(autoload 'my-join-line-next                             "my-copy-line" nil t)
;;
(autoload 'redo                                          "redo+" nil t)
;;
(autoload 'kill-region-or-backward-kill-word             "my-backward-kill-word" nil t)
(autoload 'kill-word-at-point                            "my-backward-kill-word" nil t)
;;
(autoload 'my-goto-line-with-linum-mode                  "my-goto-line" nil t)
;;
(autoload 'my-rename-file-and-buffer                     "my-rename-file-and-buffer" nil t)
;; 
(autoload 'my-toggle-truncate-lines                      "my-toggle-truncate-lines" nil t)
;;
(autoload 'match-paren                                   "my-programming-defun" nil t)
;;
(autoload 'graphviz-dot-mode                             "my-graphviz-dot-mode" nil t)
;;
(autoload 'picture-duplicate-line                        "picture" nil t)
;; ---- my-org-mode-buffer.el ----
(autoload 'my-org-edit-agenda-file-list-switch-to-buffer "my-org-mode-buffer" nil t)
(autoload 'my-org-agenda-list-switch-to-buffer           "my-org-mode-buffer")
;; ---- my-occur.el ----
;; [2014-05-14 水] auto-load 失敗。 Message:             "Cannot open load file"
;; (autoload 'my-occur-or-switch-to-buffer               "my-occur" nil t)
;; 
;; [2014-05-14 水] auto-load 失敗。 Message:             "Cannot open load file"
;; (autoload 'moccur                                     "my-moccur" nil t) 
;; ---- my-explorer.el ----
(autoload 'my-explorer-current-directory                 "my-explorer" nil t)
;; my-yank-special.el
(autoload 'my-yank-with-bracket                          "my-yank-special" nil t)
(autoload 'my-yank-with-PARENTHESIS                      "my-yank-special" nil t)
(autoload 'my-yank-with-CURLY-BRACKET                    "my-yank-special" nil t)
(autoload 'my-yank-with-TORTOISE-SHELL-BRACKET           "my-yank-special" nil t)
(autoload 'my-yank-with-CORNER-BRACKET                   "my-yank-special" nil t)
(autoload 'my-yank-with-WHITE-CORNER-BRACKET             "my-yank-special" nil t)
(autoload 'my-yank-with-QUOTATION-MARK                   "my-yank-special" nil t)
(autoload 'my-yank-with-APOSTROPHE                       "my-yank-special" nil t)
(autoload 'my-yank-with-BLACK-LENTICULAR-BRACKET         "my-yank-special" nil t)
(autoload 'my-yank-with-ANGLE-BRACKET                    "my-yank-special" nil t)
(autoload 'my-yank-with-DOUBLE-ANGLE-BRACKET             "my-yank-special" nil t)
(autoload 'my-yank-with-SQUARE-BRACKET                   "my-yank-special" nil t)
(autoload 'my-yank-with-xml-comment                      "my-yank-special" nil t)
(autoload 'my-yank-with-xml-tag                          "my-yank-special" nil t)
(autoload 'my-yank-with-link-occur                       "my-yank-special" nil t)
(autoload 'my-yank-with-link-org-occur                   "my-yank-special" nil t)
(autoload 'my-yank-with-erb-print                        "my-yank-special" nil t)
(autoload 'my-yank-org-example-arg                       "my-yank-special" nil t)
;; my-seq.el
(autoload 'seq                                           "my-seq" nil t)
;; my-date.el
(autoload 'my-date-insert-today                          "my-date" nil t)
(autoload 'my-date-today                                 "my-date" nil t)
(autoload 'my-date-replace-today                         "my-date" nil t)
;; my-occur.el
(autoload 'my-occur-link                                 "my-occur" nil t)
;; my-org-mode-hyperlink.el
(autoload 'my-org-convert-to-link                        "my-org-mode-hyperlink" nil t)
(autoload 'my-insert-shell-bracket                       "my-org-mode-hyperlink" nil t)
(autoload 'my-org-open-at-point                          "my-org-mode-hyperlink" nil t)
(autoload 'my-org-yank-link-arg                          "my-org-mode-hyperlink" nil t)
(autoload 'my-org-yank-link                              "my-org-mode-hyperlink" nil t)
;; my-color-moccur.el
(autoload 'occur-by-moccur                               "my-color-moccur" nil t)
(autoload 'moccur                                        "my-color-moccur" nil t)
(autoload 'moccur-grep                                   "my-color-moccur" nil t)
(autoload 'moccur-grep-find                              "my-color-moccur" nil t)
(autoload 'dmoccur                                       "my-color-moccur" nil t)
(define-key global-map (kbd                              "M-s M-c") 'occur-by-moccur)

;; (define-key global-map (kbd                              "M-s M-g") 'nonincremental-repeat-search-forward) ;; デフォルト

;; ~/.emacs.d/keymap/foreign-regexp-search-map.txt の foreign-regexp/toggle-dot-match と衝突するので変更する。
;; (define-key global-map (kbd                              "M-s M-m") 'moccur)
;; (define-key global-map (kbd                              "M-s M-g M-m") 'moccur)
(define-key global-map (kbd                              "M-s m") 'moccur)

;; (define-key global-map (kbd                              "M-s M-g") 'moccur-grep)
;; (define-key global-map (kbd                              "M-s M-g M-m") 'moccur-grep)
(define-key global-map (kbd                              "M-s g") 'moccur-grep)

;; ~/.emacs.d/keymap/foreign-regexp-search-map.txt の foreign-regexp/non-incremental/search-forward と衝突するので変更する。
;; (define-key global-map (kbd                              "M-s M-f") 'moccur-grep-find)
;; (define-key global-map (kbd                              "M-s M-g M-f") 'moccur-grep-find)
;; (define-key global-map (kbd                              "M-s f") 'moccur-grep-find)
(define-key global-map (kbd                              "M-s n") 'moccur-grep-find)

;; M-s M-g runs the command nonincremental-repeat-search-forward があるので、 M-s M-g で始まる kbd を変更する必要がある。
;; dired-mode には M-s f C-s dired-isearch-filenames などがあるので M-s f で始まる kbd を変更する必要がある。

;; (define-key global-map (kbd                              "M-s M-d") 'dmoccur)
(define-key global-map (kbd                              "M-s d") 'dmoccur)

;; my-wc.el
(autoload 'my-region-command-wc-to-minibuffer            "my-wc" nil t)
;; my-other-window-or-split.el
(autoload 'my-other-window-or-split                      "my-other-window-or-split" nil t)
;; my-kill-ring-save.el
(autoload 'my-kill-ring-save-or-ffap-copy-string-as-kill "my-kill-ring-save" nil t)
(autoload 'my-kill-buffer-file-name                      "my-kill-ring-save" nil t)
;; ffap.el
(autoload 'ffap-other-window                             "ffap" nil t)
;; my-org-clock.el
(autoload 'my-org-clock-goto-u                           "my-org-clock" nil t)
(autoload 'my-org-clock-goto-default                     "my-org-clock" nil t)
(autoload 'my-insert-clocktable                          "my-org-clock" nil t)
;; my-color-moccur.el
(autoload 'moccur                                        "my-color-moccur" nil t)
;; my-timemanager.el
(autoload 'my-workmanager-write-file                     "my-timemanager" nil t)
(autoload 'my-workmanager-collect                        "my-timemanager" nil t)
;; my-dired-mode-map.el
(autoload 'wdired-change-to-wdired-mode                  "my-dired-mode-map" nil t)
;; my-occur.el
(autoload 'my-occur-or-switch-to-buffer                  "my-occur" nil t)
(autoload 'my-moccur-or-switch-to-buffer                 "my-occur" nil t)
;; my-bm-package.el
(autoload 'bm-toggle                                     "my-bm-package" nil t)
(autoload 'bm-next                                       "my-bm-package" nil t)
(autoload 'bm-previous                                   "my-bm-package" nil t)
(autoload 'bm-bookmark-regexp                            "my-bm-package" nil t)
(autoload 'bm-show                                       "my-bm-package" nil t)
(autoload 'bm-show-all                                   "my-bm-package" nil t)
(autoload 'bm-remove-all-current-buffer                  "my-bm-package" nil t)
(autoload 'bm-remove-all-all-buffers                     "my-bm-package" nil t)
(autoload 'bm-bookmark-annotate                          "my-bm-package" nil t)
;; my-popwin.el
(autoload 'popwin:dired-get-file-for-visit               "my-popwin" nil t)
;; my-search-keybind.el
(autoload 'my-search-keybind                             "my-search-keybind" nil t)
;; my-popwin.el
(autoload 'my-calc-hour-in-outline                       "my-calc" nil t)
;; my-shell.el
(autoload 'my-shell                                      "shell" nil t)
;; 
;; M-x highlight-symbol-prev
;; M-x highlight-symbol-next
;; ----------------------------------------------------------------------
(load                                                    "~/.emacs.d/inits/my-expand-region-keymap-autoload")
(load                                                    "~/.emacs.d/inits/my-rotate-keymap-autoload")
