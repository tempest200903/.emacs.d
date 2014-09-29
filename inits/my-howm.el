;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2013-11-13
;; my-howm.el
;; ----------------------------------------------------------------------------
;; * [2010-10-04 月] howm 1.3.9(?) 使用開始
;; [2013-08-12 月] N:\tool\gnupack\gnupack_devel-11.00\app\emacs\site-lisp\howm-1.4.1   使用開始
(require 'howm)
;; ----------------------------------------------------------------------------
;;url: http://www.bookshelf.jp/soft/meadow_38.html#SEC563
(setq howm-menu-lang 'ja)
;; ----------------------------------------------------------------------------
;; * [2010-10-21 木] keymap が衝突している。回避するため、 howm の方を変更する。
;;   - keymap in org-mode => It is bound to C-c , (org-priority &optional ACTION)
;;   - keymap in howm     => It is bound to C-c , , (howm-menu &optional FORCE-REFRESH LAST-CHANCE)
;;   - 変更手順
;;     - var howm-prefix に prefix keys を代入する。
;;     - func howm-set-keymap を 呼び出す。
(setq howm-prefix "\C-^")
(howm-set-keymap)
;; ----------------------------------------------------------------------------
;; * [2010-10-28 木] url: http://hiki.i-yt.info/hiki.cgi?org-mode+and+howm
;; 見出しを org-mode に合わせて、「*」に変更した。 が、効果がないようだ。
;; (setq howm-view-title-header "*")
;; ----------------------------------------------------------------------------
;; * [2010-11-01 月] emacs 上でのバッファ名を, ファイル名ではなくタイトルに.
;; cf. [[file:///N:/.emacs.d/howm-1.3.9.1/doc/README-j.html]]
(add-hook 'howm-mode-hook 'howm-mode-set-buffer-name)
(add-hook 'after-save-hook 'howm-mode-set-buffer-name)
;; タイトル「ほげ」のメモのバッファ名を「=ほげ」に. タイトルが AAA ならバッファ名を =AAA に.
;; 下の howm-mode-set-buffer-name を設定した上で…
(setq howm-buffer-name-format "=%s")
;; フレームタイトルバーにファイルフルパス名を表示する設定が有効だと、フレームタイトルバーにタイトルが表示されない。
;; ----------------------------------------------------------------------------
;; * [2011-01-07 金] org-mode on するとき howm-mode on する。
(add-hook 'org-mode-hook 'howm-mode)
(add-hook 'markdown-mode-hook 'howm-mode)
;; ----------------------------------------------------------------------------
;; * [2011-01-11 火] 複数ディレクトリを使いたい
;; その場で入力したディレクトリを, howm の【一覧モードで閲覧】
;; url: http://howm.sourceforge.jp/cgi-bin/hiki/hiki.cgi?SearchSpecifiedPath
;; ちなみに, 一覧バッファで G を押すと絞り込み検索ができます.
;; 更新時刻順でソートする版
;; howm-directory と同様にソートする版. howm-1.3.9.1 でテスト.
(defun my-howm-view-directory (dir)
  (interactive "DDirectory: ")
  (let ((howm-directory dir))
    (howm-normalize-show "" (howm-folder-items dir t))))
;; ----------------------------------------------------------------------
;; * [2011-10-03 月] howmM buffer に switch する。 howmM buffer がない場合は howm-menu 開始する。
(defun my-howmM-or-switch-to-buffer ()
  "Switch to *howmM:%menu%* buffer, or run `howm'."
  (interactive)
  (let ((buffer-name "*howmM:%menu%*"))
    (if (get-buffer buffer-name)
        (switch-to-buffer-other-window buffer-name)
      (call-interactively 'howm-menu)))
  )

;; ----------------------------------------------------------------------
;; * [2011-12-27 火] howmS buffer に switch する。 howmS buffer がない場合は howm-menu 開始する。
(defun my-howmS-or-switch-to-buffer ()
  "Switch to *howmS* buffer, or run `howm'."
  (interactive)
  (let ((buffer-name "*howmS*"))
    (if (get-buffer buffer-name)
        (switch-to-buffer-other-window buffer-name)
      (call-interactively 'howm-list-grep-fixed)))
  )

;; ----------------------------------------------------------------------
;; * [2013-11-01 金] http://howm.sourceforge.jp/README-j.html テンプレートの変更
(setq howm-template "= %title%cursor
%date %file
#+LAST_UPDATED: 
#+OPTIONS: ^:nil

")
(setq howm-template-date-format "[%Y-%m-%d %H:%M]")
(setq howm-template-file-format ">>> %s")
;; ** [2014-09-18 木] TODO org-mode 以外では #+OPTIONS: ^:nil は不要。
;; ----------------------------------------------------------------------
;; * [2013-11-01 金] http://howm.sourceforge.jp/README-j.html 対象ディレクトリの追加
;; (setq howm-search-path '("N:/howm/2013/10" "N:/howm/2013/09"))
;; (setq howm-search-other-dir t) ;; howm-toggle-search-other-dir のトグルの初期値 (t か nil)
;; TODO 変数 howm-search-path の設定を my-emacs-custom.el に移動する。
;; ----------------------------------------------------------------------------
;; * [2013-11-02 土] M-x customize
;; ~/.emacs.d/custom-goat/my-emacs-custom.el
;; ~/.emacs.d/custom-dn2/my-emacs-custom.el
;; (setq howm-file-name-format "%Y/%m/%Y-%m-%d-%H%M%S.howm.txt") ;; howm のファイル名
;; (setq howm-file-name-format "%Y-%m-%d-%H%M%S.howm.txt")
;; ----------------------------------------------------------------------
;; * [2014-09-27 土] https://github.com/znz/dot-emacs/blob/8434c73ba833791eedc1411360e10441e52b370e/init.el.d/50howm.el
(setq howm-menu-refresh-after-save nil) ; save 時にメニューを自動更新せず
;; ----------------------------------------------------------------------
(provide 'my-howm)
