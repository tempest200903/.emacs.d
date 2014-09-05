;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-seq.el
;; ======================================================================
;; * [2011-09-12 月] 連番を挿入する方法
;; url: http://d.hatena.ne.jp/rubikitch/20110221
;; ----------------------------------------------------------------------
;; * [2011-09-12 月] M-x duplicate-this-line-forward 直前の行をコピーする
;; 直前の行と同じ行を作成することはよくあります。 C-a C-k C-k C-y C-y ...と操作すると思いますが、キルリングが置き換わってしまう問題があります。 そこで、このコード。
(defun duplicate-this-line-forward (n)
  "Duplicates the line point is on.  The point is next line.
 With prefix arg, duplicate current line this many times."
  (interactive "p")
  (when (eq (point-at-eol)(point-max))
    (save-excursion (end-of-line) (insert "\n")))
  (save-excursion
    (beginning-of-line)
    (dotimes (i n)
      (insert-buffer-substring (current-buffer) (point-at-bol)(1+ (point-at-eol))))))
;; ----------------------------------------------------------------------
;; * [2011-09-12 月] M-x seq 数字のみが違う同じ行を作成する
;; 「第1回」から「第10回」までの行を作成したいとします。 そのとき、「第
;; 1回」という行をM-x duplicate-this-line-forwardでコピーして数字だけを
;; 書き換えるのは面倒です。 そこで、このコード。
;;
;; M-x seqでは、数字部分をformat関数の書式指定にしておくことでそこが数
;; 字に置き換わります。 このコマンドは、書式指定→開始番号→終了番号の
;; 順で聞いてきます。 この例では、「M-x seq RET 第%d回 RET RET 10 RET」
;; と操作します。
;;
;; %dは複数個持つことができます。 「M-x seq RET [%02d]第%d回 RET RET 3
;; %RET」で以下の行が挿入されます。
;;
(defun count-string-matches (regexp string)
  (with-temp-buffer
    (insert string)
    (count-matches regexp (point-min) (point-max))))
(defun seq (format-string from to)
  "Insert sequences with FORMAT-STRING.
FORMAT-STRING is like `format', but it can have multiple %-sequences."
  (interactive
   (list (read-string "Input sequence Format: ")
         (read-number "From: " 1)
         (read-number "To: ")))
  (save-excursion
    (loop for i from from to to do
          (insert (apply 'format format-string
                         (make-list (count-string-matches "%[^%]" format-string) i))
                  "\n")))
  (end-of-line))
;; ----------------------------------------------------------------------
;; * [2011-09-12 月] M-x number-rectangle 連番の長方形を作成する
;; 最後に、連番の長方形を作成するコマンドを作りました。
(eval-when-compile (require 'cl))
(defun number-rectangle (start end format-string from)
  "Delete (don't save) text in the region-rectangle, then number it."
  (interactive
   (list (region-beginning) (region-end)
         (read-string "Number rectangle: " (if (looking-back "^ *") "%d. " "%d"))
         (read-number "From: " 1)))
  (save-excursion
    (goto-char start)
    (setq start (point-marker))
    (goto-char end)
    (setq end (point-marker))
    (delete-rectangle start end)
    (goto-char start)
    (loop with column = (current-column)
          while (<= (point) end)
          for i from from   do
          (insert (format format-string i))
          (forward-line 1)
          (move-to-column column)))
  (goto-char start))
(global-set-key "\C-xrN" 'number-rectangle)
;; ----------------------------------------------------------------------
;; * [2013-01-28 月] カーソル場所にある値を1増やす。Vim の C-a に触発されて作った。
;; http://tomykaira.hatenablog.com/entry/2013/01/25/000057
(defun my-increment-number-decimal (&optional arg)
  "Increment the number forward from point by 'arg'."
  (interactive "p*")
  (save-excursion
    (save-match-data
      (let (inc-by field-width answer)
        (setq inc-by (if arg arg 1))
        (skip-chars-backward "0123456789")
        (when (re-search-forward "[0-9]+" nil t)
          (setq field-width (- (match-end 0) (match-beginning 0)))
          (setq answer (+ (string-to-number (match-string 0) 10) inc-by))
          (when (< answer 0)
            (setq answer (+ (expt 10 field-width) answer)))
          (replace-match (format (concat "%0" (int-to-string field-width) "d")
                                 answer)))))))
(global-set-key (kbd "M-+") 'my-increment-number-decimal)
;; ----------------------------------------------------------------------
(provide 'my-seq)

