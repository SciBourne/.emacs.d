;;
;; Setting for ANSI Common Lisp (SBCL)
;;


;; Windows path:
(when (system-is-windows)
  (setq inferior-lisp-program "C:/Program Files/Steel Bank Common Lisp/2.0.0/sbcl.exe"))


;; Linux path:
(when (system-is-linux)
  (setq inferior-lisp-program                                         "/usr/bin/sbcl/"))


;; Slime:
(require 'slime)
(require 'slime-autoloads)
(slime-setup '(slime-asdf
	       slime-fancy
	       slime-indentation))


;; Indent Common Lisp:
(setq-default lisp-body-indent                                2)
(setq-default lisp-indent-function 'common-lisp-indent-function)


(provide 'common-lisp-language)
