;; -*- mode: emacs-lisp ; coding: utf-8-unix -*-
;; my-org-mode-basis.el
;; #+LAST_UPDATED: 2013-10-23
;; ----------------------------------------------------------------------
;; 拡張子がorgのファイルを開いた時，自動的にorg-modeにする
;;
(add-to-list 'auto-mode-alist '("\\.howm.txt$" . org-mode))
(add-to-list 'auto-mode-alist '("\\.org.txt$" . org-mode))
;;
;; ----------------------------------------------------------------------
;; * [2010-10-28 木] GTD 
;; cf. url: http://hpcgi1.nifty.com/spen/index.cgi?OrgMode%2fManual2#i16
;; ショートカットキーは左手だけで入力できるように偏らせている。
;;
(setq org-todo-keywords 
      '("TODO(t)" 
	"PENDING(g)" 
	"VERIFY(v)" 
	"WAIT(w)" 
	"EVENT(e)" 
	"|" 
	"RESEARCH(r)" 
	"CANCELLED(c)" 
	"DONE(d)")
      org-todo-interpretation 
      'sequence)
;;
;; ----------------------------------------------------------------------
;; [2010-12-01 水] TODOの状態を示すキーワードと色分けの設定
;; url: http://hpcgi1.nifty.com/spen/index.cgi?OrgMode%2fOrganize_Your_Life_In_Plain_Text!
;; url: http://orgmode.org/manual/Faces-for-TODO-keywords.html
;;
(setq org-todo-keyword-faces 
      '(("TODO"      :foreground "red"           :underline t :inverse-video t)
	("VERIFY"    :foreground "SteelBlue3"    :underline t :weight bold )
	("PENDING"   :foreground "magenta"       :underline t :weight bold )
	("WAIT"      :foreground "orange"        :underline t :weight bold )
 	("EVENT"     :foreground "MediumPurple2" :underline t :weight bold )
	("RESEARCH"  :foreground "cyan1"         :underline t :weight bold )
	("CANCELLED" :foreground "seashell"      :underline t :weight bold )
	("DONE"      :foreground "forest green"  :underline t :weight bold )
	))
;;
;; ----------------------------------------------------------------------
