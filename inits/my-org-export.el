;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2012-06-11
;; ======================================================================
;; * [2012-06-05 火] org-export で "_" が勝手に変換されてしまうのを抑制する。
;; org-mode 添付の関数 org-export-html-convert-sub-super にパッチを当てる。
;; n:/tool/gnupack/gnupack_basic-7.02/app/emacs/site-lisp/org-7.7/lisp/org-html.el

(if t
    ;; 改修前。 URL 以外で "_abc_" -> "<sub>abc</sub>" に変換される
    ;; "\_abc\_" と書けば変換されない。
    (defun org-export-html-convert-sub-super (string)
      "Convert sub- and superscripts in STRING to HTML."
      (let (key c (s 0) (requireb (eq org-export-with-sub-superscripts '{})))
        (while (string-match org-match-substring-regexp string s)
          (cond
           ((and requireb (match-end 8)) (setq s (match-end 2)))
           ((get-text-property  (match-beginning 2) 'org-protected string)
            (setq s (match-end 2)))
           (t
            (setq s (match-end 1)
                  key (if (string= (match-string 2 string) "_") "sub" "sup")
                  c (or (match-string 8 string)
                        (match-string 6 string)
                        (match-string 5 string))
                  string (replace-match
                          (concat (match-string 1 string)
                                  "<" key ">" c "</" key ">")
                          t t string)))))
        (while (string-match "\\\\\\([_^]\\)" string)
          (setq string (replace-match (match-string 1 string) t t string)))
        string))
  ;; この実装を有効にすると、 "_" -> "<sub></sub>" 変換はされない。
  ;; しかし、 URL にある "_" が "\_" に変換されてしまう。
  (defun org-export-html-convert-sub-super (string)
    "Convert sub- and superscripts in STRING to HTML."
    string
    )
  )

;; [2012-06-11 月] 暫定処置。本文にURLを生で書くと"_"エスケープ問題が発生する。URLを"[["と"]]"で囲んで書くと発生しない。
