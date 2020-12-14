;;
;; User theme packages and settings (GUI)
;;
;; My monitors: 32" 3840x2160px
;; Edit this file for your devices before start
;;


;; Start window setting:
 (setq initial-frame-alist
       '((width . 220)
	 (height . 60)
	 (left . 220)
	 (top  . 180)))


;; Decore setting:
(setq inhibit-startup-screen t
      initial-buffer-choice  t)

(setq inhibit-splash-screen t)
(setq use-dialog-box      nil)

(column-number-mode)
(display-time-mode)
(scroll-bar-mode           -1)
(show-paren-mode)
(size-indication-mode)
(tool-bar-mode             -1)
(tooltip-mode              -1)
(menu-bar-mode             -1)


;; Fringe setting:
(fringe-mode '(8 . 0))


;; Font:
(set-default-font "InconsolataCyr 12")
(setq-default line-spacing          1)


;; Opacity setting:
(set-frame-parameter (selected-frame) 'alpha '(95 . 85))
(add-to-list 'default-frame-alist '(alpha . (95 . 85)))


;; Dashboard setting:
(require 'dashboard)

(dashboard-setup-startup-hook)

(setq dashboard-banner-logo-title "Welcome to GNU Emacs, commander!")
(setq dashboard-init-info                               "Dashboard:")
(setq dashboard-set-init-info                                      t)
(setq dashboard-set-footer                                         t)
(setq dashboard-footer-messages          '("Shut up and hack, bro!"))
(setq dashboard-show-shortcuts                                   nil)
(setq dashboard-center-content                                     t)

(setq dashboard-items '((recents  .     20)
                        (bookmarks .    5)
                        (projects .     5)
                        (agenda .       5)
                        (registers .    5)))

(setq dashboard-set-heading-icons      t)   ;freezing on win...
(setq dashboard-set-file-icons         t)   ; -||-

(setq dashboard-set-navigator           t)
(setq dashboard-set-init-info           t)

(add-to-list 'dashboard-items '(agenda) t)
(setq show-week-agenda-p                t)


;; Treemacs setting:
(treemacs)
(treemacs-resize-icons 32)


;; Mode-line theme:
(telephone-line-mode)           ;freezing om win...


;; Themes:
(require    'kaolin-themes)
(load-theme 'kaolin-dark t)
(kaolin-treemacs-theme)         ;freezing UI on my machine Windows 10 (when view unicode icons)

(use-package kaolin-themes
  :config
  (load-theme 'kaolin-dark t)
  (kaolin-treemacs-theme))      ; -||-


(provide 'theme-gui)
