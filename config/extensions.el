;;
;; User extensions and setting
;;


;; Start Emacs as a server on Linux:
(require 'server)
(unless (server-running-p)
  (server-start))


;; Path to backup files:
(setq backup-directory-alist `(("." . "~/.emacs.d/.backup-emacs")))


;; Best buffer latency:
(setq redisplay-dont-pause t)


;; Sound off:
(setq ring-bell-function 'ignore)


;; Window move key:
(windmove-default-keybindings 'meta)


;; Swiper search:
(ivy-mode                           1)
(advice-add 'swiper :after #'recenter)


;; Scrolling settings:
(setq scroll-step                        1)
(global-hl-line-mode                     1)
(setq scroll-margin                     10)
(setq scroll-conservatively          10000)


;; Display file size/time in mode-line:
(setq display-time-24hr-format           t)
(display-time-mode                       t)
(size-indication-mode                    t)


 ;; IDO plugin:
(require 'ido)
(ido-mode                                t)
(icomplete-mode                          t)
(ido-everywhere                          t)
(setq ido-vitrual-buffers                t)
(setq ido-enable-flex-matching           t)


;; Line wrapping:
(setq word-wrap                          t)
(global-visual-line-mode                 t)


;; Show-paren-mode settings:
(show-paren-mode t)


;; Highlight search resaults:
(setq search-highlight                   t)
(setq query-replace-highlight            t)


;; Highlight indent:
(setq highlight-indent-guides-method                             'character)
(setq highlight-indent-guides-auto-odd-face-perc                          3)
(setq highlight-indent-guides-auto-even-face-perc                         3)
(setq highlight-indent-guides-auto-character-face-perc                    5)

(add-hook 'prog-mode-hook                     'highlight-indent-guides-mode)


;; Autowipe trailing space & tabs:
(add-hook 'before-save-hook                     'delete-trailing-whitespace)


;; Delete selection area when input over:
(delete-selection-mode t)


;; Buffer Selection and ibuffer settings:
(require                          'bs)
(require                     'ibuffer)
(defalias 'list-buffers      'ibuffer)
(global-set-key (kbd "<f2>") 'bs-show)


;; Line number setting:
(require 'display-line-numbers)

(defcustom display-line-numbers-exempt-modes '(treemacs-mode
					       vterm-mode
					       eshell-mode
					       shell-mode
					       term-mode
					       ansi-term-mode)

  "Major modes on which to disable the linum mode, exempts them from global requirement"
  :group 'display-line-numbers
  :type 'list
  :version "green")

(defun display-line-numbers--turn-on ()
  "turn on line numbers but excempting certain majore modes defined in `display-line-numbers-exempt-modes'"
  (if (and
       (not (member major-mode display-line-numbers-exempt-modes))
       (not (minibufferp)))
      (display-line-numbers-mode)))

(global-display-line-numbers-mode)


(provide 'extensions)
