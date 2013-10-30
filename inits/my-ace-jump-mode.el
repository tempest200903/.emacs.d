;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-ace-jump-mode.el
;; =============================================================================
;; http://d.hatena.ne.jp/syohex/20120304/1330822993
;; インストール
;; auto-installが使える方は以下の S式を評価してください。
;; (auto-install-from-url "https://raw.github.com/winterTTr/ace-jump-mode/master/ace-jump-mode.el")
;; 設定
;; (require 'ace-jump-mode)
;; (global-set-key (kbd "C-c SPC") 'ace-jump-mode)
;; ----------------------------------------------------------------------
(when (not (require 'ace-jump-mode nil t))
  (progn
    (when (require 'package nil t)
      (package-install 'ace-jump-mode)
      )
    (auto-install-from-url "https://raw.github.com/winterTTr/ace-jump-mode/master/ace-jump-mode.el")
    )
  )
(when (require 'ace-jump-mode nil t)
  (progn
    (global-set-key (kbd "M-g M-k") 'ace-jump-mode)
    (when (require 'view nil t)
      (progn
        (define-key view-mode-map (kbd "k") 'ace-jump-mode)
        )
      )
    )
  )
;; ----------------------------------------------------------------------
;; https://github.com/winterTTr/ace-jump-mode/wiki/AceJump-FAQ
;; For example, the default value is :
;; (setq ace-jump-mode-submode-list
;;       '(ace-jump-word-mode              ;; the first one always map to : C-c SPC
;;         ace-jump-char-mode              ;; the second one always map to: C-u C-c SPC            
;;         ace-jump-line-mode) )           ;; the third one always map to ：C-u C-u C-c SPC
;; You can change the sub mode sequence as you wish.
(setq ace-jump-mode-submode-list
      '(ace-jump-char-mode              ;; the first one always map to : C-c SPC
        ace-jump-word-mode              ;; the second one always map to: C-u C-c SPC            
        ace-jump-line-mode) )           ;; the third one always map to ：C-u C-u C-c SPC
;; ----------------------------------------------------------------------
;; http://d.hatena.ne.jp/rkworks/20120520/1337528737
;; これでH-0～H-9、H-a～H-zで任意のところに飛べます。
(defun add-keys-to-ace-jump-mode (prefix c &optional mode)
  (define-key global-map
    (read-kbd-macro (concat prefix (string c)))
    `(lambda ()
       (interactive)
       (funcall (if (eq ',mode 'word)
                    #'ace-jump-word-mode
                  #'ace-jump-char-mode) ,c))))

(loop for c from ?0 to ?9 do (add-keys-to-ace-jump-mode "H-" c))
(loop for c from ?a to ?z do (add-keys-to-ace-jump-mode "H-" c))
(loop for c from ?! to ?~ do (add-keys-to-ace-jump-mode "H-" c))
(loop for c from ?0 to ?9 do (add-keys-to-ace-jump-mode "H-M-" c 'word))
(loop for c from ?a to ?z do (add-keys-to-ace-jump-mode "H-M-" c 'word))
(loop for c from ?! to ?~ do (add-keys-to-ace-jump-mode "H-M-" c 'word))
