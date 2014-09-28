;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-auto-complete.el
;; #+LAST_UPDATED: 2014-09-28
;; ======================================================================
;; * [2014-09-28 日] 導入
;; http://cx4a.org/software/auto-complete/index.ja.html
;; http://cx4a.org/software/auto-complete/manual.ja.html

(when (package-require 'auto-complete)

  (setq ac-sources
        ;; 現在のバッファと同じメジャーモードの全てのバッファの単語を補完するための情報源です。
        '(ac-source-words-in-same-mode-buffers 
          )
        )

  ;; 特定のメジャーモードで情報源を変更する
  
  (defun my-ac-emacs-lisp-mode ()
    (setq ac-sources
          '(ac-source-words-in-same-mode-buffers 
            ;; ファイル名を補完するための情報源です。/を入力した時点で補完が開始されます。
            ac-source-filename         
            ;; カレントディレクトリのファイルを補完するための情報源です。eshellなどで便利かもしれません。
            ac-source-files-in-current-dir 
            ;; Emacs Lispの関数を補完するための情報源です。(の直後で有効です。
            ac-source-functions            
            ;; Emacs Lispのシンボルを補完するための情報源です。
            ac-source-symbols           
            ;; (require 'で有効なfeatureを補完するための情報源です。
            ac-source-features          
            )
          ))


  (add-hook 'emacs-lisp-mode-hook 'my-ac-emacs-lisp-mode)

  ;; 補完メニュー表示時のみにC-n/C-pで補完候補を選択できるようにして、キー入力を極力奪わないようにしてみます。
  (setq ac-use-menu-map t)

  ;; ac-modes is a variable defined in `auto-complete.el'.
  ;; Its value is
  ;; (emacs-lisp-mode lisp-mode lisp-interaction-mode slime-repl-mode c-mode cc-mode c++-mode go-mode java-mode malabar-mode clojure-mode clojurescript-mode scala-mode scheme-mode ocaml-mode tuareg-mode coq-mode haskell-mode agda-mode agda2-mode perl-mode cperl-mode python-mode ruby-mode lua-mode tcl-mode ecmascript-mode javascript-mode js-mode js2-mode php-mode css-mode less-css-mode makefile-mode sh-mode fortran-mode f90-mode ada-mode xml-mode sgml-mode ts-mode sclang-mode verilog-mode qml-mode)
  ;; 特定のモードで自動でauto-complete-modeを有効にする
  (add-to-list 'ac-modes 'dos-mode)
  (add-to-list 'ac-modes 'org-mode)

  ;; 大文字・小文字を区別しない
  (setq ac-ignore-case t)

  ;; 特定の単語を入力したら補完を自動的に中止する
  (add-hook 'ruby-mode-hook
            (lambda ()
              (make-local-variable 'ac-ignores)
              (add-to-list 'ac-ignores "end")))

  )
