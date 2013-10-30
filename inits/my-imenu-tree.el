;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; ======================================================================
;; * [2011-11-25 金] 
;; url: http://d.hatena.ne.jp/kitokitoki/20100517/p2
;; windata.el -- http://www.emacswiki.org/cgi-bin/wiki/windata.el
;; tree-mode.el -- http://www.emacswiki.org/cgi-bin/wiki/tree-mode.el
;; imenu-tree.el -- http://www.emacswiki.org/cgi-bin/wiki/imenu-tree.el
;; dot.emacs には，以下を追記します。
;; (add-hook 'org-mode-hook
;;   (lambda()
;;     (require 'imenu-tree)))
;; (global-set-key (kbd "M-h") 'imenu-tree)
;; これで，imenu-treeコマンドを実行すれば，ツリービューが左側に表示されます。
;; 
(when (not (require 'imenu-tree nil t))
  (progn
    (install-elisp-from-emacswiki "windata.el")
    (install-elisp-from-emacswiki "tree-mode.el")
    (install-elisp-from-emacswiki "imenu-tree.el")
    )
  )
(when (require 'imenu-tree nil t)
  (progn
    (add-hook 'org-mode-hook
              (lambda()
                (require 'imenu-tree)))
    (global-set-key (kbd "M-g M-i") 'imenu-tree)
    )
  )
