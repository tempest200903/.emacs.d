;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-text-translator.el
;; =============================================================================
;; http://d.hatena.ne.jp/khiker/20070503/emacs_text_translator
;;     * http://www.emacswiki.org/emacs/download/text-translator.el
;;     * http://www.emacswiki.org/emacs/download/text-translator-vars.el
;;     * http://www.emacswiki.org/emacs/download/text-translator-load.el
;; ;; require でも autoload でもおすきな方をどうぞ.
;; ;; 最近だと, require の方が推奨されているとのことです.
;; ;;(autoload 'text-translator "text-translator" "Text Translator" t)
;; (require 'text-translator)
;; (global-set-key "\C-x\M-t" 'text-translator)
;; (global-set-key "\C-x\M-T" 'text-translator-translate-last-string)
;; ;; プリフィックスキーを変更する場合.
;; ;; (setq text-translator-prefix-key "\M-n")
;;
(when (not (require 'text-translator nil t))
  (progn
    (message "require package false")
    (install-elisp-from-emacswiki "text-translator-vars.el")
    (install-elisp-from-emacswiki "text-translator.el") ;; 前提 text-translator-vars.el
    (install-elisp-from-emacswiki "text-translator-load.el")
    (message "see http://www.emacswiki.org/emacs/TextTranslator")
    (message "text-translator.el --- Text Translator")
    (message "see ~/.emacs.d/auto-install/text-translator.el")
    (popwin:messages)
    )
  )
;;
(when (require 'text-translator nil t)
  (progn
    (message "require package true")
    (global-set-key (kbd "C-x M-t") 'text-translator)
    (global-set-key (kbd "C-x M-T") 'text-translator-translate-last-string)
    (popwin:messages)
    )
  )
