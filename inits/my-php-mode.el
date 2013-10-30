;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; =============================================================================
;; #+LAST_UPDATED: 2012-06-12
;; ----------------------------------------------------------------------------
;; * [2010-10-04 月]
;; 使用開始。
;; url: http://bluestar.s32.xrea.com/text/php-mode.php
;; url: http://sourceforge.net/projects/php-mode/
;; to: N:\.emacs.d\elisp\php-mode.el
;; (load-library "php-mode")
;; (require 'php-mode)
;; (add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
;; (add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
;; ----------------------------------------------------------------------------
;; * [2011-03-22 火] 
;; 再セットアップ。
;; url: http://emacsmemo.blog107.fc2.com/blog-entry-4.html
(add-to-list 'load-path "~/.emacs.d/php-mode-1.5.0")
(autoload 'php-mode "php-mode" "PHP mode" t)
(defcustom php-file-patterns (list "\\.php[s34]?\\'" "\\.phtml\\'" "\\.inc\\'")
  "*List of file patterns for which to automatically invoke php-mode."
  :type '(repeat (regexp :tag "Pattern"))
  :group 'php)
(let ((php-file-patterns-temp php-file-patterns))
  (while php-file-patterns-temp
    (add-to-list 'auto-mode-alist
                 (cons (car php-file-patterns-temp) 'php-mode))
    (setq php-file-patterns-temp (cdr php-file-patterns-temp))))
;; ----------------------------------------------------------------------
;; * [2011-09-21 水] flymake
;; setenv PATH に php 格納場所を追加しておく。
;; (setenv "PATH" 
;; "C:\\Program Files\\PHP\\;N:\\4-project\\myscript\\dos;C:\\ruby-1.8.7-p249\\bin;C:\\Program Files\\Java\\jdk1.6.0_22\\bin;C:\\eclipse\\eclipse-java-helios-win32\\plugins\\org.apache.ant_1.7.1.v20100518-1145\\bin;C:\\cygwin\\bin;C:\\Program Files\\Windows Resource Kits\\Tools\\;C:\\WINDOWS\\system32;C:\\WINDOWS;C:\\WINDOWS\\System32\\Wbem;C:\\WINDOWS\\system32\\WindowsPowerShell\\v1.0;C:\\Program Files\\TortoiseSVN\\bin;C:\\Program Files\\WinMerge;c:\\Program Files\\Microsoft SQL Server\\90\\Tools\\binn\\;C:\\Program Files\\WinMerge;C:\\Program Files\\MySQL\\MySQL Server 5.1\\bin;N:\\tool\\AStyle\\bin;N:\\tool\\emacs-23.2\\bin;C:\\Program Files\\R\\R-2.13.0\\bin;;C:\\Program Files\\WinMerge")
;; 環境変数が反映されていないので暫定処置。
;; N:\tool\emacs-23.2\bin\php.exe ここにコピーした。あとで撤去する。
;; ----------------------------------------------------------------------
;; * [2012-04-18 水] 入力支援
(defun my-php-insert-string-this () "入力支援"
  (interactive)
  (insert-string "$this->")
  )
(when (require 'php-mode nil t)
  (define-key php-mode-map (kbd "C-c C-t") 'my-php-insert-string-this)
  (global-set-key (kbd "C-z C-c C-f") 'php-search-documentation)
  (font-lock-add-keywords 'php-mode
                          '(
                            ("die" . font-lock-keyword-face)
                            ))
  )
 ;; ----------------------------------------------------------------------
;; * [2012-06-12 火]
;; - http://pear.php.net/manual/ja/standards.php
;;   - Manual : 標準コーディング規約
;; - http://pear.php.net/manual/ja/standards.indenting.php
;;   - Manual : インデント
;; Emacs を使用する場合、indent-tabs-mode を nil に設定する必要があります。
;; Emacs を設定するモードフックの例を次に示します (PHP ファイルを編集する
;; 際に これがコールされるようにする必要があります)。
;; (defun php-mode-hook ()
;;   (setq tab-width 4
;;         c-basic-offset 4
;;         c-hanging-comment-ender-p nil
;;     indent-tabs-mode
;;     (not
;;      (and (string-match "/\\(PEAR\\|pear\\)/" (buffer-file-name))
;;           (string-match "\.php$" (buffer-file-name))))))

(defun php-mode-hook ()
  (setq tab-width 4
        c-basic-offset 4
        c-hanging-comment-ender-p nil
        indent-tabs-mode
        (not
         (and (string-match "/\\(PEAR\\|pear\\)/" (buffer-file-name))
              (string-match "\.php$" (buffer-file-name))))))
