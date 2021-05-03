;;;;
;;;; User keybinging
;;;;


;;;  Common binds:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(global-set-key   [C-tab]        'load-file)
(global-set-key   (kbd "C-`")    'eshell-command)
(global-set-key   (kbd "C-c s")  'swiper-isearch)


;;;  Org Mode: Create TODO item from selected code:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defun get-current-org-path ()
  (interactive)
  (cond ((equal nil (projectile-project-root))
	 (print "~/path/your/default/todo-list.org"))
	((print (concat (projectile-project-root) "todo-list.org")))))


(setq org-capture-templates
      '(("t" "TODO" entry (file+headline get-current-org-path "Tasks")
	 "* TODO %^{TITLE} %^G \n:PROPERTIES: \n:Created: %T \n:Source: %a \n:END: \n\n\n#+begin_src %^{LANGUAGE}\n\n %i \n\n#+end_src\n\n\n"
	 :prepend t
	 :empty-lines 0
	 :created t
	 :kill-buffer t)))


(global-set-key (kbd "C-c t") 'org-capture)


;;;  Buffer Selection and ibuffer settings:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(require                          'bs)
(require                     'ibuffer)
(defalias 'list-buffers      'ibuffer)
(global-set-key (kbd "<f2>") 'bs-show)


;;;  Hi-Lock mode:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(if (functionp 'global-hi-lock-mode)
    (global-hi-lock-mode 1)
    (hi-lock-mode 1))


;;;  Drop-down code block:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defun set-selective-display-dlw (&optional level)
  (interactive "P")
  (if (eq selective-display (1+ (current-column)))
      (set-selective-display 0)
      (set-selective-display (or level (1+ (current-column))))))


(global-set-key (kbd "<f5>") 'set-selective-display-dlw)


;;;  Multiple-cursors-mode:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(global-set-key   [M-S-mouse-3]  'mc/mark-all-symbols-like-this-in-defun)
(global-set-key   [M-S-mouse-2]  'mc/mark-all-symbols-like-this)
(global-set-key   [M-S-mouse-1]  'mc/add-cursor-on-click)
(global-set-key   (kbd "M--")    'mc/mark-next-like-this)


;;;  Pythom mode:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defun python-eval-file--with-spaces ()
  (interactive)
  (shell-command
   (concat "/path/your/python " "'" buffer-file-name "'")))


(defun jupyter-load-file--with-spaces ()
  (interactive)
  (jupyter-eval-string
   (jupyter-load-file-code (concat "'" buffer-file-name "'"))))


(defun jupyter-eval-buffer--utf-8 ()
  (interactive)
  (jupyter-eval-string
   (encode-coding-string
    (with-current-buffer (current-buffer) (buffer-string)) 'utf-8)))


(global-set-key   (kbd "C-=")    'flymake-mode)
(global-set-key   (kbd "C-x p")  'ein:login)
(global-set-key   (kbd "C-c c")  'jupyter-eval-buffer--utf-8)
(global-set-key   (kbd "C-c l")  'jupyter-load-file--with-spaces)
(global-set-key   (kbd "C-x j")  'jupyter-connect-server-repl)
(global-set-key   (kbd "M-.")    'jedi:goto-definition)
(global-set-key   (kbd "M-,")    'jedi:goto-definition-pop-marker)
(global-set-key   (kbd "M-/")    'jedi:show-doc)
(global-set-key   (kbd "M-?")    'helm-jedi-related-names)
(global-set-key   (kbd "C-c f")  'python-eval-file--with-spaces)


;;;  Scrolling:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defun smoothing-scroll ()
  (interactive)
  (unless (scroll-on-drag)
    (mouse-yank-primary t)))


(global-set-key  [down-mouse-2]  'smoothing-scroll)


;;;  END  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(provide 'keybinding)
