;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-org-mode-isfenv.el
;; ======================================================================
;; * [2010-10-28 木] GTD 導入を検討する。
;; cf. url: http://hpcgi1.nifty.com/spen/index.cgi?OrgMode%2fManual2#i16
;; ショートカットキーは左手だけで入力できるように偏らせている。
;; n:/tool/gnupack/gnupack_basic-8.00/home/.emacs.d/memo/emacs-bug-history.org.txt
;; 〔gnupack version 8.00 不具合回避方法〕

;; (setq org-todo-keywords 
;;       '("TODO(t)" 
;; 	"PENDING(e)" 
;; 	"VERIFY(v)" 
;; 	"WAIT(w)" 
;; 	"PLAN(a)" 
;; 	"|" 
;; 	"RESEARCH(r)" 
;; 	"CANCELLED(c)" 
;; 	"DONE(d)")
;;       org-todo-interpretation 
;;       'sequence)

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

;; ----------------------------------------------------------------------
;; [2010-12-01 水] TODOの状態を示すキーワードと色分けの設定
;; url: http://hpcgi1.nifty.com/spen/index.cgi?OrgMode%2fOrganize_Your_Life_In_Plain_Text!

;; (setq org-todo-keyword-faces 
;;       '(("TODO"      :foreground "red"           :weight bold :underline t)
;; 	("VERIFY"    :foreground "SteelBlue3"    :weight bold :underline t)
;; 	("PENDING"   :foreground "magenta"       :weight bold :underline t)
;; 	("WAIT"      :foreground "orange"        :weight bold :underline t)
;; 	("PLAN"      :foreground "MediumPurple2" :weight bold :underline t)
;; 	("RESEARCH"  :foreground "cyan1"         :weight bold :underline t)
;; 	("CANCELLED" :foreground "seashell"      :weight bold :underline t)
;; 	("DONE"      :foreground "forest green"  :weight bold :underline t)
;; 	))

(setq org-todo-keyword-faces 
      '(("TODO"      :foreground "red"           :weight bold :underline t)
	("VERIFY"    :foreground "SteelBlue3"    :weight bold :underline t)
	("PENDING"   :foreground "magenta"       :weight bold :underline t)
	("WAIT"      :foreground "orange"        :weight bold :underline t)
 	("EVENT"      :foreground "MediumPurple2" :weight bold :underline t)
	("RESEARCH"  :foreground "cyan1"         :weight bold :underline t)
	("CANCELLED" :foreground "seashell"      :weight bold :underline t)
	("DONE"      :foreground "forest green"  :weight bold :underline t)
	))


(fset 'workmanagerinput
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([67108922 97 98 108 82] 0 "%d")) arg)))
