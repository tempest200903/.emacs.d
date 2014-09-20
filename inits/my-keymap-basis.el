;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-keymap-basis.el
;; ======================================================================
(require 'my-bind-key-package)
;; TODO bind-key から my-bind-key-with-autoload に替える。
;; ----------------------------------------------------------------------
(define-key global-map (kbd "<f5>")                 'repeat)
(define-key global-map (kbd "C-;")                  'repeat)
(define-key global-map (kbd "C-z C-t")              'transpose-chars) ;; C-t を anything-command-map-prefix-key で使うため移動した。
;; ----------------------------------------------------------------------
;; * [2011-08-24 水] ffap.el カーソル位置付近にあるファイルパスを取り込む
;; ffap は `ffap-file-at-point                      ' and `ffap-url-at-point' を統合したコマンド。
;; find-file 系統
(define-key global-map (kbd "C-x C-f")              'ffap) ;; find-file を上書き。
(define-key global-map (kbd "C-z C-x C-f")          'find-file)
(define-key global-map (kbd "C-x 4 C-f")            'ffap-other-window) ;; find-file-other-window を上書き。
(define-key global-map (kbd "C-z C-x 4 C-f")        'find-file-other-window)
(define-key global-map (kbd "C-x 5 C-f")            'ffap-other-frame) ;; find-file-other-frame を上書き。
(define-key global-map (kbd "C-z C-x 5 C-f")        'find-file-other-frame)
;; find-file-read-only 系統
(define-key global-map (kbd "C-x C-r")              'ffap-read-only) ;; find-file-read-only を上書き。
(define-key global-map (kbd "C-z C-r")              'find-file-read-only)
(define-key global-map (kbd "C-x 4 C-r")            'ffap-read-only-other-window)
(define-key global-map (kbd "C-z C-x 4 C-r")        'find-file-read-only-other-window)
(define-key global-map (kbd "C-x 5 C-r")            'ffap-read-only-other-frame)
(define-key global-map (kbd "C-z C-x 5 C-r")        'find-file-read-only-other-frame)
;; find-alternate-file 系統
(define-key global-map (kbd "C-x C-v")              'ffap-alternate-file) ;; find-alternate-file を上書き。
(define-key global-map (kbd "C-z C-v")              'find-alternate-file)
(define-key global-map (kbd "C-x 4 C-v")            'ffap-alternate-file-other-qwindow)
(define-key global-map (kbd "C-z 4 C-v")            'find-alternate-file-other-window)
(define-key global-map (kbd "C-x 5 C-v")            'ffap-alternate-file-other-frame)
(define-key global-map (kbd "C-z 5 C-v")            'find-alternate-file-other-frame)
;; dired 系統
(define-key global-map (kbd "C-x d")                'ffap-dired) ;; dired を上書き。
(define-key global-map (kbd "C-z d")                'dired)
(define-key global-map (kbd "C-x 4 d")              'ffap-dired-other-window) ;; dired-other-window を上書き。
(define-key global-map (kbd "C-z 4 d")              'dired-other-window)
;; (define-key global-map (kbd "C-x 4 C-j")         'dired-jump-other-window) ;; dired-x.el にて定義済み。
(define-key global-map (kbd "C-z C-j")              'dired-jump-other-window) ;; alias
(define-key global-map (kbd "C-z C-x C-d")          'make-directory)
;; その他
(define-key global-map (kbd "M-s M-w")              'ffap-copy-string-as-kill) ;; ファイルパスを kill-ring にコピーする。 see my-kill-ring-save-or-ffap-copy-string-as-kill
(define-key global-map (kbd "M-s M-u")              'ffap-menu) ;; ffap.el で <C-S-mouse-3> に割り当て済み。
(define-key global-map (kbd "M-s M-]")              'ffap-next)
(define-key global-map (kbd "C-z C-s")              'save-some-buffers) ;; alias of C-x s
(define-key global-map (kbd "C-z m")                'bookmark-set) ;; alias of C-x r m
(define-key global-map (kbd "C-z i")                'insert-register) ;; alias of C-x r i
(define-key global-map (kbd "M-g M-g")              'my-goto-line-with-linum-mode)
;; ----------------------------------------------------------------------
;; * [2011-04-05 火] highlight-changes-mode 関連
;; emacs-terminal では <scroll> を使えない。別のキーに変更する。
(when (require                                      'hilit-chg nil t)
  (define-key global-map (kbd "M-g M-c")            'highlight-changes-mode)
  (define-key global-map (kbd "M-g M-v")            'highlight-changes-visible-mode)
  (define-key global-map (kbd "M-g C-p")            'highlight-changes-previous-change)
  (define-key global-map (kbd "M-g C-n")            'highlight-changes-next-change)
  )
;; TODO autoload hilit-chg
;; ----------------------------------------------------------------------
;; * [2013-11-01 金] mode 切り替え関連。
(define-key global-map (kbd "C-z l")                'linum-mode)
(define-key global-map (kbd "C-z C-\\")             'cua-selection-mode)
(define-key global-map (kbd "C-z g")                'graphviz-dot-mode)
(define-key global-map (kbd "C-z t")                'orgtbl-mode)
(define-key global-map (kbd "C-z h")                'hl-line-mode)
;; ----------------------------------------------------------------------
;; * [2011-08-29 月] capslock キーを活用する。 C-x C-* の alias として capslock * を割り当てる。
(define-prefix-command                              'my-oem-attn-map)
(define-key global-map (kbd "<oem-attn>")           'my-oem-attn-map)
(define-key my-oem-attn-map (kbd "s")               'save-buffer)
(define-key my-oem-attn-map (kbd "f")               'find-file-at-point)
(define-key my-oem-attn-map (kbd "h")               'mark-whole-buffer)
(define-key my-oem-attn-map (kbd "w")               'write-file)
(define-key my-oem-attn-map (kbd "q")               'toggle-read-only)
(define-key my-oem-attn-map (kbd "<return>")        'my-toggle-truncate-lines)
(define-key my-oem-attn-map (kbd "i")               'indent-rigidly)
(define-key my-oem-attn-map (kbd "v")               'ffap-alternate-file)
(define-key my-oem-attn-map (kbd "k")               'kill-buffer)
(define-key my-oem-attn-map (kbd "r")               'ffap-read-only)
;; ----------------------------------------------------------------------
;; * [2011-09-09 金] macro 関連
(define-key kmacro-keymap (kbd "i")                 'insert-kbd-macro)
;; ----------------------------------------------------------------------
;; * [2011-10-14 金] カーソル移動。
(define-key global-map (kbd "C-{")                  'previous-error) ;; alias of M-g M-p. 連打しやすくする。
(define-key global-map (kbd "C-}")                  'next-error)  ;; alias of M-g M-n. 連打しやすくする。
(define-key global-map (kbd "M-p")                  'previous-logical-line)
(define-key global-map (kbd "M-n")                  'forward-line)
;; next-error It is bound to C-}, C-x `, M-g n, M-g M-n. C-x ` はなくてもいい。別の割り当てをする。
(define-key global-map (kbd "C-z `")                'compile)
(define-key global-map (kbd "C-z C-z")              'recompile)
;; ----------------------------------------------------------------------
;; * [2011-11-10 木] コメントに改行を挿入する
;; (kbd "C-x C-j") は dired-x の dired-jump で予約済み。
;; M-x comment-dwim {It is bound to M-;}
;; M-x newline-and-indent {It is bound to C-j}
;; なので、これに近い kbd にする。
;; 連打できるように C-M-; を採用した。
(define-key global-map (kbd "C-M-;")                'comment-indent-new-line)
;; ----------------------------------------------------------------------
;; * [2011-11-16 水] mouse
;; (define-key global-map (kbd "<S-mouse-3>")       'yank-pop) ;; まったく使わないので廃止。
;; ----------------------------------------------------------------------
;; * [2011-12-05 月] M-% は押しにくいので alias.
;; しかし、 isearch-map では M-% を使わないと引継ぎできない。 isearch-map でも押しやすいキーで引継ぎしたい。
(define-key global-map (kbd "M-s M-q")              'query-replace)
(define-key global-map (kbd "M-s M-s M-q")          'query-replace-regexp)
;; かな漢字変換が on のとき M-s o すると minibuffer に o が入力されてしまうのを回避する。
(define-key global-map (kbd "M-s M-o")              'occur)
(define-key global-map (kbd "M-s M-:")              're-builder)
;; ----------------------------------------------------------------------
;; * [2011-12-06 火] calc 関連 alias.
;; calc-dispatch は default key 定義済み。しかし長いので短縮 alias.
;; (define-key global-map (kbd "C-x *")             'calc-dispatch) ;; Invoke the GNU Emacs Calculator.  See `calc-dispatch-help' for details.
(define-key global-map (kbd "<S-f12>")              'calc-dispatch)
;; 使用例1。 Shift 押したまま <f12> q で quick-calc
;; 使用例2。 Shift 押したまま <f12> * で最後に起動した calc を再開。
;; 使用例3。 "3 + 4" を region 選択。
;; Shift 押したまま <f12> g で region を calc に送る。
;; Shift 押したまま <f12> y で計算結果を buffer に貼り付け。
;; ----------------------------------------------------------------------
;; * [2011-12-20 火] 行末尾空白を削除する。
(define-key global-map (kbd "C-x <C-backspace>")    'delete-trailing-whitespace)
;; ----------------------------------------------------------------------
;; * [2011-12-22 木] elisp ソースコードブラウズ用。他の言語でも使えるか？
(define-key global-map (kbd "M-g M-.")              'find-function-at-point)
;; kbd 由来は find-tag {It is bound to M-.} なので。
;; ----------------------------------------------------------------------
;; * [2012-04-11 水] paren
;; (kbd "%" に割り当てていたが、 view-mode では衝突するので回避する。
;; (kbd "M-g M-8") なら衝突しない。
;; どの kbd がいい？
(define-key global-map (kbd "M-g M-:")              'match-paren)
(define-key global-map (kbd "M-g M-8")              'match-paren)
(define-key global-map "%"                          'match-paren)
;; ----------------------------------------------------------------------
;; * [2012-04-11 水] paren
(define-key global-map (kbd "M-?")                  'end-of-buffer-other-window) ;; alias of <M-end>. ホームポジションから届くようにする。
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
(define-key global-map (kbd "C-h C-x C-b")          'describe-prefix-bindings)
(define-key global-map (kbd "C-h C-z C-f")          'describe-face)
(define-key global-map (kbd "C-h C-x C-t")          'describe-text-properties)
(define-key global-map (kbd "C-h C-x C-u")          'customize)
(define-key global-map (kbd "C-h C-x C-o")          'org-customize)
(define-key global-map (kbd "C-h C-x C-s")          'customize-save-customized)
(when (require                                      'my-describehilit-chg nil t)
  (define-key global-map (kbd "C-h C-x C-f")        'describe-face-at-point)
  )
;; ----------------------------------------------------------------------
;; * [2011-09-30 金] view-hello-file を実行するとハングアップする。
;; emacs 起動直後ならハングアップはしないが1秒待たされる。とりあえず、
;; (kbd "C-h h") で起動しないようにする。
(define-key global-map (kbd "C-h h")                'backward-delete-char-untabify) ;; backspace キーと同じ。なぜか、かな漢字変換Onでも入力できる。
;; ----------------------------------------------------------------------
;; * [2013-10-31 木] 
(define-key global-map (kbd "C-z C-w")              'my-copy-line)
(define-key global-map (kbd "C-z C-k")              'kill-whole-line)
					; Tips. C-z C-k C-; C-; ... で範囲拡大。
(define-key global-map (kbd "C-z C-o")              'my-join-line-next)
					; Tips. C-z C-j C-; C-; ... で範囲拡大。
                                        ; C-x C-o は行をつなげない。 C-z C-o は行をつなげる。
(define-key global-map (kbd "C-/")                  'undo)
(define-key global-map (kbd "C-x C-/")              'redo)
(define-key global-map (kbd "C-z a r")              'align-regexp)
;; ----------------------------------------------------------------------
;; * [2013-11-01 金]
(define-key global-map (kbd "C-w")                  'kill-region-or-backward-kill-word)
(define-key global-map (kbd "C-z C-d")              'kill-word-at-point)
;; ----------------------------------------------------------------------
;; * [2013-11-03 日] my-rename-file-and-buffer.el
;; (bind-key (kbd "C-x RET C-w")                       'my-rename-file-and-buffer)
;; (bind-key (kbd "C-x RET C-k")                       'my-delete-current-buffer-file)
(my-bind-key-with-autoload "my-rename-file-and-buffer" "C-x RET C-w" 'my-rename-file-and-buffer)
(my-bind-key-with-autoload "my-rename-file-and-buffer" "C-x RET C-k" 'my-delete-current-buffer-file)
;; ----------------------------------------------------------------------
;; * [2013-11-07 木] my-toggle-truncate-lines.el
(define-key global-map (kbd "C-z C-q")              'my-toggle-truncate-lines) 
;; ----------------------------------------------------------------------
;; * [2014-01-07 火]
(define-key global-map (kbd "C-z C-x C-i")          'tabify) 
(define-key global-map (kbd "C-z C-i")              'untabify) 
(define-key global-map (kbd "C-z C-y")              'picture-duplicate-line)
;; ----------------------------------------------------------------------
;; * [2014-02-20 木] my-occur.el から移転。
(define-key global-map (kbd "M-s M-b")              'multi-occur-in-matching-buffers)
(define-key global-map (kbd "M-s i")                'isearch-highlight-regexp)
(define-key global-map (kbd "M-s d")                'set-selective-display)
(define-key global-map (kbd "M-g M-o")              'my-occur-or-switch-to-buffer)
(define-key global-map (kbd "M-g M-m")              'my-moccur-or-switch-to-buffer)
(define-key global-map (kbd "M-s M-m")              'moccur)
(define-key global-map (kbd "M-s .")                'my-moccur-today)
;; ----------------------------------------------------------------------
;; * [2014-03-19 水] Emacs から エクスプローラを起動するユーティリティ。
(define-key global-map (kbd "C-z e")                'my-explorer-current-directory)
;; ----------------------------------------------------------------------
;; * [2014-03-20 木] my-yank-special.el
(define-key global-map (kbd "C-z C-8")              'my-yank-with-PARENTHESIS)
(define-key global-map (kbd "C-z C-9")              'my-yank-with-CURLY-BRACKET)
(define-key global-map (kbd "C-z C-3")              'my-yank-with-TORTOISE-SHELL-BRACKET)
(define-key global-map (kbd "C-z [")                'my-yank-with-CORNER-BRACKET)
(define-key global-map (kbd "C-z ]")                'my-yank-with-WHITE-CORNER-BRACKET)
(define-key global-map (kbd "C-z C-2")              'my-yank-with-QUOTATION-MARK)
(define-key global-map (kbd "C-z C-7")              'my-yank-with-APOSTROPHE)
(define-key global-map (kbd "C-z C-0")              'my-yank-with-BLACK-LENTICULAR-BRACKET)
(define-key global-map (kbd "C-z C-1")              'my-yank-with-ANGLE-BRACKET)
(define-key global-map (kbd "C-z C-4")              'my-yank-with-DOUBLE-ANGLE-BRACKET)
(define-key global-map (kbd "C-z C-[ C-]")          'my-yank-with-SQUARE-BRACKET)
(define-key global-map (kbd "C-z C-,")              'my-yank-with-xml-comment)
(define-key global-map (kbd "C-z C-.")              'my-yank-with-xml-tag)
(define-key global-map (kbd "C-z C--")              'my-yank-with-erb-print)
;; ----------------------------------------------------------------------
;; * [2014-04-17 木] my-date.el
;; query-replace の入力中 minibuffer では M-s が予約済みなので、他のキーを割り当てる。
;; 昨日日付を今日日付に置換したい場合、昨日日付を選択してから、
;; mark-sexp (C-M-@) query-replace (M-s M-q) yank (C-y) RET my-date-insert-today (C-z .) RET
(define-key global-map (kbd "C-z .")                'my-date-insert-today)
(define-key global-map (kbd "C-z ,")                'my-date-replace-today)
;; ----------------------------------------------------------------------
;; * [2014-04-17 木] my-occur.el
(define-key global-map (kbd "M-s [")                'my-occur-link)
;; ----------------------------------------------------------------------
;; * [2014-07-30 水]
;; | kbd   | default        | my                |
;; | C-q   | quoted-insert  | other-window      |
;; | C-M-q | indent-pp-sexp | quoted-insert     |
;; | C-z q | empty          | indent-pp-sexp    |
(define-key global-map (kbd "C-q")                  'my-other-window-or-split)
(define-key global-map (kbd "C-M-q")                'quoted-insert)
(define-key global-map (kbd "C-z q")                'indent-pp-sexp)
;; ----------------------------------------------------------------------
;; * [2012-01-27 金]
(define-key global-map (kbd "M-w")                  'my-kill-ring-save-or-ffap-copy-string-as-kill)
(define-key global-map (kbd "M-s M-x")              'my-kill-buffer-file-name)
;; ----------------------------------------------------------------------
;; * [2014-09-06 土]
(define-key global-map (kbd "C-t C-f")              'next-multiframe-window)
(define-key global-map (kbd "C-t C-b")              'previous-multiframe-window)
(define-key global-map (kbd "C-t C-n")              'raise-other-frame)
(define-key global-map (kbd "C-t C-p")              'raise-other-frame-minus)
(define-key global-map (kbd "C-t 4")                'delete-frame)
(define-key global-map (kbd "C-t 5")                'make-frame-command)
;; ----------------------------------------------------------------------
;; * [2014-09-06 土] anything 廃止した代わりのキーバインド関連
(define-key global-map (kbd "C-t C-;")              'recentf-open-files)
(define-key global-map (kbd "C-t C-l")              'bookmark-bmenu-list)
;; ----------------------------------------------------------------------
;; * [2014-09-08 月] migemo
(define-key global-map (kbd "C-z C-x C-s")          'migemo-isearch-toggle-migemo)
;; ----------------------------------------------------------------------
;; * [2014-09-09 火] bm
(define-key global-map (kbd "M-g M-t")              'bm-toggle)
(define-key global-map (kbd "M-g M-]")              'bm-next)
(define-key global-map (kbd "M-g M-[")              'bm-previous)
(define-key global-map (kbd "M-g M-r")              'bm-bookmark-regexp)
(define-key global-map (kbd "M-g M-i")              'bm-show)
(define-key global-map (kbd "M-g M-I")              'bm-show-all)
(define-key global-map (kbd "M-g 0 M-i")            'bm-remove-all-current-buffer)
(define-key global-map (kbd "M-g 0 M-o")            'bm-remove-all-all-buffers)
(define-key global-map (kbd "M-g M-a")              'bm-bookmark-annotate)
;; ----------------------------------------------------------------------
;; * [2014-09-13 土] my-search-keybind
(define-key global-map (kbd "C-h M-s M-o")          'my-search-keybind)
;; ----------------------------------------------------------------------
;; * [2014-09-18 木] my-wc.el
(my-bind-key-with-autoload "my-wc"   "C-z C-x l"    'my-region-command-wc-to-minibuffer)
(my-bind-key-with-autoload "my-calc" "C-z *"        'my-calc-hour-in-outline)
;; ----------------------------------------------------------------------
(load "~/.emacs.d/inits/my-emacs-lisp-mode-map")
(load "~/.emacs.d/inits/my-loccur-keymap-autoload")
(load "~/.emacs.d/inits/my-visual-regexp-keymap-autoload")
(load "~/.emacs.d/inits/my-rotate-keymap-autoload")
(load "~/.emacs.d/inits/my-howm-keymap.el")
