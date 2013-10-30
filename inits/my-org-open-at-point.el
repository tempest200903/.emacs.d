;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; ======================================================================
;; * [2012-02-02 木] C-c C-o org-open-at-point で指を酷使するのを避ける。
;;
;; my-org-open-at-point => 必ず set-mark-command する。
;; org-open-at-point => 同じバッファにジャンプする場合は mark しない。異なるバッファにジャンプする場合は mark する。
;; 
;; {emacs lisp tips} コマンド引数を引き継ぐには call-interactively を使う。
;; 例えば、 C-u M-x my-org-open-at-point とすると、 
;; `C-u M-x org-open-at-point` or `C-u M-x org-self-insert-command`
;; と同じようになる。
(defun my-org-open-at-point (&optional ARG)
  "point が org-link である場合、 mark してから org-open-at-point, さもなくば org-self-insert-command."
  (interactive)
  (message
   (if (or
        (face-contains (get-text-property (point) 'face) 'org-link)
        (face-contains (get-text-property (point) 'face) 'org-date)
        (face-contains (get-text-property (point) 'face) 'org-tag)
        )
       ;; {Note}(get-text-property (point) 'face) は単体の face または list を返す。
       ;; {Todo} 3個の or を face-contains で吸収するべし。
       (progn
         (call-interactively 'set-mark-command) 
         (call-interactively 'set-mark-command) 
         (call-interactively 'org-open-at-point) 
         )
     (progn
       (call-interactively 'org-self-insert-command) 
       )  
     )
   )
  )

(define-key org-mode-map (kbd "S-SPC") 'my-org-open-at-point)

(defun face-contains (property criteria)
  "property は単体の face または list 。"
  (if (listp property)
      (memq criteria property)
    (eq criteria property)
    )
  )

;; ----------------------------------------------------------------------
;; * [2012-06-25 月] C-u C-u C-c C-o と同じことをマウスで行う。
;; (org-open-at-point &optional IN-EMACS REFERENCE-BUFFER)
;; With a double prefix argument, try to open outside of Emacs, in the
;; application the system uses for this file type.
(defun org-open-at-point-prefix-argument2 (&optional ARG)
  ""
  (interactive)
  (org-open-at-point t)
  )
(define-key org-mode-map (kbd "<H-mouse-1>") 'org-open-at-point-prefix-argument2)

;; (define-key org-mode-map (kbd "<H-mouse-1>") (kbd "C-u C-u C-c C-o"))
;; NG
