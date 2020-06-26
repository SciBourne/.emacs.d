;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;     PACKAGES     ;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'cl)
(require 'package)

;; Packages:
(setq cfg-var:packages '(highlight-indent-guides
			 swiper
			 all-the-icons
			 use-package
			 treemacs))

(defun cfg:install-packages ()
  (let ((pkgs (remove-if #'package-installed-p cfg-var:packages)))
    (when pkgs
      (message "%s" "Emacs is now refreshing its package database...")
      (package-refresh-contents)
      (message "%s" " done.")
      (dolist (p cfg-var:packages)
        (package-install p)))))

;; Repositories:
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))

(package-initialize)
(cfg:install-packages)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(setq default-directory "C:/Users/Bourne/AppData/Roaming/")

;; Start Emacs as a server:
(require 'server)
(unless (server-running-p)
    (server-start))

;; SLIME setting:
;(setq inferior-lisp-program              "/usr/bin/sbcl")
;(add-to-list 'load-path             "/home/bourne/slime")
;(require                                'slime-autoloads)
;(slime-setup)

;; Start window size
(when (window-system)
    (set-frame-size (selected-frame) 200 50))

;; Path to backup files:
(setq backup-directory-alist `(("." . "~/.backup-emacs")))

;; Best buffer latency:
(setq redisplay-dont-pause t)

;; Sound off:
(setq ring-bell-function 'ignore)

;; Window move key:
(windmove-default-keybindings 'meta)

;; Swiper search:
(ivy-mode                           1)
(advice-add 'swiper :after #'recenter)

;; Show-paren-mode settings:
(show-paren-mode t)

;; Display file size/time in mode-line:
(setq display-time-24hr-format           t)
(display-time-mode                       t)
(size-indication-mode                    t)

;; Line wrapping:
(setq word-wrap                          t)
(global-visual-line-mode                 t)

;; IDO plugin:
(require 'ido)
(ido-mode                                t)
(icomplete-mode                          t)
(ido-everywhere                          t)
(setq ido-vitrual-buffers                t)
(setq ido-enable-flex-matching           t)

;; Autowipe trailing space & tabs:
(add-hook 'before-save-hook                     'delete-trailing-whitespace)

;; Scrolling settings:
(setq scroll-step                        1)
(global-hl-line-mode                     1)
(setq scroll-margin                     10)
(setq scroll-conservatively          10000)

;; Highlight search resaults:
(setq search-highlight                   t)
(setq query-replace-highlight            t)

;; Highlight indent:
(setq highlight-indent-guides-method                             'character)

(setq highlight-indent-guides-auto-odd-face-perc                          3)
(setq highlight-indent-guides-auto-even-face-perc                         3)
(setq highlight-indent-guides-auto-character-face-perc                    5)

(add-hook 'prog-mode-hook                     'highlight-indent-guides-mode)

;; Line number:
(require 'display-line-numbers)
(defcustom display-line-numbers-exempt-modes '(treemacs-mode vterm-mode eshell-mode shell-mode term-mode ansi-term-mode)
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

;; Language:
(set-input-method "russian-computer")





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;     CUSTOM THEME     ;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'custom-theme-load-path ".emacs.d/themes/kaolin-themes")

;; Mode-line & projects trees:
(telephone-line-mode)

(treemacs)

(require    'kaolin-themes)
(load-theme 'kaolin-dark t)
(kaolin-treemacs-theme)

(use-package kaolin-themes
  :config
  (load-theme 'kaolin-dark t)
  (kaolin-treemacs-theme))

(set-frame-parameter (selected-frame) 'alpha '(97 . 85))
(add-to-list 'default-frame-alist '(alpha . (97 . 85)))

(column-number-mode)
(display-time-mode)
(fringe-mode -1)
(scroll-bar-mode -1)
(show-paren-mode)
(size-indication-mode)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)

(custom-set-faces
 '(default ((t (:family "InconsolataCyr" :foundry "outline" :slant normal :weight normal :height 109 :width normal)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
