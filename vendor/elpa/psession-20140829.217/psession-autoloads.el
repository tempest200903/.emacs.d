;;; psession-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (psession-mode psession-delete-winconf psession-restore-winconf
;;;;;;  psession-save-winconf) "psession" "psession.el" (21553 567))
;;; Generated autoloads from psession.el

(autoload 'psession-save-winconf "psession" "\


\(fn PLACE)" t nil)

(autoload 'psession-restore-winconf "psession" "\


\(fn CONF)" t nil)

(autoload 'psession-delete-winconf "psession" "\


\(fn CONF)" t nil)

(defvar psession-mode nil "\
Non-nil if Psession mode is enabled.
See the command `psession-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `psession-mode'.")

(custom-autoload 'psession-mode "psession" nil)

(autoload 'psession-mode "psession" "\
Persistent emacs sessions.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("psession-pkg.el") (21553 567 33000))

;;;***

(provide 'psession-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; psession-autoloads.el ends here
