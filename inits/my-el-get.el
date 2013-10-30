;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; ======================================================================
;; * [2012-04-04 水] ~/.emacs.d/inits/my-el-get.el
;; - http://www.clear-code.com/blog/2012/3/20.html
;;   #+BEGIN_EXAMPLE 
;;   el-get
;; 
;;   パッケージ管理ステムとして複数のソースからパッケージをインストール
;;   できるel-getを使います。el-getがない場合は自動でインストールします。
;;
;;   ;; 2012-03-15
;;   (add-to-list 'load-path "~/.emacs.d/el-get/el-get")
;;   (unless (require 'el-get nil t)
;;     (with-current-buffer
;;         (url-retrieve-synchronously
;;          "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
;;       (end-of-buffer)
;;       (eval-print-last-sexp)))
;;   ;; レシピ置き場
;;   (add-to-list 'el-get-recipe-path
;;                (concat (file-name-directory load-file-name) "/el-get/recipes"))
;;   ;; 追加のレシピ置き場
;;   (add-to-list 'el-get-recipe-path
;;                "~/.emacs.d/config/el-get/local-recipes")
;;   #+END_EXAMPLE
;; 
;; * [2012-04-04 水] インストール試行錯誤中。未完了。
;; - ~/.emacs.d/Makefile

;;   (unless (require 'el-get nil t)
;;     (with-current-buffer
;;         (url-retrieve-synchronously
;;          "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
;;       (end-of-buffer)
;;       (eval-print-last-sexp)))

;; Debugger entered--Lisp error: (wrong-type-argument processp nil)
;;   set-process-query-on-exit-flag(nil t)
;;   url-http-mark-connection-as-busy("raw.github.com" 443 nil)
;;   url-http-find-free-connection("raw.github.com" 443)
;;   url-http([cl-struct-url "https" nil nil "raw.github.com" 443 "/dimitri/el-get/master/el-get-install.el" nil nil t] (lambda (&rest --cl-rest--) (apply #[... "\302\303\304p#\210\305L\210	pL\207" [G5403 G5402 url-debug retrieval "Synchronous fetching done (%S)" t] 4] (quote --asynch-buffer--) (quote --retrieval-done--) --cl-rest--)) (nil))
;;   url-https([cl-struct-url "https" nil nil "raw.github.com" 443 "/dimitri/el-get/master/el-get-install.el" nil nil t] (lambda (&rest --cl-rest--) (apply #[... "\302\303\304p#\210\305L\210	pL\207" [G5403 G5402 url-debug retrieval "Synchronous fetching done (%S)" t] 4] (quote --asynch-buffer--) (quote --retrieval-done--) --cl-rest--)) (nil))
;;   url-retrieve-internal("https://raw.github.com/dimitri/el-get/master/el-get-install.el" (lambda (&rest --cl-rest--) (apply #[... "\302\303\304p#\210\305L\210	pL\207" [G5403 G5402 url-debug retrieval "Synchronous fetching done (%S)" t] 4] (quote --asynch-buffer--) (quote --retrieval-done--) --cl-rest--)) (nil))
;;   url-retrieve("https://raw.github.com/dimitri/el-get/master/el-get-install.el" (lambda (&rest --cl-rest--) (apply #[... "\302\303\304p#\210\305L\210	pL\207" [G5403 G5402 url-debug retrieval "Synchronous fetching done (%S)" t] 4] (quote --asynch-buffer--) (quote --retrieval-done--) --cl-rest--)))
;;   url-retrieve-synchronously("https://raw.github.com/dimitri/el-get/master/el-get-install.el")
;;   (set-buffer (url-retrieve-synchronously "https://raw.github.com/dimitri/el-get/master/el-get-install.el"))
;;   (save-current-buffer (set-buffer (url-retrieve-synchronously "https://raw.github.com/dimitri/el-get/master/el-get-install.el")) (end-of-buffer) (eval-print-last-sexp))
;;   (with-current-buffer (url-retrieve-synchronously "https://raw.github.com/dimitri/el-get/master/el-get-install.el") (end-of-buffer) (eval-print-last-sexp))
;;   (if (require (quote el-get) nil t) nil (with-current-buffer (url-retrieve-synchronously "https://raw.github.com/dimitri/el-get/master/el-get-install.el") (end-of-buffer) (eval-print-last-sexp)))
;;   (unless (require (quote el-get) nil t) (with-current-buffer (url-retrieve-synchronously "https://raw.github.com/dimitri/el-get/master/el-get-install.el") (end-of-buffer) (eval-print-last-sexp)))
;;   eval((unless (require (quote el-get) nil t) (with-current-buffer (url-retrieve-synchronously "https://raw.github.com/dimitri/el-get/master/el-get-install.el") (end-of-buffer) (eval-print-last-sexp))))
;;   eval-last-sexp-1(nil)
;;   eval-last-sexp(nil)
;;   call-interactively(eval-last-sexp nil nil)

;; ----------------------------------------------------------------------
;; * [2012-06-07 木] 『Software Design』 p.130
;; リスト6 el-get のインストール
;; (url-retrieve "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
;;               (lambda (s) (end-of-buffer) (eval-print-last-sexp)))
;; Debugger entered--Lisp error: (wrong-type-argument processp nil)
;;   set-process-query-on-exit-flag(nil t)
;;   url-http-mark-connection-as-busy("raw.github.com" 443 nil)
;;   url-http-find-free-connection("raw.github.com" 443)
;;   url-http([cl-struct-url "https" nil nil "raw.github.com" 443 "/dimitri/el-get/master/el-get-install.el" nil nil t] (lambda (s) (end-of-buffer) (eval-print-last-sexp)) (nil))
;;   url-https([cl-struct-url "https" nil nil "raw.github.com" 443 "/dimitri/el-get/master/el-get-install.el" nil nil t] (lambda (s) (end-of-buffer) (eval-print-last-sexp)) (nil))
;;   url-retrieve-internal("https://raw.github.com/dimitri/el-get/master/el-get-install.el" (lambda (s) (end-of-buffer) (eval-print-last-sexp)) (nil))
;;   url-retrieve("https://raw.github.com/dimitri/el-get/master/el-get-install.el" (lambda (s) (end-of-buffer) (eval-print-last-sexp)))
;;   eval((url-retrieve "https://raw.github.com/dimitri/el-get/master/el-get-install.el" (lambda (s) (end-of-buffer) (eval-print-last-sexp))))
;;   eval-last-sexp-1(nil)
;;   eval-last-sexp(nil)
;;   call-interactively(eval-last-sexp nil nil)
;;
;; * [2012-06-07 木] ブラウザ手動でダウンロード。
;; N:\download\Emacs\plugin\github\dimitri-el-get\el-get-install.el
	   ;; (git       (or (executable-find "git")
	   ;;      	  (error "Unable to find `git'")))
;; git が実行パスに見つからないとエラー。

