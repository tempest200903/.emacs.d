;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-

;; ======================================================================
;; * [2011-12-19 月] 練習。anything-version "1.286"
(require 'anything-config)

;; ---------------------------------------------------------------------
;; * 手本1
;; (defun anything-occur ()
;;   "Preconfigured Anything for Occur source.
;; If region is active, search only in region,
;; otherwise search in whole buffer."
;;   (interactive)
;;   (let ((anything-compile-source-functions
;;          ;; rule out anything-match-plugin because the input is one regexp.
;;          (delq 'anything-compile-source--match-plugin
;;                (copy-sequence anything-compile-source-functions))))
;;     (anything-other-buffer 'anything-c-source-occur "*Anything Occur*")))
;; * 練習1
(defun anything-example101 ()
  "example101"
  (interactive)
  (anything-other-buffer 'anything-c-source-example1 "*Anything example101*"))

;; ---------------------------------------------------------------------
;; * 手本2
;; (defvar anything-c-source-occur
;;   '((name . "Occur")
;;     (init . anything-c-occur-init)
;;     (candidates-in-buffer)
;;     (migemo)
;;     (get-line . anything-c-occur-get-line)
;;     (display-to-real . anything-c-display-to-real-line)
;;     (action . (("Go to Line" . anything-c-action-line-goto)
;;                ("Query replace regexp (C-u Not inside word.)"
;;                 . anything-c-occur-query-replace-regexp)))
;;     (recenter)
;;     (requires-pattern . 1)
;;     (delayed)
;;     (volatile)))
;; * 練習2
(defvar anything-c-source-example1
  '((name . "example1")
    (init . anything-c-example101-init)
    (candidates-in-buffer)
    (get-line . anything-c-occur-get-line)
    (display-to-real . anything-c-display-to-real-line)
    (action . (("Go to Line" . anything-c-action-line-goto)
               ("Query replace regexp (C-u Not inside word.)"
                . anything-c-occur-query-replace-regexp)))
    (recenter)
    (requires-pattern . 1)
    (delayed)
    (volatile)))

;; ---------------------------------------------------------------------
;; * 手本3
;; (defun anything-c-occur-init ()
;;   "Create the initial anything occur buffer.
;; If region is active use region as buffer contents
;; instead of whole buffer."
;;   (with-current-buffer (anything-candidate-buffer 'global)
;;     (erase-buffer)
;;     (let ((buf-contents
;;            (with-anything-current-buffer
;;              (if (anything-region-active-p)
;;                  (buffer-substring (region-beginning) (region-end))
;;                  (buffer-substring (point-min) (point-max))))))
;;       (insert buf-contents))))
;; * 練習3
(defun anything-c-example101-init ()
  "Create the initial anything occur buffer.
If region is active use region as buffer contents
instead of whole buffer."
  (with-current-buffer (anything-candidate-buffer 'global)
    (erase-buffer)
    (let ((buf-contents
           (with-anything-current-buffer
             (if (anything-region-active-p)
                 (buffer-substring (region-beginning) (region-end))
               (buffer-substring (point-min) (point-max))))
           )
          )
      )
    )
  )

;; ----------------------------------------------------------------------
;; * [2011-12-20 火] http://www.emacswiki.org/emacs/Anything
;; here’s an introduction to creating new sources for Anything.
;; http://metasandwich.com/2010/08/01/anything-else/
;; * 手本4

(defun my-anything ()
  (interactive)
  (anything-other-buffer
   '(anything-c-source-buffers
     anything-c-source-file-name-history
     anything-c-source-info-pages
     anything-c-source-info-elisp
     anything-c-source-man-pages
     anything-c-source-locate
     anything-c-source-emacs-commands)
   "*my-anything*"))

(setf my-pretend-files-source
      '((name . "Name for My Source")
        (candidates . ("a" "list" "of" "files"))
        (type . file)))

(defun anything-for-pretend-files ()
  (interactive)
  (anything-other-buffer '(my-pretend-files-source)
                         "*anything-select-buffer-name*"))

(setf things-to-say-source
      '((name . "Things To Say")
        (candidates . ("Llama" "Guano" "Mochaccino" "Colostomy"))
        (action . (("Say it!" .
                    (lambda (selection)
                      (message selection)))
                   ("Spray it!" .
                    (lambda (selection)
                      (message (concat selection "thpppt"))))))))

(defun anything-things-to-say ()
  (interactive)
  (anything-other-buffer '(things-to-say-source)
                         "*anything things to say*"))

;; Next steps
;; If your curiosity is tingling, C-h v anything-sources and prepare to have your amazement blown.


;; ----------------------------------------------------------------------
;; * 練習4 手本4から派生。

(setf anything-c-source-example104
      '((name . "Name for My Source")
        (candidates . ("a" "list" "of" "files"))
        (type . file)))

(defun anything-example104 ()
  (interactive)
  (anything-other-buffer '(anything-c-source-example104)
                         "*anything-select-buffer-name*"))


;; ----------------------------------------------------------------------
;; * 練習5 練習4から派生。

(setf anything-c-source-example105
      '((name . "Name for My Source")
        (candidates . 
                    ("a" "list" "of" "files"
                     "N:/work/y2011/1106BOA/20110816-design"
                     "N:/work/y2011/1106BOA/20110816-design/プログラム設計〈スコアリング〉-d20110711.xls"
                     "N:/work/y2011/1106BOA/20111102-ticket400/report_architecture.txt"
                     "N:/work/y2011/1106BOA/20111102-ticket400/wbsTime-d20111128.xls"
                     "N:/work/y2011/1106BOA/20111117-ticket438"
                     "N:/work/y2011/1106BOA/20111117-ticket438/wbsTime-d20111215.txt"
                     "N:/work/y2011/1106BOA/20111117-ticket438/wbsTime-d20111215.xls"
                     ))
        (type . file)))

(defun anything-example105 ()
  (interactive)
  (anything-other-buffer '(anything-c-source-example105)
                         "*anything-select-buffer-name*"))


;; ----------------------------------------------------------------------
;; * 練習6 練習5から派生。
;; candidates 欄にファイル名を格納したリストを入れればよい。
;; 特定のファイルを読み込んで、1行1ファイル名とみなしてリストを作って返す関数を用意する。
;; init 欄でバッファを作っておく。

(setf anything-c-source-example106
      '((name . "Name for My Source")
        (init . (lambda () (find-file "N:/4-project/iocollect/recent/recent_month.txt") ))
        (candidates . 
                    ("a" "list" "of" "files"
                     "N:/work/y2011/1106BOA/20110816-design"
                     "N:/work/y2011/1106BOA/20110816-design/プログラム設計〈スコアリング〉-d20110711.xls"
                     "N:/work/y2011/1106BOA/20111102-ticket400/report_architecture.txt"
                     "N:/work/y2011/1106BOA/20111102-ticket400/wbsTime-d20111128.xls"
                     "N:/work/y2011/1106BOA/20111117-ticket438"
                     "N:/work/y2011/1106BOA/20111117-ticket438/wbsTime-d20111215.txt"
                     "N:/work/y2011/1106BOA/20111117-ticket438/wbsTime-d20111215.xls"
                     ))
        (type . file)))

(defun anything-example106 ()
  (interactive)
  (anything-other-buffer '(anything-c-source-example106)
                         "*anything-select-buffer-name*"))

;; ----------------------------------------------------------------------
;; * 練習7 入力支援を実現したい。自作開始。
;; (defun my-org-template2 () "入力支援2"
;;   (interactive)
;;   (insert-string ":LOGBOOK:\n")
;;   (insert-string ":END:\n")
;;   )
;; (defun my-org-template3 () "入力支援3"
;;   (interactive)
;;   (insert-string "#+BEGIN: clocktable :maxlevel 4 :scope file\n")
;;   (insert-string "#+END:\n")
;;   )
(defun anything-c-keywords-insert-example107 (keyword)
  (insert keyword)
  )
(setf anything-c-source-example107
      '((name . "anything-c-source-example107")
        (candidates . (":LOGBOOK: :END:" "#+BEGIN: clocktable :maxlevel 4 :scope file #+END:"))
        (action . anything-c-keywords-insert-example107)))
(defun anything-example107 ()
  (interactive)
  (anything-other-buffer '(anything-c-source-example107)
                         "*anything-c-source-example107"))
;; 課題 改行を含む候補が他の候補と混ざって区別しにくい。
;; anything-show-kill-ring のように区切りをつけてほしい。

;; ----------------------------------------------------------------------
;; * 練習8 練習6から派生。
;; candidates 欄にファイル名を格納したリストを入れればよい。
;; 特定のファイルを読み込んで、1行1ファイル名とみなしてリストを作って返す関数を用意する。
;; init 欄でバッファを作っておく。

(setf anything-c-source-example108 '((name . "Name for My Source")
                                     (init . (lambda () (find-file "N:/4-project/iocollect/recent/recent_month.txt") ))
                                     (candidates . 
                                                 ("a" "list" "of" "files"
                                                  "N:/work/y2011/1106BOA/20110816-design"
                                                  "N:/work/y2011/1106BOA/20110816-design/プログラム設計〈スコアリング〉-d20110711.xls"
                                                  "N:/work/y2011/1106BOA/20111102-ticket400/report_architecture.txt"
                                                  "N:/work/y2011/1106BOA/20111102-ticket400/wbsTime-d20111128.xls"
                                                  "N:/work/y2011/1106BOA/20111117-ticket438"
                                                  "N:/work/y2011/1106BOA/20111117-ticket438/wbsTime-d20111215.txt"
                                                  "N:/work/y2011/1106BOA/20111117-ticket438/wbsTime-d20111215.xls"
                                                  ))
                                     (type . file)))

(defun anything-example108 ()
  (interactive)
  (anything-other-buffer '(anything-c-source-example108)
                         "*anything-select-buffer-name*"))
;; ----------------------------------------------------------------------
;; * 練習9 練習8から派生。
(defun anything-example109 ()
  (interactive)
  (find-file "N:/4-project/iocollect/recent/recent_month.txt")
  (call-interactively 'anything-occur)
  )

