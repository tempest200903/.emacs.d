;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2013-11-07
;; ============================================================================
;; * [2011-12-22 木] 自作 elisp. 固定の文字列を入力する anything-c-source
;;;###autoload
(defun my-anything-c-static-keywords-insert (keyword)
  (insert keyword)
  )
(setf my-anything-c-source-static-keywords
      '((name . "my-anything-c-source-static-keywords")
        (candidates . (
                       "#+BEGIN_EXAMPLE"
                       "#+END_EXAMPLE"
                       "#+BEGIN_QUOTE"
                       "#+END_QUOTE"
                       "vm_bodais5(211.17.181.228)"
                       "vm_bodais6(211.17.181.226)"
                       "〈〉"
                       "《》"
                       "〔〕"
                       "【】"
                       "［］"
                       "- 正: - 誤:"
                       ":LOGBOOK: :END:"
                       "* clocktable #+BEGIN: clocktable :maxlevel 4 :scope file #+END:"
                       "#+LAST_UPDATED: "
                       "- checkbox [/]"
                       "sheets(\"\")"
                       "# -*- coding: utf-8-unix; mode: org; -*-"
                       ";; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-"
                       "# -*- coding: utf-8-dos; -*-"
                       "#+OPTIONS: ^:nil                ; html export で `_` を変換したくない場合はこれを指定する。"
                       ";;;###autoload"
                       "- comefrom: previous month: "
                       "- goto: next month: "
                       "@tyamazaki said: "
                       "@nakamura said: "
                       "@matsuo said: "
                       ))
        (action . my-anything-c-static-keywords-insert)))

                       ;; "#+TITLE:     "
                       ;; "#+AUTHOR:    "
                       ;; "#+EMAIL:     "
                       ;; "#+DATE:      "
                       ;; "#+DESCRIPTION:"
                       ;; "#+KEYWORDS:"
                       ;; "#+LANGUAGE:  "
                       ;; "#+OPTIONS:   H:%d num: toc: \\n: @: :: |: ^: -: f: *: <:"
                       ;; "#+OPTIONS:   TeX: LaTeX: skip: d: todo: pri: tags:"
                       ;; "#+EXPORT_SELECT_TAGS: "
                       ;; "#+EXPORT_EXCLUDE_TAGS: "
                       ;; "#+LINK_UP:   "
                       ;; "#+LINK_HOME: "
                       ;; "#+XSLT:"
                       ;; "#+CATEGORY:  "
                       ;; "#+SEQ_TODO:  "
                       ;; "#+TYP_TODO:  "
                       ;; "#+PRIORITIES: "
                       ;; "#+DRAWERS:   "
                       ;; "#+STARTUP:       "
                       ;; "#+TAGS:      "
                       ;; "#+FILETAGS:  "
                       ;; "#+ARCHIVE:   "
                       ;; "#+LINK:      "

;;;###autoload
(defun my-anything-static-keywords ()
  "固定のキーワードを入力する anything-c-source"
  (interactive)
  (anything-other-buffer '(my-anything-c-source-static-keywords)
                         "*my-anything-c-source-static-keywords"))

;; (global-set-key (kbd "C-t C-:") 'my-anything-static-keywords)
;; ----------------------------------------------------------------------
;; TODO minibuffer に文字列を挿入する
;; TODO クリップボードに文字列を上書きする
;; TODO クリップボードに文字列を追加する
;; ----------------------------------------------------------------------
;; [2013-11-01 金] provide
(provide 'my-anything-c-static-keywords)
