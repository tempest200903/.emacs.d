;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; ======================================================================
;; * [2012-11-08 木]
(defun my-bodais-module-dictionary-lookup (&optional module-id)
  "lookup bodais-module-dictionary"
  (interactive "sinput module-id: ")
  (find-file-other-frame "n:/server/vm_bodais3/home/isfactory/bodais/trunk/engines/design/module/module-dictionary.csv") 
  (toggle-read-only t)
  (occur module-id)
  (next-error)
  )
(global-set-key (kbd "C-z C-:")         'my-bodais-module-dictionary-lookup)
