;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; =============================================================================
;; #+TITLE: .emacs.d／inits／my-howm.el
;; #+LAST_UPDATED: 2013-10-20
;; ----------------------------------------------------------------------------
;; * [2010-10-04 月] howm 1.3.9(?) 使用開始
;; [2013-08-12 月] N:\tool\gnupack\gnupack_devel-11.00\app\emacs\site-lisp\howm-1.4.1   使用開始
(require 'howm)
;; ----------------------------------------------------------------------------
;;url: http://www.bookshelf.jp/soft/meadow_38.html#SEC563
(setq howm-menu-lang 'ja)
;; ----------------------------------------------------------------------------
;; howm のファイル名
;; (setq howm-file-name-format "%Y/%m/%Y-%m-%d-%H%M%S.howm.txt")
;; M-x customize で変更して ~/.emacs.d/$HOSTNAME/my-emacs-custom.el に保存するべし。
;; ----------------------------------------------------------------------------
;; * [2010-10-21 木]
;; - keymap が衝突している。回避するため、 howm の方を変更する。
;;   - keymap in org-mode
;;     - It is bound to C-c , (org-priority &optional ACTION)
;;   - keymap in 
;;     - It is bound to C-c , , (howm-menu &optional FORCE-REFRESH LAST-CHANCE)
;; - 変更手順
;;   - var howm-prefix に prefix keys を代入する。
;;   - func howm-set-keymap を 呼び出す。
;; - cf. [[file:n:/.emacs.d/howm-1.3.9.1/howm-vars.el]]
;;   (defvar howm-prefix "\C-c," "Howm commands are invoked by this prefix + some keys.")
;; - cf. [[file:n:/.emacs.d/howm-1.3.9.1/howm-mode.el]]
;;   (defun howm-set-keymap
;; (setq howm-prefix "\C-^")
;; (howm-set-keymap)
;; ----------------------------------------------------------------------------
;; * [2010-11-02 火]
(global-set-key (kbd "C-^") nil)
(setq howm-prefix "\C-^")
(howm-set-keymap)
;; ----------------------------------------------------------------------------
;; * [2011-04-06 水] マクロで C-SPC (set-mark-command) を含む操作を記録すると、
;; M-x insert-kbd-macro でスペースが認識されずに正常動作しない。
;; これを回避するため、代わりのキーバインドを用意する。
;; (global-set-key (kbd "C-@ C-@") 'set-mark-command)
;; 例 M-x insert-kbd-macro => (fset 'temp1 [?\C-  ?\C-a ?\M-w])
;; 例 M-x insert-kbd-macro => (fset 'temp2 "\C-@\C-@\C-a\367")
;; ----------------------------------------------------------------------------
;; * [2010-10-28 木]
;; cf. url: http://hiki.i-yt.info/hiki.cgi?org-mode+and+howm
;; 見出しを org-mode に合わせて、「*」に変更した。 が、効果がないようだ。
;; (setq howm-view-title-header "*")
;; ----------------------------------------------------------------------------
;; * [2010-11-01 月]
;; cf. [[file:///N:/.emacs.d/howm-1.3.9.1/doc/README-j.html]]
;; emacs 上でのバッファ名を, ファイル名ではなくタイトルに.
;; (ファイル名自体は変更しない)
(add-hook 'howm-mode-hook 'howm-mode-set-buffer-name)
(add-hook 'after-save-hook 'howm-mode-set-buffer-name)
;; タイトル「ほげ」のメモのバッファ名を「=ほげ」に
;; タイトルが AAA ならバッファ名を =AAA に.
;; 下の howm-mode-set-buffer-name を設定した上で…
(setq howm-buffer-name-format "=%s")
;; フレームタイトルバーにファイルフルパス名を表示する設定が有効だと、フレームタイトルバーにタイトルが表示されない。
;; ----------------------------------------------------------------------------
;; * [2011-01-07 金]
;; org-mode on するとき howm-mode on する。
(add-hook 'org-mode-hook 'howm-mode)
;; ----------------------------------------------------------------------------
;; * [2011-01-11 火] 複数ディレクトリを使いたい
;; ** 使い方
;; その場で入力したディレクトリを, howm の【一覧モードで閲覧】
;; url: http://howm.sourceforge.jp/cgi-bin/hiki/hiki.cgi?SearchSpecifiedPath
;; ちなみに, 一覧バッファで G を押すと絞り込み検索ができます.
;; 更新時刻順でソートする版
;; howm-directory と同様にソートする版. howm-1.3.9.1 でテスト.
;; ** 評価
;; ファイル数が多いと、一覧が出るまで数秒かかる。フリーズしたように見えるがしばらく待つべし。
(defun my-howm-view-directory (dir)
  (interactive "DDirectory: ")
  (let ((howm-directory dir))
    (howm-normalize-show "" (howm-folder-items dir t))))
(define-key global-map (kbd "C-^ G") 'my-howm-view-directory)
;; ----------------------------------------------------------------------
;; * [2011-10-03 月] howmM buffer に switch する。 howmM buffer がない場合は howm-menu 開始する。
(defun my-howmM-or-switch-to-buffer ()
  "Switch to *howmM:%menu%* buffer, or run `howm'."
  (interactive)
  (if (get-buffer "*howmM:%menu%*")
      (switch-to-buffer-other-window "*howmM:%menu%*")
    (call-interactively 'howm-menu)))
(global-set-key (kbd "C-^ C-m") 'my-howmM-or-switch-to-buffer)
;; ----------------------------------------------------------------------
;; * [2011-12-27 火] howmS buffer に switch する。 howmS buffer がない場合は howm-menu 開始する。
(defun my-howmS-or-switch-to-buffer ()
  "Switch to *howmS* buffer, or run `howm'."
  (interactive)
  (if (get-buffer "*howmS*")
      (switch-to-buffer-other-window "*howmS*")
    (call-interactively 'howm-list-grep-fixed)))
(global-set-key (kbd "C-^ C-s") 'my-howmS-or-switch-to-buffer)
;; ----------------------------------------------------------------------
;; * [2012-07-26 木] howm-1.3.9.2
(define-key global-map (kbd "C-^ e") 'howm-remember)
(define-key global-map (kbd "C-^ b") 'howm-list-buffers)
(define-key global-map (kbd "C-^ x") 'howm-list-mark-ring)
(define-key global-map (kbd "C-^ o") 'howm-occur)

