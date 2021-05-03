;;;;
;;;; Setting for ANSI Common Lisp (SBCL)
;;;;


;;;  OS path:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(when (system-is-windows)
  (setq inferior-lisp-program
	"C:/Program Files/your/path/to/sbcl.exe"))


(when (system-is-linux)
  (setq inferior-lisp-program "/your/path/to/sbcl"))


;;;  Slime:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(require 'slime)
(require 'slime-autoloads)

(slime-setup '(slime-asdf
	       slime-fancy
	       slime-indentation))


;;;  Indent Common Lisp:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(setq-default lisp-body-indent 2)
(setq-default lisp-indent-function 'common-lisp-indent-function)


;;;  Some syntax highlighting usage regexp:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defconst +variable-pattern+     "\\([*+][a-z0-9-+*]+\\)")
(defconst +operator-pattern+     "\\([%+,/<=>@`]\\)")
(defconst +op-diff-pattern+      "\\(\(\\)\\([*-]\\)\\(\s\\)")
(defconst +parenthesis-pattern+  "\\(\\[\\|\\]\\)")

(defconst +builtin-pattern+
  (concat "\\(\(\\)\\<" (regexp-opt '(

				      ;; functions & macros:
				      "eq"
				      "equal"
				      "funcall"
				      "format"
				      "map"
				      "mapcan"
				      "mapcar"
				      "mapc"
				      "print"
				      "princ"
				      "nth-value"
				      "values"
				      "concat"
				      "documentation"
				      "string"
				      "string-upcase"
				      "describe"
				      "type-of"
				      "subseq"
				      "intern"
				      "symbol"
				      "list"
				      "in"
				      "on"
				      "from"
				      "by"
				      "with"

				      ;; predicats:
				      "boundp"
				      "fboundp"
				      "intern"
				      "stringp"
				      "numberp"
				      "listp"
				      "consp"
				      "floatp"
				      "realp"
				      "complexp"
				      "rationalp"
				      "functionp"
				      "symbolp"
				      "typep"

				      ) t) "\\>\\(\s\\|\)\\)"))

(defconst +keyword-pattern+
  (concat "\\<" (regexp-opt '(

			      "setf"
			      "setq"
			      "or"
			      "and"
			      "do"
			      "for"
			      "defsystem"
			      "makunbound"
			      "fmakunbound"

			      ) t) "\\>"))

(defconst +constant-pattern+
  (concat "\\<" (regexp-opt '("t" "nil") t) "\\>"))


(font-lock-add-keywords
 'lisp-mode (list (list +op-diff-pattern+  2  'font-lock-warning-face         t)
		  (list +builtin-pattern+  2  'font-lock-preprocessor-face    t)
		  (cons +variable-pattern+    'font-lock-variable-name-face)
		  (cons +operator-pattern+    'font-lock-warning-face)
		  (cons +parenthesis-pattern+ 'font-lock-warning-face)
		  (cons +keyword-pattern+     'font-lock-keyword-face)
		  (cons +constant-pattern+    'font-lock-constant-face)))


;;;  Highlight theme:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;; TODO: Rebuild color theme:
(defun font-lock-theme-common-lisp ()
  (custom-set-faces

   '(default                          ((t (:inherit nil
					   :extend nil
					   :stipple nil
					   :background "#18181B"
					   :foreground "DarkSeaGreen2"
					   :inverse-video nil
					   :box nil
					   :strike-through nil
					   :overline nil
					   :underline nil
					   :slant normal
					   :weight normal
					   :height 120
					   :width normal
					   :foundry "xos4"
					   :family "xos4 Terminus"))))

   '(cursor                           ((t (:background "papaya whip"))))
   '(custom-group-tag                 ((t (:foreground "sandy brown"
					   :weight bold
					   :height 1.2))))

   '(custom-variable-tag              ((t (:foreground "light steel blue"))))
   '(font-lock-builtin-face           ((t (:foreground "medium slate blue"))))
   '(font-lock-comment-delimiter-face ((t (:foreground "#545c5e"
					   :slant normal))))

   '(font-lock-constant-face          ((t (:foreground "IndianRed1"))))
   '(font-lock-doc-face               ((t (:foreground "cornflower blue"))))
   '(font-lock-function-name-face     ((t (:foreground "chartreuse2"))))
   '(font-lock-keyword-face           ((t (:foreground "cyan"))))
   '(font-lock-preprocessor-face      ((t (:foreground "dodger blue"))))
   '(font-lock-string-face            ((t (:foreground "medium sea green"))))
   '(font-lock-type-face              ((t (:foreground "medium turquoise"))))
   '(font-lock-variable-name-face     ((t (:foreground "medium orchid"))))
   '(highlight-numbers-number         ((t (:foreground "SpringGreen1"))))))


;;;  Hooks:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(add-hook  'lisp-mode-hook  'font-lock-theme-common-lisp)
(add-hook  'lisp-mode-hook  'highlight-numbers-mode)
(add-hook  'lisp-mode-hook  'highlight-parentheses-mode)
(add-hook  'lisp-mode-hook  'smartparens-mode)


;;;  END  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(provide 'common-lisp-language)
