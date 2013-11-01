;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-keymap-basis.el
;; ======================================================================
(define-key global-map (kbd "<f5>") 'repeat)

(define-key global-map (kbd "C-;") 'repeat) ;; 連打しやすいキーバインドにしたい。
;; [2013-09-10 火] 実験中。
;; 便利な例1。 C-u 8 C-x TAB C-; C-;
;; 便利な例1。 M-g M-n C-; C-;

;; (global-unset-key (kbd "C-t"))
(define-key global-map (kbd "C-z C-t") 'transpose-chars) ;; C-t を anything-command-map-prefix-key で使うため移動した。
;; ----------------------------------------------------------------------
;; * [2011-08-24 水] ffap.el カーソル位置付近にあるファイルパスを取り込む
;; ffap は `ffap-file-at-point' and `ffap-url-at-point' を統合したコマンド。
;; find-file 系統
(define-key global-map (kbd "C-x C-f")         'ffap) ;; find-file を上書き。
(define-key global-map (kbd "C-z C-x C-f")     'find-file)
(define-key global-map (kbd "C-x 4 C-f")       'ffap-other-window) ;; find-file-other-window を上書き。
(define-key global-map (kbd "C-z C-x 4 C-f")   'find-file-other-window)
(define-key global-map (kbd "C-x 5 C-f")       'ffap-other-frame) ;; find-file-other-frame を上書き。
(define-key global-map (kbd "C-z C-x 5 C-f")   'find-file-other-frame)
;; find-file-read-only 系統
(define-key global-map (kbd "C-x C-r")         'ffap-read-only) ;; find-file-read-only を上書き。
(define-key global-map (kbd "C-z C-r")         'find-file-read-only)
(define-key global-map (kbd "C-x 4 C-r")       'ffap-read-only-other-window)
(define-key global-map (kbd "C-z C-x 4 C-r")   'find-file-read-only-other-window)
(define-key global-map (kbd "C-x 5 C-r")       'ffap-read-only-other-frame)
(define-key global-map (kbd "C-z C-x 5 C-r")   'find-file-read-only-other-frame)
;; find-alternate-file 系統
(define-key global-map (kbd "C-x C-v")         'ffap-alternate-file) ;; find-alternate-file を上書き。
(define-key global-map (kbd "C-z C-v")         'find-alternate-file)
(define-key global-map (kbd "C-x 4 C-v")       'ffap-alternate-file-other-qwindow)
(define-key global-map (kbd "C-z 4 C-v")       'find-alternate-file-other-window)
(define-key global-map (kbd "C-x 5 C-v")       'ffap-alternate-file-other-frame)
(define-key global-map (kbd "C-z 5 C-v")       'find-alternate-file-other-frame)
;; dired 系統
(define-key global-map (kbd "C-x d")           'ffap-dired) ;; dired を上書き。
(define-key global-map (kbd "C-z d")           'dired)
(define-key global-map (kbd "C-x 4 d")         'ffap-dired-other-window) ;; dired-other-window を上書き。
(define-key global-map (kbd "C-z 4 d")         'dired-other-window)
;; (define-key global-map (kbd "C-x 4 C-j")       'dired-jump-other-window) ;; dired-x.el にて定義済み。
(define-key global-map (kbd "C-z C-x C-d")     'make-directory)
;; その他
(define-key global-map (kbd "M-s M-w")         'ffap-copy-string-as-kill) ;; ファイルパスを kill-ring にコピーする。 see my-kill-ring-save-or-ffap-copy-string-as-kill
(define-key global-map (kbd "M-s M-u")         'ffap-menu) ;; ffap.el で <C-S-mouse-3> に割り当て済み。
(define-key global-map (kbd "M-s M-]")         'ffap-next)
(define-key global-map (kbd "C-z C-s")         'save-some-buffers) ;; alias of C-x s
(define-key global-map (kbd "C-z m")           'bookmark-set) ;; alias of C-x r m
(define-key global-map (kbd "C-z l")           'linum-mode)
;; ----------------------------------------------------------------------
;; * [2011-04-05 火] highlight-changes-mode 関連
;; emacs-terminal では <scroll> を使えない。別のキーに変更する。
(when (require 'hilit-chg nil t)
  (define-key global-map (kbd "M-g M-c")       'highlight-changes-mode)
  (define-key global-map (kbd "M-g M-v")       'highlight-changes-visible-mode)
  (define-key global-map (kbd "M-g M-b")       'highlight-changes-previous-change)
  (define-key global-map (kbd "M-g M-f")       'highlight-changes-next-change)
  )
;; ----------------------------------------------------------------------
;; * [2011-08-29 月] capslock キーを活用する。 C-x C-* の alias として capslock * を割り当てる。
(define-prefix-command 'my-oem-attn-map)
(define-key global-map (kbd "<oem-attn>")      'my-oem-attn-map)
(define-key my-oem-attn-map (kbd "s")   'save-buffer)
(define-key my-oem-attn-map (kbd "f")   'find-file-at-point)
(define-key my-oem-attn-map (kbd "h")   'mark-whole-buffer)
(define-key my-oem-attn-map (kbd "w")   'write-file)
(define-key my-oem-attn-map (kbd "q")   'toggle-read-only)
(define-key my-oem-attn-map (kbd "<return>")    'my-toggle-truncate-lines)
(define-key my-oem-attn-map (kbd "i")   'indent-rigidly)
(define-key my-oem-attn-map (kbd "v")   'ffap-alternate-file)
(define-key my-oem-attn-map (kbd "k")   'kill-buffer)
(define-key my-oem-attn-map (kbd "r")   'ffap-read-only)
;; ----------------------------------------------------------------------
;; * [2011-09-09 金] macro 関連
(define-key kmacro-keymap (kbd "i")     'insert-kbd-macro)
;; ----------------------------------------------------------------------
;; * [2011-10-14 金] カーソル移動。
(define-key global-map (kbd "C-{")     'previous-error) ;; alias of M-g M-p. 連打しやすくする。
(define-key global-map (kbd "C-}")     'next-error)  ;; alias of M-g M-n. 連打しやすくする。
(define-key global-map (kbd "M-p")     'previous-logical-line)
(define-key global-map (kbd "M-n")     'forward-line)

;; next-error It is bound to C-}, C-x `, M-g n, M-g M-n. C-x ` はなくてもいい。別の割り当てをする。
(define-key global-map (kbd "C-z `")   'compile)

;; ----------------------------------------------------------------------
;; * [2011-11-10 木] コメントに改行を挿入する
;; (kbd "C-x C-j") は dired-x の dired-jump で予約済み。
;; M-x comment-dwim {It is bound to M-;}
;; M-x newline-and-indent {It is bound to C-j}
;; なので、これに近い kbd にする。
;; 連打できるように C-M-; を採用した。
;;
(define-key global-map (kbd "C-M-;")   'comment-indent-new-line)
;; ----------------------------------------------------------------------
;; * [2011-11-16 水] mouse
(define-key global-map (kbd "<S-mouse-3>")     'yank-pop)
;; ----------------------------------------------------------------------
;; * [2011-12-05 月] M-% は押しにくいので alias.
;; しかし、 isearch-map では M-% を使わないと引継ぎできない。
(define-key global-map (kbd "M-s M-q")         'query-replace)
(define-key global-map (kbd "M-s M-r")         'query-replace-regexp)
;; かな漢字変換が on のとき M-s o すると minibuffer に o が入力されてしまう。暫定回避策。
(define-key global-map (kbd "M-s M-o")         'occur)
(define-key global-map (kbd "M-s M-:")         're-builder)
;; ----------------------------------------------------------------------
;; * [2011-12-06 火] calc 関連 alias.
;; calc-dispatch は default key 定義済み。
;; (define-key global-map (kbd "C-x *") 'calc-dispatch) ;; Invoke the GNU Emacs Calculator.  See `calc-dispatch-help' for details.
;; しかし長いので短縮 alias.
(define-key global-map (kbd "<S-f12>")         'calc-dispatch)
;; 使用例1。 Shift 押したまま <f12> q で quick-calc
;; 使用例2。 Shift 押したまま <f12> * で最後に起動した calc を再開。
;; 使用例3。 "3 + 4" を region 選択。
;; Shift 押したまま <f12> g で region を calc に送る。
;; Shift 押したまま <f12> y で計算結果を buffer に貼り付け。
;; ----------------------------------------------------------------------
;; * [2011-12-20 火] 行末尾空白を削除する。
(define-key global-map (kbd "C-x <C-backspace>")       'delete-trailing-whitespace)
;; ----------------------------------------------------------------------
;; * [2011-12-22 木] elisp ソースコードブラウズ用。他の言語でも使えるか？
(define-key global-map (kbd "M-g M-.")         'find-function-at-point)
;; kbd 由来は find-tag {It is bound to M-.} なので。
;; ----------------------------------------------------------------------
;; * [2012-01-20 金] gnupack emacs で　color-theme を使う。
;; (load "n:/tool/gnupack/gnupack_basic-7.02/app/emacs/site-lisp/color-theme/themes/color-theme-library.el")
;; GNU Emacs 23.2.1 には color-theme がないので、引数 NOERROR を t にしておく。
(when (require 'color-theme nil t)
  (define-key global-map (kbd "<M-pause>")     'color-theme-emacs-21)
  )
;; ----------------------------------------------------------------------
;; * [2012-04-11 水] paren
;; (kbd "%" に割り当てていたが、 view-mode では衝突するので回避する。
(define-key global-map (kbd "M-g M-:")         'match-paren)
;; ----------------------------------------------------------------------
;; * [2012-04-11 水] paren
(define-key global-map (kbd "M-?")             'end-of-buffer-other-window) ;; alias of <M-end>. ホームポジションから届くようにする。
;; ----------------------------------------------------------------------
;; * [2012-06-22 金] alias
(define-key global-map (kbd "M-s M-n")         'highlight-symbol-next) ;; alias of M-s s n runs the command highlight-symbol-next
(define-key global-map (kbd "M-s M-p")         'highlight-symbol-prev) ;; alias of M-s s p runs the command highlight-symbol-prev
;; ----------------------------------------------------------------------
;; * [2012-11-16 金] diff-mode では M-g に revert-buffer が割り当てられていて邪魔だ。 <S-F1> を使う。
(when (require 'diff-mode nil t)
  (define-key diff-mode-map (kbd "M-g") nil)
  )
;; ----------------------------------------------------------------------
;; * [2011-09-06 火] describe 関連, C-h で始まるキーバインド。
;; <f1> および C-h を prefix に使うことのデメリット。
;; C-x C-h で C-x を prefix として使うキーバインドを表示する。
;; C-h C-h ではこれができない。
;; C-h C-x を prefix に使えば、このデメリットは発生しない。
;; tips. C-h で始まる bindings を見るにはどうすればいいか？
;; C-h C-h は help-for-help に割り当て済みなのでできない。
;; describe-prefix-bindings を割り当てれば解決する。
;; 他の prefix は <prefix> C-h でできる。
(define-key global-map (kbd "C-h C-x C-b")      'describe-prefix-bindings)
(define-key global-map (kbd "C-h C-z C-f")      'describe-face)
(define-key global-map (kbd "C-h C-x C-t")      'describe-text-properties)
(define-key global-map (kbd "C-h C-x C-u")      'customize)
(define-key global-map (kbd "C-h C-x C-o")      'org-customize)
(define-key global-map (kbd "C-h C-s")          'customize-save-customized)
(when (require 'my-describehilit-chg nil t)
  (define-key global-map (kbd "C-h C-x C-f")    'describe-face-at-point)
  )
;; ----------------------------------------------------------------------
;; * [2011-09-30 金] view-hello-file を実行するとハングアップする。
;; emacs 起動直後ならハングアップはしないが1秒待たされる。とりあえず、
;; (kbd "C-h h") で起動しないようにする。
(define-key global-map (kbd "C-h h")   'backward-delete-char-untabify) ;; backspace キーと同じ。なぜか、かな漢字変換Onでも入力できる。
;; ----------------------------------------------------------------------
;; * [2012-02-09 木] 空いている keybind
;; (kbd "C-x ?") is undefined
;; (kbd "C-z ?") is undefined
;; "?" は使わない方がいい？ http://ergoemacs.org/emacs/keyboard_shortcuts.html The question mark ? or any combination with it. (due to emacs technical implementation quirk)
;; (kbd "C-h C-j") is undefined
;; (kbd "C-h C-k") is undefined
;; (kbd "C-h C-l") is undefined
;; (kbd "C-h C-q") is undefined
;; (kbd "C-h C-r") is undefined
;; (kbd "C-h C-s")
;; (kbd "C-h C-u") is undefined
;; (kbd "C-h C-v") is undefined
;; (kbd "C-h C-y") is undefined
;; (kbd "C-h C-z") is undefined
;; (kbd "C-h C-x ") で始まるキーバインド。
;;                      C-h C-x C-f     describe-face-at-point
;; 上記以外の "C-h C-<alpha>" は定義済み。
;; (kbd "M-+") is undefined
;; (kbd "C-;") is undefined ;; prefix に使用可能。
;; (kbd "C-M-g") is undefined ;; prefix に使用可能。
;; (kbd "C-M-z") is undefined ;; prefix に使用可能。
;; <C-M-backspace>
;; (kbd "C-z C-z") is undefined
;; (kbd "<C-M-attn>") is undefined
;; ----------------------------------------------------------------------
;; * [2013-10-31 木] auto-load my-copy-line
;; ~/.emacs.d/inits/my-copy-line.el
(autoload 'my-copy-line "my-copy-line" nil t)
(autoload 'my-join-line-next "my-copy-line" nil t)
(define-key global-map (kbd "C-z C-w") 'my-copy-line)
(define-key global-map (kbd "C-z C-k") 'kill-whole-line)
					; Tips. C-z C-k C-; C-; ... で範囲拡大。
(define-key global-map (kbd "C-z C-j") 'my-join-line-next)
					; Tips. C-z C-j C-; C-; ... で範囲拡大。
;; * [2013-10-31 木]
(autoload 'redo "redo+" nil t)
(define-key global-map (kbd "C-/") 'undo)
(define-key global-map (kbd "C-x C-/") 'redo)
;; ----------------------------------------------------------------------
;; * [2013-10-31 木]
(define-key global-map (kbd "C-z a r") 'align-regexp)
;; ----------------------------------------------------------------------
;; * [2013-11-01 金]
(autoload 'kill-region-or-backward-kill-word "my-backward-kill-word" nil t)
(autoload 'kill-word-at-point "my-backward-kill-word" nil t)
(define-key global-map (kbd "C-w") 'kill-region-or-backward-kill-word)
(define-key global-map (kbd "C-z C-d") 'kill-word-at-point)
;; ----------------------------------------------------------------------
;; * [2013-11-01 金]
(autoload 'my-goto-line-with-linum-mode "my-goto-line" nil t)
(define-key global-map (kbd "M-g M-g") 'my-goto-line-with-linum-mode)
;; ----------------------------------------------------------------------
;; * [2013-11-01 金]
;; (autoload 'my-cua-selection-mode "my-cua-mode" nil t)
;; (define-key global-map (kbd "C-z C-\\") 'my-cua-selection-mode)
(define-key global-map (kbd "C-z C-\\") 'cua-selection-mode)
