 ;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
 ;; #+LAST_UPDATED: 2012-05-21
 ;; ============================================================
 ;; * [2011-07-23 土 10:11] 導入
 ;; url: http://www.emacswiki.org/emacs/HighLight
 ;; M-x auto-install-from-emacswiki highlight.el
 ;; [[n:/.emacs.d/auto-install/highlight.el]]
 ;; M-x auto-install-from-emacswiki facemenu+.el
 ;; [[n:/.emacs.d/auto-install/facemenu+.el]]
 ;; M-x auto-install-from-emacswiki eyedropper.el
 ;; M-x auto-install-from-emacswiki hexrgb.el
 ;; [[n:/.emacs.d/auto-install/eyedropper.el]]
 (require 'highlight)

 (require 'facemenu+)

 ;; * [2011-07-23 土] カスタマイズ face
 ;; M-x hlt-choose-default-face

 ;; * [2011-07-23 土] keymap
 (global-set-key (kbd "M-s h i") 'hlt-highlight)
 (global-set-key (kbd "M-s h u") 'hlt-unhighlight-all-prop)
 (global-set-key (kbd "M-s M-n") 'hlt-next-highlight)
 (global-set-key (kbd "M-s M-p") 'hlt-previous-highlight)
 (global-set-key (kbd "<H-mouse-1>") 'hlt-highlighter-mouse)

;; * [2011-09-06 火]
;; <menu-bar> <edit> <region>(Text Properties) <hlt-highlight-region>(Highlight) にいろいろメニューが追加される。
;; 最初はここから選べばよい。よく使うものはキーマップに追加。

;; * [2011-07-23 土] approps hlt-
;; hlt-choose-default-face       M-x ... RET
;;    Choose a face for highlighting.
;; hlt-eraser                    M-x ... RET
;;    Erase highlights that you click or drag the mouse over.
;; hlt-eraser-mouse              M-x ... RET
;;    Same as `hlt-eraser', but for binding to a menu item.
;; hlt-hide-default-face         M-x ... RET
;;    Hide the last face used for highlighting.
;; hlt-highlight                 M-x ... RET
;;    Highlight region, regexp (PREFIX +), or unhighlight region (PREFIX -).
;; hlt-highlight-all-prop        M-x ... RET
;;    Highlight all text that has a non-nil property PROP using FACE.
;; hlt-highlight-property-with-value M-x ... RET
;;    Highlight text in region with property PROP of a value in VALUES.
;; hlt-highlight-regexp-region   <menu-bar> <edit> <region> <hlt-highlight-regexp-region>
;;    Highlight regular expression REGEXP in region.
;; hlt-highlight-regexp-to-end   M-x ... RET
;;    Highlight text after cursor that matches REGEXP.
;; hlt-highlight-region          <menu-bar> <edit> <region> <hlt-highlight-region>
;;    Highlight the region or new input.
;; hlt-highlight-single-quotations M-x ... RET
;;    Highlight single-quoted text in the region.
;; hlt-highlighter               M-x ... RET
;;    Highlight the text you drag the mouse over.
;; hlt-highlighter-mouse         M-x ... RET
;;    Same as `hlt-highlighter', but for binding to a menu item.
;; hlt-mouse-face-each-line      M-x ... RET
;;    Put `mouse-face' on each line of buffer in region.
;; hlt-next-highlight            M-x ... RET
;;    Go to the next highlight in FACE.
;; hlt-previous-highlight        M-x ... RET
;;    Go to the previous highlight in the last face used for highlighting.
;; hlt-replace-highlight-face    M-x ... RET
;;    Replace OLD-FACE by NEW-FACE in all highlights in the region.
;; hlt-show-default-face         M-x ... RET
;;    Show FACE, by default, the default highlighting face.
;; hlt-toggle-act-on-any-face-flag M-x ... RET
;;    Toggle `hlt-act-on-any-face-flag'.
;; hlt-toggle-link-highlighting  M-x ... RET
;;    Alternately highlight and unhighlight links.
;; hlt-toggle-property-highlighting M-x ... RET
;;    Alternately highlight and unhighlight all text with property PROP.
;; hlt-toggle-use-overlays-flag  M-x ... RET
;;    Toggle `hlt-use-overlays-flag'.
;; hlt-unhighlight-all-prop      M-x ... RET
;;    Unhighlight all text highlighted with face `hlt-property-highlight'.
;; hlt-unhighlight-region        <menu-bar> <edit> <region> <hlt-unhighlight-region>
;;    Remove all highlighting in region.
;; hlt-unhighlight-region-for-face M-x ... RET
;;    Remove highlighting that uses FACE in region.
;; * memo
;; (load my-highlight) すると、 lazy-highlight が作用しなくなる。相性の問題か？
;; とりあえず、起動時は load しない。
