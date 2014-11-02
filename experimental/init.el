(message "BEGIN ~/.emacs.d/experimental/init.el")

(require 'org)

;; input
(setq org-agenda-files "~/.emacs.d/experimental/input1.org")
(setq org-agenda-files "~/.emacs.d/experimental/input2.org")

;; output
(setq org-combined-agenda-icalendar-file "~/.emacs.d/experimental/experimental1.org")

;; process
(org-export-icalendar-combine-agenda-files)

(message "END ~/.emacs.d/experimental/init.el")
