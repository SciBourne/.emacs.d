;;;;
;;;; Setting for Python:
;;;;


;;;  Off echo input code in python:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(custom-set-variables
 '(elpy-shell-echo-input nil))


;;;  Python environment:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(setq python-shell-interpreter "python")
(setq python-shell-interpreter-args "-i")
(setenv "WORKON_HOME" "~/path/your/anaconda3/envs")

(defun python-environment-activation ()
  (let ((project (projectile-project-name)))
    (cond ((equal project "Data Science")
	   (progn
	     (pyvenv-workon "brain_skills")
	     (message
	      (concat ">>> Welcome to your " project " project")))))))


;;;  Some highlighting patterns for Python usage regexp:  ;;;;;;;;;;;;;;;;;;;;;;


(font-lock-add-keywords
 'python-mode
 '(("\\(=\\|>\\|<\\|+\\|-\\|/\\|%\\|*\\)" . 'custom-group-tag)))

(font-lock-add-keywords
 'python-mode
 '(("\\(\\[\\|\\]\\)" . 'ivy-confirm-face)))

(font-lock-add-keywords
 'python-mode
 '(("\\w+_\\w+_\\w+=\\|\\w+_\\w+=\\|\\w+=" . 'custom-variable-tag)))


;;;  Highlight theme:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defun highlight-theme-python ()
  (custom-set-faces

   '(default                      ((t (:inherit nil
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

   '(cursor                       ((t (:background "papaya whip"))))
   '(custom-group-tag             ((t (:foreground "sandy brown"
				       :weight bold
				       :height 1.2))))

   '(custom-variable-tag          ((t (:foreground "light steel blue"))))
   '(font-lock-builtin-face       ((t (:foreground "light sea green"))))
   '(font-lock-constant-face      ((t (:foreground "IndianRed1"))))
   '(font-lock-function-name-face ((t (:foreground "SeaGreen3"))))
   '(font-lock-keyword-face       ((t (:foreground "DeepSkyBlue3"))))
   '(font-lock-type-face          ((t (:foreground "medium turquoise"))))
   '(font-lock-variable-name-face ((t (:foreground "pale violet red"))))
   '(highlight-numbers-number     ((t (:foreground "light green")))))

  (custom-set-variables
   '(ein:jupyter-default-notebook-directory
     "~/path/your/default/notebook/dir")

   '(ein:output-area-inlined-images t)
   '(elpy-shell-echo-input nil)))


;;;  Hooks:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(add-hook  'python-mode-hook  'highlight-theme-python)
(add-hook  'python-mode-hook  'python-environment-activation)
(add-hook  'python-mode-hook  'elpy-enable)
(add-hook  'elpy-mode-hook    'highlight-numbers-mode)
(add-hook  'elpy-mode-hook    'highlight-parentheses-mode)
(add-hook  'elpy-mode-hook    'smartparens-mode)

(defadvice auto-complete-mode (around disable-auto-complete-for-python)
  (unless (eq major-mode 'python-mode) ad-do-it))

(ad-activate 'auto-complete-mode)


;;;  END  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(provide 'python-language)
