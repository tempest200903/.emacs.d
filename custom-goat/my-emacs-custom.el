;; ~/.emacs.d/custom-goat/my-emacs-custom.el
;; #+LAST_UPDATED: 2014-07-27
;; ----------------------------------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-directory-alist (quote ((".*" . "C:/Users/simei/AppData/Local/Temp"))))
 '(column-number-mode t)
 '(compilation-ask-about-save nil)
 '(compilation-read-command t)
 '(compile-command "")
 '(cua-enable-cua-keys nil)
 '(cua-mode t nil (cua-base))
 '(dired-dwim-target t)
 '(expand-region-autocopy-register "e")
 '(foreign-regexp/regexp-type (quote perl))
 '(graphviz-dot-auto-indent-on-newline t)
 '(graphviz-dot-auto-indent-on-semi nil)
 '(howm-directory "f:/goat-pc-data/mydropbox/Dropbox/trunksync/notes")
 '(howm-file-name-format "%Y%m%d.markdown")
 '(indent-tabs-mode nil)
 '(inhibit-startup-echo-area-message -1)
 '(inhibit-startup-screen t)
 '(message-log-max 1000)
 '(moccur-use-xdoc2txt t)
 '(nxml-child-indent 2)
 '(org-agenda-files (quote (#("f:/goat-pc-data/mydropbox/Dropbox/trunksync/notes/20141012-ガントチャート.org.txt" 59 74 (charset cp932-2-byte)) "~/.emacs.d/memo/my-emacs-customize.org.txt" "~/.emacs.d/memo/my-emacs-customize-org-mode.org.txt" "f:/goat-pc-data/mydropbox/Dropbox/trunksync/notes/task.org" "f:/goat-pc-data/mydropbox/Dropbox/trunksync/notes/アドベントカレンダーをepubに変換してiPadで読む-m2014-10.org.txt" "~/.emacs.d/memo/sample.org.txt")))
 '(org-agenda-span (quote day))
 '(org-clock-in-switch-to-state "TODO")
 '(org-clock-into-drawer "LOGBOOK")
 '(org-clock-out-remove-zero-time-clocks t)
 '(org-directory "f:/goat-pc-data/mydropbox/Dropbox/trunksync/notes")
 '(org-id-link-to-org-use-id nil)
 '(org-link-to-org-use-id nil)
 '(org-special-ctrl-a/e t)
 '(org-special-ctrl-k t)
 '(org-src-fontify-natively t)
 '(org-startup-folded nil)
 '(org-use-speed-commands t)
 '(org-yank-folded-subtrees nil)
 '(popwin-mode t)
 '(popwin:popup-window-height 30)
 '(popwin:special-display-config (quote ((dired-mode :position top) ("*Help*") ("*Completions*" :noselect t) ("*compilation*" :noselect t) ("*Buffer List*") ("*Messages*") ("*grep*") (";Open Recent") (dired-mode :position top) ("*Backtrace*") ("*Apropos*") ("*Warnings*"))))
 '(psession-object-to-save-alist (quote ((ioccur-history . "ioccur-history.el") (extended-command-history . "extended-command-history.el") (helm-external-command-history . "helm-external-command-history.el") (helm-surfraw-engines-history . "helm-surfraw-engines-history.el") (psession--save-buffers-alist . "psession-save-buffers-alist.el") (helm-ff-history . "helm-ff-history.el") (helm-grep-history . "helm-grep-history.el") (kill-ring . "kill-ring.el") (kill-ring-yank-pointer . "kill-ring-yank-pointer.el") (register-alist . "register-alist.el") (psession--winconf-alist . "psession-winconf-alist.el") (psession-object-to-save-alist . "psession-object-to-save-alist.el") (my-accesslog-database-file-path . "my-accesslog-database-file-path.el"))))
 '(reb-re-syntax (quote foreign-regexp))
 '(recenter-redisplay t)
 '(scroll-bar-mode (quote left))
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(w32-symlinks-handle-shortcuts t)
 '(win-switch-window-threshold 1))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "ＭＳ ゴシック" :foundry "outline" :slant normal :weight normal :height 98 :width normal))))
 '(visible-mark-face ((t (:underline "red")))))
;; ----------------------------------------------------------------------
;; * [2013-11-02 土] custom-set-variables の補足説明。
;; '(org-startup-folded nil) ;; org ファイルを開いたときに折りたたまない。
;; '(howm-directory "f:/goat-pc-data/mydropbox/Dropbox/trunksync/notes") ;; howm メモを格納するディレクトリ。
;; '(howm-file-name-format "%Y-%m-%d-%H%M%S.markdown") ;; howm メモのファイル名。
;; '(org-special-ctrl-a/e t)
;; '(org-special-ctrl-k t)
;; '(org-startup-folded nil)
;; '(org-yank-folded-subtrees nil) ;; Non-nil にすると subtrees を yank するとき、それを fold (折りたたむ)。
;; '(org-link-to-org-use-id nil) ;; nil にするとリンクを作るとき ID を使わない。
;; '(dired-dwim-target t) ;; t にすると copy, rename のターゲットのデフォルト値に隣のウィンドウの dired ディレクトリを与える。
;; '(compilation-read-command nil) ;; t にすると、毎回 command を minibuffer から入力する。 nil にすると　minibuffer から入力しない。ただし、 C-u をつけると minibuffer から入力する。
;; '(org-src-fontify-natively t) ; t にすると、 #+BEGIN_SRC #+END_SRC src ブロック内部のフォントを着色する。
;; '(org-clock-in-switch-to-state "TODO") ; non-nil にすると、 clock-in するときに todo state を指定した値に変更する。
;; ----------------------------------------------------------------------
;; * [2013-11-02 土] M-x customize で設定できない変数。
(setq howm-search-other-dir t)
(setq howm-search-path '("~/howm"))
;; * [2013-11-10 日] c:/tool/gnupack/home/.emacs.d/inits/my-gtags.el
(setq my-gtags-command ""C:/tool/gnupack/app/cygwin/local/bin/gtags.exe"")

;; * [2013-11-12 火] gp では howm 有効、 dn2 では howm 無効。
;; (require 'my-howm)
(my-idle-require 'my-howm)

;; ----------------------------------------------------------------------
;; * [2014-09-11 木] bookmark file を PC 毎に分離したい。
;; bookmark-default-file デフォルト値 ~/.emacs.d/bookmarks から変更する。
(require 'bookmark)
(setq bookmark-default-file (concat "~/.emacs.d/" emacs_custom "/bookmarks"))

;; ----------------------------------------------------------------------
(setenv "PATH" (concat (getenv "PATH") ";C:/Ruby193/bin"))

