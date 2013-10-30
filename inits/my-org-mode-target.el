;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; ======================================================================
;; * [2011-12-16 金] org の radio-target を howm-mode と併用する
;; http://www.gfd-dennou.org/member/uwabami/cc-env/Emacs/init-howm.html
;; goto, come-frome の記号の変更。
;; デフォルトの ">>>", "<<<" は org-mode の radio target と同じなので使いづらい。
;; howm を変えるなら、
(when nil
  (setq howm-ref-header "==>")
                                        ; default value is ">>>"
  (setq howm-keyword-header "<==")
                                        ; default value is "<<<"
  )
;; org-mode を変えるなら、 例:  org-mode
(when nil
  (setq org-target-regexp "〈〈\\([^〈〉\n\r]+\\)〉〉"  )
                                        ; "Regular expression matching a link target."
                                        ; default value is "<<<\\([^<>\n]+\\)>>>"
  (setq org-radio-target-regexp "〈〈〈\\([^〈〉\n\r]+\\)〉〉〉")
                                        ; "Regular expression matching a radio target."
  (setq org-any-target-regexp "〈〈〈?\\([^〈〉\n\r]+\\)〉〉〉?" )
                                        ; "Regular expression matching any target."
  
  )

;; 〈〈〈 . 〉〉〉
(setq org-radio-target-regexp "〈〈〈\\([^〈〉\n\r]+\\)〉〉〉")
                                        ; "Regular expression matching a radio target."
;; {{{ . }}}
(setq org-radio-target-regexp "{{{\\([^{}\n\r]+\\)}}}")
