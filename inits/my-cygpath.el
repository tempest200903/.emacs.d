;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2014-10-06
;; my-cygpath.el
;; 関連 my-cygpath-keymap-autoload.el
;; ======================================================================

;; * [2014-10-06 月] パス名の区切り文字を変換するコマンド。 cygpath と同じ機能。

(defun my-cygpath-m-kill-ring () "cygpath -m と同じ。 like --windows, but with regular slashes (C:/WINNT)"
  (interactive)
  (when mark-active (kill-ring-save (mark) (point)))
  (let (
        (path (car kill-ring))
        )
    (kill-new (my-cygpath-m path))
    )
  )

(defun my-cygpath-m-dired () "cygpath -m と同じ。 like --windows, but with regular slashes (C:/WINNT)"
  (interactive)
  "TBD"
  )

(defun my-cygpath-m (path) "cygpath -m と同じ。 like --windows, but with regular slashes (C:/WINNT)"
  (interactive "sPath: ")
  (let (
        (new-path (replace-regexp-in-string "\\\\" "/" path))
        )
    (message new-path)
    new-path)
  )

(defun my-cygpath-w-kill-ring () "cygpath -w と同じ。 print Windows form of NAMEs (C:\WINNT)"
  (interactive)
  (when mark-active (kill-ring-save (mark) (point)))
  (let (
        (path (car kill-ring))
        )
    (kill-new (my-cygpath-w path))
    )
  )

(defun my-cygpath-w-dired () "cygpath -w と同じ。 print Windows form of NAMEs (C:\WINNT)"
  (interactive)
  "TBD"
  )

(defun my-cygpath-w (path) "cygpath -w と同じ。 print Windows form of NAMEs (C:\WINNT)"
  (interactive "sPath: ")
  (let (
        (new-path (replace-regexp-in-string "/" "\\\\" path))
        )
    (message new-path)
    new-path)
  )

;; ----------------------------------------------------------------------
;; * [2014-10-17 金] TODO org link を cygpath 変換する。

;; ----------------------------------------------------------------------
;; Usage: cygpath (-d|-m|-u|-w|-t TYPE) [-f FILE] [OPTION]... NAME...
;;        cygpath [-c HANDLE] 
;;        cygpath [-ADHOPSW] 
;;        cygpath [-F ID] 

;; Convert Unix and Windows format paths, or output system path information

;; Output type options:

;;   -d, --dos             print DOS (short) form of NAMEs (C:\PROGRA~1\)
;;   -m, --mixed           like --windows, but with regular slashes (C:/WINNT)
;;   -M, --mode            report on mode of file (binmode or textmode)
;;   -u, --unix            (default) print Unix form of NAMEs (/cygdrive/c/winnt)
;;   -w, --windows         print Windows form of NAMEs (C:\WINNT)
;;   -t, --type TYPE       print TYPE form: 'dos', 'mixed', 'unix', or 'windows'

;; Path conversion options:

;;   -a, --absolute        output absolute path
;;   -l, --long-name       print Windows long form of NAMEs (with -w, -m only)
;;   -p, --path            NAME is a PATH list (i.e., '/bin:/usr/bin')
;;   -s, --short-name      print DOS (short) form of NAMEs (with -w, -m only)
;;   -C, --codepage CP     print DOS, Windows, or mixed pathname in Windows
;;                         codepage CP.  CP can be a numeric codepage identifier,
;;                         or one of the reserved words ANSI, OEM, or UTF8.
;;                         If this option is missing, cygpath defaults to the
;;                         character set defined by the current locale.

;; System information:

;;   -A, --allusers        use `All Users' instead of current user for -D, -O, -P
;;   -D, --desktop         output `Desktop' directory and exit
;;   -H, --homeroot        output `Profiles' directory (home root) and exit
;;   -O, --mydocs          output `My Documents' directory and exit
;;   -P, --smprograms      output Start Menu `Programs' directory and exit
;;   -S, --sysdir          output system directory and exit
;;   -W, --windir          output `Windows' directory and exit
;;   -F, --folder ID       output special folder with numeric ID and exit

;; Other options:

;;   -f, --file FILE       read FILE for input; use - to read from STDIN
;;   -o, --option          read options from FILE as well (for use with --file)
;;   -c, --close HANDLE    close HANDLE (for use in captured process)
;;   -i, --ignore          ignore missing argument
;;   -h, --help            output usage information and exit
;;   -V, --version         output version information and exit

;; ----------------------------------------------------------------------
(provide 'my-cygpath)
