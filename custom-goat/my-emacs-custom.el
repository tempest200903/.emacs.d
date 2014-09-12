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
 '(dired-dwim-target t)
 '(graphviz-dot-auto-indent-on-newline t)
 '(graphviz-dot-auto-indent-on-semi nil)
 '(howm-directory "f:/goat-pc-data/mydropbox/Dropbox/trunksync/notes")
 '(howm-file-name-format "%Y%m%d.markdown")
 '(indent-tabs-mode nil)
 '(inhibit-startup-echo-area-message -1)
 '(inhibit-startup-screen t)
 '(nxml-child-indent 1)
 '(org-link-to-org-use-id nil)
 '(org-special-ctrl-a/e t)
 '(org-special-ctrl-k t)
 '(org-startup-folded nil)
 '(org-use-speed-commands t)
 '(org-yank-folded-subtrees nil)
 '(popwin-mode t)
 '(popwin:popup-window-height 30)
 '(popwin:special-display-config (quote ((dired-mode :position top) ("*Help*") ("*Completions*" :noselect t) ("*compilation*" :noselect t) ("*Buffer List*") ("*Messages*") ("*grep*") (";Open Recent") (dired-mode :position top) ("*Backtrace*") ("*Apropos*") ("*Warnings*"))))
 '(recentf-max-menu-items 50)
 '(recentf-max-saved-items 100)
 '(recentf-mode t)
 '(scroll-bar-mode (quote left))
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(w32-symlinks-handle-shortcuts t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "ＭＳ ゴシック" :foundry "outline" :slant normal :weight normal :height 98 :width normal)))))
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
;; ----------------------------------------------------------------------
;; * [2013-11-02 土] M-x customize で設定できない変数。
(setq howm-search-other-dir t)
(setq howm-search-path '("~/howm"))
;; * [2013-11-10 日] c:/tool/gnupack/home/.emacs.d/inits/my-gtags.el
(setq my-gtags-command ""C:/tool/gnupack/app/cygwin/local/bin/gtags.exe"")
;; * [2013-11-12 火] gp では howm 有効、 dn2 では howm 無効。
(require 'my-howm)
;; ----------------------------------------------------------------------
;; * [2014-09-11 木] bookmark file を PC 毎に分離したい。
;; bookmark-default-file デフォルト値 ~/.emacs.d/bookmarks から変更する。
(require 'bookmark)
(setq bookmark-default-file (concat "~/.emacs.d/" emacs_custom "/bookmarks"))
