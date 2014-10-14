(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(backup-directory-alist (quote ((".*" . "N:/temp/emacs"))))
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(cua-enable-cua-keys nil)
 '(delete-by-moving-to-trash t)
 '(dired-dwim-target t)
 '(display-time-mode t)
 '(foreign-regexp/regexp-type (quote perl))
 '(global-linum-mode nil)
 '(graphviz-dot-auto-indent-on-newline nil)
 '(graphviz-dot-auto-indent-on-semi nil)
 '(howm-directory "N:/howm/2014/10")
 '(howm-file-name-format "%Y-%m-%d-%H%M%S.howm.txt")
 '(howm-view-use-grep nil)
 '(indent-tabs-mode nil)
 '(isearch-lazy-highlight nil)
 '(linum-delay t)
 '(linum-eager nil)
 '(linum-format "%4d")
 '(moccur-split-word t)
 '(moccur-use-keyword t)
 '(moccur-use-xdoc2txt t)
 '(nxml-child-indent 1)
 '(openwith-mode t)
 '(org-agenda-clockreport-parameter-plist (quote (:link t :maxlevel 4)))
 '(org-agenda-files (quote ("n:/howm/2014/10/2014-10-01-100529.howm.txt" "n:/howm/2014/10/2014-10-10-173428.howm.txt" "n:/howm/2014/09/2014-09-29-154831.howm.txt" "n:/howm/2014/09/2014-10-01-104704.howm.txt" "n:/howm/2014/10/2014-10-06-100645.howm.txt" "n:/howm/2014/10/2014-10-08-114737.howm.txt" "n:/howm/2014/05/2014-05-15-110926.howm.txt" "n:/howm/2014/07/2014-07-17-190949.howm.txt" "n:/howm/2014/10/2014-10-01-105744.howm.txt" "n:/howm/2014/08/2014-09-01-140334.howm.txt" "n:/howm/2014/10/2014-10-06-180706.howm.txt" "n:/howm/2014/08/2014-08-01-103807.howm.txt" "n:/howm/2014/10/2014-10-04-194831.howm.txt" "n:/howm/2014/08/2014-08-08-095936.howm.txt" "n:/howm/2014/07/2014-07-18-121146.howm.txt" "n:/howm/2014/10/2014-10-10-131431.howm.txt" "n:/howm/2014/10/2014-10-08-163338.howm.txt" "n:/howm/2014/08/2014-09-03-180338.howm.txt" "n:/howm/2014/01/2014-01-06-142937.howm.txt" "n:/howm/2014/01/2014-01-06-190139.howm.txt" "n:/howm/2014/01/2014-01-06-143511.howm.txt" "n:/howm/2014/10/2014-10-01-140334.howm.txt" "n:/howm/2013/12/2013-12-27-103939.howm.txt" "n:/howm/2014/01/2014-01-15-165152.howm.txt" "n:/howm/2014/01/2014-01-24-095708.howm.txt" "n:/howm/2014/08/2014-08-07-131949.howm.txt" "n:/howm/2014/10/2014-10-08-104342.howm.txt" "n:/howm/2014/01/2014-01-06-144918.howm.txt" "n:/howm/2014/09/2014-09-18-180435.howm.txt" "n:/howm/2014/06/2014-06-09-142639.howm.txt" "n:/howm/2014/01/2014-01-18-173027.howm.txt" "n:/howm/2014/08/2014-08-04-194831.howm.txt" "n:/howm/2014/10/2014-10-08-125026.howm.txt" "n:/howm/2014/08/2014-08-05-180207.howm.txt" "n:/howm/2014/01/2014-01-08-123435.howm.txt" "n:/howm/2014/10/2014-10-02-155445.howm.txt" "n:/howm/2014/10/2014-10-03-192520.howm.txt" "n:/howm/2014/04/2014-04-01-104049.howm.txt" "n:/howm/2014/01/2014-01-06-185904.howm.txt" "n:/howm/2014/10/2014-10-02-102906.howm.txt" "n:/howm/2014/09/2014-09-26-111643.howm.txt" "n:/howm/2014/04/2014-04-21-114110.howm.txt" "n:/howm/2014/01/2014-01-18-102412.howm.txt" "n:/howm/2014/04/2014-04-10-105458.howm.txt" "n:/howm/2014/01/2014-01-10-095954.howm.txt" "n:/howm/2014/08/2014-08-04-162233.howm.txt" "n:/howm/2014/10/2014-10-03-154259.howm.txt" "n:/howm/2014/04/2014-04-21-122558.howm.txt" "n:/howm/2014/03/2014-03-13-101549.howm.txt" "n:/howm/2014/09/2014-09-01-101201.howm.txt" "n:/howm/2014/01/2014-01-08-102713.howm.txt" "n:/howm/2014/10/2014-10-01-124900.howm.txt" "n:/howm/2014/06/2014-06-19-161102.howm.txt" "n:/howm/2014/09/2014-09-11-104934.howm.txt" "n:/howm/2014/06/2014-06-11-114546.howm.txt" "n:/howm/2014/06/2014-06-28-102110.howm.txt" "~/.emacs.d/memo/my-emacs-customize-org-mode.org.txt" "n:/howm/2014/09/2014-09-01-100645.howm.txt" "n:/howm/2014/08/2014-09-01-104704.howm.txt" "n:/howm/2014/09/2014-09-30-104557.howm.txt" "n:/howm/2014/09/2014-09-29-181134.howm.txt" "n:/howm/2014/07/2014-07-03-190805.howm.txt" "n:/howm/2014/09/2014-09-26-184601.howm.txt" "n:/howm/2014/01/2014-01-18-172404.howm.txt" "n:/howm/2014/08/2014-08-18-111028.howm.txt" "n:/howm/2014/08/2014-09-04-171849.howm.txt" "n:/howm/2014/08/2014-08-05-182630.howm.txt" "n:/howm/2014/08/2014-08-28-103325.howm.txt" "n:/howm/2014/09/2014-09-10-154501.howm.txt" "n:/howm/2014/01/2014-01-06-182728.howm.txt" "n:/howm/2014/09/2014-09-24-125908.howm.txt" "n:/howm/2014/08/2014-08-20-112225.howm.txt" "n:/howm/2014/09/2014-09-12-145905.howm.txt" "n:/howm/2014/01/2014-02-17-102913.howm.txt" "n:/howm/2014/09/2014-09-19-174958.howm.txt" "n:/howm/2014/09/2014-09-19-105557.howm.txt" "n:/howm/2014/05/2014-05-21-175738.howm.txt" "n:/howm/2014/08/2014-08-11-135435.howm.txt" "n:/howm/2014/09/2014-09-18-151624.howm.txt" "n:/howm/2014/09/2014-09-10-141802.howm.txt" "n:/howm/2014/09/2014-09-08-185130.howm.txt" "n:/howm/2014/08/2014-08-28-175802.howm.txt" "n:/howm/2014/09/2014-09-16-114145.howm.txt" "n:/work/y2014/0103PCS/install-pro-nakamura-d20140303.org.txt" "n:/howm/2014/09/2014-09-12-155132.howm.txt" "n:/howm/2014/08/2014-08-28-110536.howm.txt" "n:/howm/2014/08/2014-08-13-192055.howm.txt" "n:/howm/2014/05/2014-05-30-101136.howm.txt" "n:/howm/2014/07/2014-07-30-154343.howm.txt" "n:/howm/2014/08/2014-08-12-102045.howm.txt" "n:/howm/2014/09/2014-09-05-184238.howm.txt" "n:/howm/2014/07/2014-07-03-185232.howm.txt" "n:/howm/2014/08/2014-08-12-141430.howm.txt" "n:/howm/2014/08/2014-08-25-105936.howm.txt" "n:/howm/2014/08/2014-08-19-103845.howm.txt" "n:/howm/2014/08/2014-08-14-174300.howm.txt" "n:/howm/2014/04/2014-04-07-183534.howm.txt" "n:/howm/2014/08/2014-08-02-102906.howm.txt" "n:/howm/2014/08/2014-08-01-105516.howm.txt" "n:/howm/2014/07/2014-07-22-104251.howm.txt" "n:/howm/2014/08/2014-08-07-102428.howm.txt" "n:/howm/2014/08/2014-08-01-100645.howm.txt" "n:/howm/2014/08/2014-08-14-101826.howm.txt" "n:/howm/2014/08/2014-08-20-100043.howm.txt" "n:/howm/2014/04/2014-04-30-103931.howm.txt" "n:/howm/2014/08/2014-08-19-105424.howm.txt" "n:/howm/2014/08/2014-08-18-183839.howm.txt" "n:/howm/2014/08/2014-08-14-111030.howm.txt" "n:/howm/2014/08/2014-08-12-103535.howm.txt" "n:/howm/2014/08/2014-08-11-095815.howm.txt" "n:/howm/2014/08/2014-08-07-130907.howm.txt" "n:/howm/2014/05/2014-05-30-141259.howm.txt" "n:/howm/2014/08/2014-08-04-165225.howm.txt" "n:/howm/2014/07/2014-07-31-170419.howm.txt" "n:/howm/2014/07/2014-07-29-111119.howm.txt" "n:/howm/2014/07/2014-07-28-161649.howm.txt" "n:/howm/2014/07/2014-07-28-154637.howm.txt" "n:/howm/2014/07/2014-07-25-114146.howm.txt" "n:/howm/2014/01/2014-02-03-113706.howm.txt" "n:/howm/2014/07/2014-07-22-103830.howm.txt" "n:/howm/2014/07/2014-07-18-104351.howm.txt" "n:/howm/2014/07/2014-07-04-180558.howm.txt" "n:/howm/2014/07/2014-07-03-114027.howm.txt" "n:/howm/2014/07/2014-07-15-102327.howm.txt" "n:/howm/2014/07/2014-07-02-102906.howm.txt" "n:/howm/2014/07/2014-07-14-104300.howm.txt" "n:/howm/2014/07/2014-07-04-174501.howm.txt" "n:/howm/2014/07/2014-07-02-105412.howm.txt" "n:/howm/2014/06/2014-06-06-183611.howm.txt" "n:/howm/2014/03/2014-03-18-114910.howm.txt" "n:/howm/2014/06/2014-06-20-102933.howm.txt" "n:/howm/2014/06/2014-06-18-103213.howm.txt" "n:/howm/2014/07/2014-07-01-110059.howm.txt" "n:/howm/2014/holiday-japan-y2014.org.txt" "n:/howm/2013/12/2013-12-05-102810.howm.txt" "n:/howm/2013/10/2013-10-25-100659.howm.txt" "n:/howm/2014/06/2014-06-26-173736.howm.txt" "n:/howm/2014/06/2014-06-20-111332.howm.txt" "n:/howm/2014/06/2014-06-26-105841.howm.txt" "n:/howm/2014/06/2014-06-24-102606.howm.txt" "n:/howm/2012/11/2012-11-16-114709-0000000000000000.howm.txt" "n:/howm/2014/06/2014-06-18-143900.howm.txt" "n:/howm/2014/06/2014-06-10-145648.howm.txt" "n:/howm/2014/06/2014-06-09-170555.howm.txt")))
 '(org-agenda-include-deadlines t)
 '(org-agenda-ndays 1)
 '(org-agenda-skip-deadline-if-done t)
 '(org-clock-idle-time 120)
 '(org-clock-in-switch-to-state "TODO")
 '(org-clock-into-drawer "LOGBOOK")
 '(org-clock-out-remove-zero-time-clocks t)
 '(org-columns-default-format "%99ITEM %TODO %3PRIORITY %TAGS %17Effort{:}")
 '(org-deadline-warning-days 1)
 '(org-display-internal-link-with-indirect-buffer t)
 '(org-emphasis-alist (quote (("＊" bold "<b>" "</b>") ("／" italic "<i>" "</i>") ("＿" underline "<span style=\"text-decoration:underline;\">" "</span>") ("＝" org-code "<code>" "</code>" verbatim) ("～" org-verbatim "<code>" "</code>" verbatim) ("＋" (:strike-through t) "<del>" "</del>"))))
 '(org-link-file-path-type (quote absolute))
 '(org-link-to-org-use-id nil)
 '(org-log-done (quote time))
 '(org-log-into-drawer t)
 '(org-log-reschedule (quote time))
 '(org-return-follows-link nil)
 '(org-special-ctrl-a/e t)
 '(org-speed-commands-user (quote (("m" . bookmark-set) ("+" . org-clone-subtree-with-time-shift) ("K" . org-cut-subtree) ("N" . org-narrow-to-subtree) ("Z" . org-save-all-org-buffers) ("W" . widen) ("q" . org-kill-note-or-show-branches) (":" . org-set-tags-command) ("F" . org-clock-mark-default-task) ("'" describe-variable (quote org-speed-commands-user)) ("s" . org-schedule) ("d" . org-deadline) ("J" . my-org-clock-goto-u) ("P" . org-set-property) ("E" . org-set-effort) ("{" . org-occur-link-in-agenda-files) ("=" . my-org-display-outline-path) ("(" . org-display-outline-path) ("T" . org-timer-set-timer) ("a" . org-attach) ("A" . org-toggle-archive-tag) ("&" . org-toggle-ordered-property) ("Y" . org-paste-special) ("Q" . org-columns) ("z" . org-add-note) ("k" . org-copy-subtree) ("B" . show-branches) ("," . org-timer-pause-or-continue) ("%" . org-timer-start) ("_" . org-timer-stop) ("$" . org-reset-checkbox-state-subtree) ("~" . org-sort-entries) ("]" . my-org-outline-next-visible-heading) ("[" . my-org-outline-previous-visible-heading) ("*" . org-clock-display) ("#" . org-toggle-comment) ("-" . org-ctrl-c-minus) ("n" . my-org-outline-next-visible-heading) ("V" . org-copy-visible) ("`" . org-mark-ring-goto) ("@" . org-mark-ring-push) ("}" . org-store-link) (")" . org-id-get-create) ("1" . my-org-reset-schedule-today) ("2" . my-org-reset-schedule-tomorrow))))
 '(org-startup-folded nil)
 '(org-todo-repeat-to-state "EVENT")
 '(org-use-speed-commands t)
 '(org-yank-folded-subtrees nil)
 '(reb-re-syntax (quote foreign-regexp))
 '(recentf-max-saved-items 200)
 '(recentf-mode t)
 '(show-paren-mode t)
 '(truncate-partial-width-windows nil)
 '(uniquify-buffer-name-style (quote post-forward-angle-brackets) nil (uniquify))
 '(w32-symlinks-handle-shortcuts t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "outline" :family "ＭＳ ゴシック"))))
 '(hl-line ((t (:underline "red"))))
 '(mode-line ((t (:background "white" :foreground "cyan" :box (:line-width 2 :color "grey75" :style released-button)))))
 '(mode-line-inactive ((t (:inherit mode-line :background "gray20" :foreground "darkgreen" :box (:line-width -1 :color "grey75") :weight light))))
 '(org-special-keyword ((t (:foreground "goldenrod"))))
 '(outline-3 ((t (:foreground "light sea green"))))
 '(outline-6 ((t (:foreground "salmon")))))
;; ----------------------------------------------------------------------
;; * [2013-11-05 火] M-x customize で設定できない変数。
;; ** howm で検索する範囲。12ヶ月を越えたら古いほうから削除していくべし。
(setq howm-search-path '(
                         "N:/howm/2014/09"
                         "N:/howm/2014/08"
                         "N:/howm/2014/07"
                         "N:/howm/2014/06"
                         "N:/howm/2014/05"
                         "N:/howm/2014/04"
                         "N:/howm/2014/03"
                         "N:/howm/2014/02"
                         "N:/howm/2014/01"
                         "N:/howm/2013/12"
                         "N:/howm/2013/11"
                         "N:/howm/2013/10"
                         ))
(setq howm-search-other-dir t) ;; howm-toggle-search-other-dir のトグルの初期値 (t か nil)
;; ----------------------------------------------------------------------
;; * [2014-09-27 土] https://github.com/znz/dot-emacs/blob/8434c73ba833791eedc1411360e10441e52b370e/init.el.d/50bell.el
;; ベルを鳴らすかわりにスクリーンを点滅させる
(setq visible-bell t)
;; ----------------------------------------------------------------------
;; 重要な変数について解説
;;
;; '(org-link-to-org-use-id nil) ;; org hyperlink を id を使わない方式にする。
;;
;; '(org-clock-out-remove-zero-time-clocks t) ;; ゼロになる CLOCK を除去する。
;;
;; '(howm-directory "N:/howm/") ;; howm メモを保存するディレクトリ。
;;
;; '(howm-file-name-format "%Y/%m/%Y-%m-%d-%H%M%S.howm.txt") ;; howm メモファイル名。
;;
;; '(dired-dwim-target t) ;; dired 複数ウィンドウ開いている場合、 copy/move のターゲットのデフォルト値を隣のウィンドウのディレクトリにする。
;; * [2010-11-30 火]
;; http://www.gnu.org/software/emacs/manual/html_node/emacs/Operating-on-Files.html
;; Commands which ask for a destination directory, such as those
;; which copy and rename files or create links for them, try to guess
;; the default target directory for the operation. Normally, they
;; suggest the Dired buffer's default directory, but if the variable
;; dired-dwim-target is non-nil, and if there is another Dired buffer
;; displayed in the next window, that other buffer's directory is
;; suggested instead.
;; 訳 dired コピー先ディレクトリを隣の dired buffer から得る。
;;
;; '(org-log-into-drawer t) ;; state 変更ノートとタイムスタンプを drawer の中に挿入する。
;; '(org-log-done (quote time)) ;; DONE state になるときにタイムスタンプを記録する。
;;
;; '(delete-by-moving-to-trash t) ;; ファイルを削除する代わりにゴミ箱へ送る。
;; * [2010-11-18 木]
;; cf. url: http://www.gnu.org/software/emacs/manual/html_node/emacs/Misc-File-Ops.html
;; You can tell Emacs to use the Trash by changing the variable delete-by-moving-to-trash to t.
;; This applies to file deletion via M-x delete-file, as well as M-x delete-directory
;; and file deletion in Dired.
;; ファイルを削除する代わりにゴミ箱へ送る。
;;
;; '(nxml-child-indent 1)
;; nxml-mode 子要素のインデント幅。
;;
;; '(backup-directory-alist (quote ((".*" . "N:/temp/emacs"))))
;; バックアップファイルを格納する場所。
;; http://blawat2015.no-ip.com/~mieki256/diary/200609073.html
;;
;; '(org-link-file-path-type (quote absolute))
;; org-mode の link を絶対パスで記す。
;;
;; '(org-deadline-warning-days 7)
;; deadline の何日前から warning を表示するか。
;;
;; '(truncate-partial-width-windows nil)
;; http://d.hatena.ne.jp/beiz23/20090713/1247476145
;; 左右に分割されたウィンドウではtruncate-linesがtでも折り返されないことがあります。それはtruncate-partial-width-windowsがtなど(非nil)になっているためでしょう。
;;
;; '(isearch-lazy-highlight nil)
;; isearch 実行中にハイライトする。
;; スペースなど大量にハイライト対象文字がある場合、かなり待たされる。
;; 待ち時間短縮のため、いったん OFF にする。
;;
;; '(org-columns-default-format "%25ITEM %TODO %3PRIORITY %TAGS %17Effort{:}")
;; デフォルトは '(org-columns-default-format "%25ITEM %TODO %3PRIORITY %TAGS")
;; M-x org-agenda-columns したときの列をカスタマイズする。
;; cf. http://orgmode.org/manual/Effort-estimates.html
;;
;; '(org-log-reschedule (quote time))
;; org-schedule でスケジュールを変更したときの挙動をカスタマイズする。
;; nil ⇒ 何もしない。
;; time ⇒ 時刻をログ記録する。
;; note ⇒ 時刻とノートをログ記録する。
;; ファイル単位でカスタマイズしたい場合、以下のオプションをファイルに記しておく。
;; #+STARTUP: nologreschedule
;; #+STARTUP: logreschedule
;; #+STARTUP: lognotereschedule
;;
;; http://th.nao.ac.jp/MEMBER/zenitani/elisp-j.html
;; (setq recentf-max-menu-items 30)
;; (setq recentf-max-saved-items 20)
;; (setq recentf-exclude '("^/[^/:]+:"))
;; 
;; * '(auto-save-default nil)
;; [2014-09-16 火] t ならばファイルを保存する時に「filename～」形式のバックアップファイルを作成する。
;; http://mymemo.weby117.com/develop/emacs_5.html
;; フレームが乱れる現象を回避したい。いったん nil にして様子を見る。
;;
;; * '(org-clock-idle-time 120)
;; [2014-09-16 火] 
;; http://orgmode.jp/doc-ja/org-ja.html
;; 変数org-clock-idle-timeを適当な整数値(例えば10や15)に設定することに
;; より、設定時間を超える休止のあとで戻ってきた場合にEmacsはアラートを
;; 出し、その休止時間をどのように処理するか尋ねます。
;;
;; * '(moccur-use-keyword t)
;; [2014-10-09 木]
;; Documentation:
;; Non-nil means to use moccur-search-keyword-alist.
;; moccur-search-keyword-alist is a variable defined in `color-moccur.el'.
;; Its value is
;; (("url" . "[fht]*ttp://[-_.!~*'()a-zA-Z0-9;/?:@&=+$,%#]+")
;;  ("mail" . "[^][<>@ \n]+@[-_!~*'()a-zA-Z0-9?@&=+$,%#]+\\.[-_.!~*'()a-zA-Z0-9?@&=+$,%#]+"))
;;
;; Non-nil にすると moccur-search-keyword-alist が有効になる。
;; M-x moccur url RET で url の代わりに上記正規表現で検索する。
;; 
;; * '(moccur-use-xdoc2txt t)
;; [2014-10-09 木]
;; Documentation:
;; Non-nil means to use xdoc2txt.
;; xdoc2txt is Windows software to convert Word/Excel/PDF etc to Text file.
;; http://www31.ocn.ne.jp/~h_ishida/xdoc2txt.html (Japanese site)
;; Non-nil にすると xdoc2txt を使う。
;; M-x shell で xdoc2txt が正常に動作しておく必要がある？

