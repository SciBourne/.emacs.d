;;;;
;;;; Web-development configuration for HTML and CSS
;;;;


;;;  Web-mode association:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))


;;;  Indents:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(setq web-mode-markup-indent-offset  2)
(setq web-mode-css-indent-offset     2)
(setq web-mode-code-indent-offset    2)


;;;  Auto-pairs:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(setq web-mode-enable-auto-pairing   t)


;;;  Auto-complete:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(setq web-mode-ac-sources-alist
  '(("css" . (ac-source-css-property))
    ("html" . (ac-source-words-in-buffer ac-source-abbrev))))


;;;  Highlight theme:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(setq web-mode-enable-current-column-highlight   t)
(setq web-mode-enable-block-face                 t)
(setq web-mode-enable-css-colorization           t)
(setq web-mode-enable-current-element-highlight  t)


(defun font-lock-theme-web-mode ()
  (custom-set-faces

   '(default                          ((t (:inherit nil
					   :extend nil
					   :stipple nil
					   :background "#18181B"
					   :foreground "dark slate gray"
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
   '(font-lock-builtin-face           ((t (:foreground "light coral"))))
   '(font-lock-comment-delimiter-face ((t (:foreground "#545c5e"
					   :slant normal))))

   '(font-lock-constant-face          ((t (:foreground "IndianRed1"))))
   '(font-lock-doc-face               ((t (:foreground "cornflower blue"))))
   '(font-lock-function-name-face     ((t (:foreground "dodger blue"))))
   '(font-lock-keyword-face           ((t (:foreground "medium spring green"))))
   '(font-lock-preprocessor-face      ((t (:foreground "firebrick"))))
   '(font-lock-string-face            ((t (:foreground "PaleTurquoise4"))))
   '(font-lock-type-face              ((t (:foreground "magenta"))))
   '(font-lock-variable-name-face     ((t (:foreground "cornflower blue"))))))


;;;  Hooks:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(add-hook  'web-mode-hook  'font-lock-theme-web-mode)
(add-hook  'web-mode-hook  'highlight-numbers-mode)
(add-hook  'web-mode-hook  'highlight-parentheses-mode)
(add-hook  'web-mode-hook  'smartparens-mode)


;;;  END  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(provide 'web-dev)
