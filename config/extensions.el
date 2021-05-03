;;;;
;;;; User extensions and setting
;;;;


;;;  Start Emacs as a server on Linux:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; (require 'server)
;; (unless (server-running-p)
;;   (server-start))


;;;  Path to backup files:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(setq backup-directory-alist `(("." . "~/.emacs.d/.backup-emacs")))


;;;  GC setting:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(setq gc-cons-threshold (eval-when-compile (* 1024 1024 1024)))
(run-with-idle-timer 2 t (lambda () (garbage-collect)))


;;;  Org Mode:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(setq org-log-done t)
(setq org-agenda-files (list "~/path/to/your/todo-list-1.org"
			     "~/path/to/your/todo-list-2.org"))


;;;  Programming mode:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(require 'multiple-cursors)
(global-auto-complete-mode)

(projectile-mode +1)
(setq projectile-project-search-path '("~/path/to/your/project"))

(global-font-lock-mode 1)
(setq font-lock-maximum-decoration t)


;;;  Sound off:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(setq ring-bell-function 'ignore)


;;;  Window move key:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(windmove-default-keybindings 'meta)


;;;  Turn off cursor for non-active windows:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(setq cursor-in-non-selected-windows nil)


;;;  Swiper search:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(ivy-mode                           1)
(advice-add 'swiper :after #'recenter)


;;;  Scrolling settings:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(global-hl-line-mode                     t)
(setq scroll-margin                     10)
(setq scroll-conservatively            101)

(setq mouse-wheel-scroll-amount '(3 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)
(setq scroll-step 1)

(setq scroll-on-drag-smooth t)
(setq scroll-on-drag-delay 0.005)
(setq scroll-on-drag-motion-scale 0.05)
(setq scroll-on-drag-motion-accelerate 0.0)


;;;  Display file size/time in mode-line:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(setq display-time-24hr-format           t)
(display-time-mode                       t)
(size-indication-mode                    t)


;;;  IDO plugin:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(require 'ido)
(ido-mode                                t)
(icomplete-mode                          t)
(ido-everywhere                          t)
(setq ido-vitrual-buffers                t)
(setq ido-enable-flex-matching           t)


;;;  Line wrapping:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(setq word-wrap                          t)
(global-visual-line-mode                 t)


;;;  Show-paren-mode settings:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(setq show-paren-delay                0.15)
(setq show-paren-style        'parenthesis)
(show-paren-mode                         t)
(smartparens-global-mode                 t)


;;;  Highlight:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(setq search-highlight                   t)
(setq query-replace-highlight            t)

(highlight-parentheses-mode              t)
(highlight-numbers-mode                  t)

(setq highlight-indent-guides-method                                'column)
(setq highlight-indent-guides-auto-odd-face-perc                          3)
(setq highlight-indent-guides-auto-even-face-perc                         3)
(setq highlight-indent-guides-auto-character-face-perc                    5)

(add-hook 'prog-mode-hook                     'highlight-indent-guides-mode)


;;;  Autowipe trailing space & tabs:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(add-hook 'before-save-hook                     'delete-trailing-whitespace)


;;;  Delete selection area when input over:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(delete-selection-mode t)


;;;  Line number setting:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(require 'display-line-numbers)


(defcustom display-line-numbers-exempt-modes '(treemacs-mode
					       vterm-mode
					       eshell-mode
					       shell-mode
					       term-mode
					       ansi-term-mode)

  "Major modes on which to disable the linum mode,
exempts them from global requirement"

  :group 'display-line-numbers
  :type 'list
  :version "green")


(defun display-line-numbers--turn-on ()

  "turn on line numbers but excempting certain majore modes
defined in `display-line-numbers-exempt-modes'"

  (if (and
       (not (member major-mode display-line-numbers-exempt-modes))
       (not (minibufferp)))
      (display-line-numbers-mode)))


(global-display-line-numbers-mode)


;;;  END  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(provide 'extensions)
