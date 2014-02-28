;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-yaml-mode.el
;; ======================================================================
;; * [2014-02-24 月] how to install
;; - M-x package-list-packages yaml-mode
;; - eval (require 'yaml-mode)
;; ----------------------------------------------------------------------
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
;; ----------------------------------------------------------------------
;; yaml-mode is an installed package.

;;      Status: Installed in `n:/tool/gnupack/gnupack_devel-11.00/home/.emacs.d/elpa/yaml-mode-20130310.2101/'.
;;     Version: 20130310.2101
;;     Summary: Major mode for editing YAML files

;; This is a major mode for editing files in the YAML data
;; serialization format.  It was initially developed by Yoshiki
;; Kurihara and many features were added by Marshall Vandegrift.  As
;; YAML and Python share the fact that indentation determines
;; structure, this mode provides indentation and indentation command
;; behavior very similar to that of python-mode.

;; Installation:

;; To install, just drop this file into a directory in your
;; `load-path' and (optionally) byte-compile it.  To automatically
;; handle files ending in '.yml', add something like:

;;    (require 'yaml-mode)
;;    (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; to your .emacs file.

;; Unlike python-mode, this mode follows the Emacs convention of not
;; binding the ENTER key to `newline-and-indent'.  To get this
;; behavior, add the key definition to `yaml-mode-hook':

;;    (add-hook 'yaml-mode-hook
;;     '(lambda ()
;;        (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;; [back]

