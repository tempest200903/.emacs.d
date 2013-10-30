;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-plantuml-package.el
;; ======================================================================
;; * [2013-09-12 木] インストール方法
;; M-x package-list-packages plantuml install
;; M-x plantuml-mode
;; ----------------------------------------------------------------------
;; http://eschulte.github.io/babel-dev/DONE-integrate-plantuml-support.html
;; active Org-babel languages
;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '(;; other Babel languages
;;    (plantuml . t)))
;; Then download the jar file save it somewhere on your system, set `org-plantuml-jar-path' to point to this file.
;; (setq org-plantuml-jar-path
;;       (expand-file-name "~/src/org/contrib/scripts/plantuml.jar"))
;; Usage
;; see http://plantuml.sourceforge.net/ for a variety of example usages, the following code block is an example of usage from within an Org-mode file.
;; #+begin_src plantuml :file tryout.png
;;   Alice -> Bob: synchronous call
;;   Alice ->> Bob: asynchronous call
;; #+end_src
;; #+results:
;; file:tryout.png
;; ----------------------------------------------------------------------

;; require より前に setq しておかないと、エラー発生。
;; File local-variables error: (error "Could not find plantuml.jar at n:/tool/gnupack/gnupack_devel-11.00/home/plantuml.jar")
(setq plantuml-jar-path
      (expand-file-name "C:/tool/plantuml/plantuml.jar"))

(require 'plantuml-mode)

(when nil
  (add-hook 'plantuml-mode-hook
            (lambda ()
              (define-key plantuml-mode-map (kbd "C-c C-i") 'plantuml-complete-symbol)
              )
            )
  )
