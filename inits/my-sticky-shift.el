;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; ======================================================================
;; * [2011-09-30 金] shiftキーではなく、「;(semicolon)→アルファベット」で大文字に変換。
;; url: http://homepage1.nifty.com/blankspace/emacs/sticky.html

(when t
  (progn
    (defvar sticky-key ";")
    (defvar sticky-list
      '(("a" . "A")("b" . "B")("c" . "C")("d" . "D")("e" . "E")("f" . "F")("g" . "G")
        ("h" . "H")("i" . "I")("j" . "J")("k" . "K")("l" . "L")("m" . "M")("n" . "N")
        ("o" . "O")("p" . "P")("q" . "Q")("r" . "R")("s" . "S")("t" . "T")("u" . "U")
        ("v" . "V")("w" . "W")("x" . "X")("y" . "Y")("z" . "Z")
        ("1" . "!")("2" . "@")("3" . "#")("4" . "$")("5" . "%")("6" . "^")("7" . "&")
        ("8" . "*")("9" . "(")("0" . ")")
        ("`" . "~")("[" . "{")("]" . "}")("-" . "_")("=" . "+")("," . "<")("." . ">")
        ("/" . "?")(";" . ":")("'" . "\"")("\\" . "|")
        ("'" . "\"")("\\" . "|")
        (":" . "*")("@" . "`") ;; 実験中。
        ))
    ))
(when nil
  (progn
    (defvar sticky-key ".")
    (defvar sticky-list
      '(("a" . "A")("b" . "B")("c" . "C")("d" . "D")("e" . "E")("f" . "F")("g" . "G")
        ("h" . "H")("i" . "I")("j" . "J")("k" . "K")("l" . "L")("m" . "M")("n" . "N")
        ("o" . "O")("p" . "P")("q" . "Q")("r" . "R")("s" . "S")("t" . "T")("u" . "U")
        ("v" . "V")("w" . "W")("x" . "X")("y" . "Y")("z" . "Z")
        ("1" . "!")("2" . "@")("3" . "#")("4" . "$")("5" . "%")("6" . "^")("7" . "&")
        ("8" . "*")("9" . "(")("0" . ")")
        ("`" . "~")("[" . "{")("]" . "}")("-" . "_")("=" . "+")("," . "<")("." . ".")
        ("/" . "?")(";" . ":")("'" . "\"")("\\" . "|")
        ("'" . "\"")("\\" . "|")
        (":" . "*")("@" . "`") ;; 実験中。
        ))
    ))

(defvar sticky-map (make-sparse-keymap))
(define-key global-map sticky-key sticky-map)
(mapcar (lambda (pair)
          (define-key sticky-map (car pair)
            `(lambda()(interactive)
               (setq unread-command-events
                     (cons ,(string-to-char (cdr pair)) unread-command-events)))))
        sticky-list)
(define-key sticky-map sticky-key '(lambda ()(interactive)(insert sticky-key)))
;; ----------------------------------------------------------------------
;; * [2011-10-04 火] tips
;; org-speed-command デフォルト定義の「;   org-set-tags-command」が使用不能になる。
;; 他のキーに振り替えるべし。 goto customize org-speed-commands-user
;; Emacs-Lisp のコメント入力の手間が増える。 M-; で回避する。
;; ";<SPC>" などは未割り当て。追加できるか？ あとで実験する。
;; ----------------------------------------------------------------------
;; * [2012-04-19 木] php-mode では 
;; : runs the command c-electric-colon, which is an interactive compiled
;; ; runs the command c-electric-semi&comma, which is an interactive
;; なので、他のキーを使う。
;; . runs the command self-insert-command, which is an interactive
;; はあいている。
;; ----------------------------------------------------------------------
;; * [2012-04-19 木] teraterm でペーストするとき、 sticky-key 文字を含んでいると作用してしまう。一時的に機能offにする方法はないか？ local-map?

