;; ----------------------------------------------------------------------
;; * [2014-10-18 土] ~/.emacs.d/memo/my-emacs-customize-org-mode.org.txt org-agenda-custom-commands

(setq my-org-agenda-export-directory "~/.emacs.d/temp/") ; 仮。

(setq org-agenda-custom-commands
      '(("X" agenda "" nil ( "~/.emacs.d/temp/agenda.html" )
         )
        ("Y" alltodo "" nil (
                             "~/.emacs.d/temp/todo.html"
                             "~/.emacs.d/temp/todo.txt"
                             ))
        ("h" "Agenda and Home-related tasks"
         ((agenda "")
          (tags-todo "home")
          (tags "garden"))
         nil
         ( "~/.emacs.d/temp/home.html")
         )
        ("o" "Agenda and Office-related tasks"
         ((agenda)
          (tags-todo "work")
          (tags "office"))
         nil
         ("~/.emacs.d/temp/office.ics")
         )
        )
      )
;; (org-store-agenda-views)

;; バッチ処理。
(when nil
  (shell-command "
    emacs -eval '(progn
    (load \"~/.emacs.d/inits/my-org-agenda-experimental.el\")
    (org-batch-store-agenda-views \
    org-agenda-span (quote month) \
    org-agenda-start-day \"2014-10-19\" \
    org-agenda-include-diary nil \
    org-agenda-files (quote (\"~/.emacs.d/memo/my-emacs-customize-org-mode.org.txt\"))))' \
    -kill
"
                 )
  )
