;;;;
;;;; User theme packages and settings (GUI)
;;;;
;;;; My monitors: 32" 3840x2160px
;;;; Edit this file for your devices before start
;;;;


;;;  Start window setting:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(add-to-list 'initial-frame-alist
	     (cons 'width (/ (* (/ (x-display-pixel-width) 100) 50)
			     (frame-char-width))))

(add-to-list 'initial-frame-alist
	     (cons 'height (/ (* (/ (x-display-pixel-height) 100) 80)
			     (frame-char-height))))

(add-to-list 'initial-frame-alist
	     (cons 'top (/ (* (/ (x-display-pixel-height) 100) 10)
			   (frame-char-height))))

(add-to-list 'initial-frame-alist
	     (cons 'left (/ (* (/ (x-display-pixel-width) 100) 10)
			     (frame-char-width))))


;;;  Decore setting:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(setq inhibit-startup-screen  t
      initial-buffer-choice   t)

(setq inhibit-splash-screen   t)
(setq use-dialog-box        nil)

(column-number-mode)
(display-time-mode)
(scroll-bar-mode             -1)
(show-paren-mode)
(size-indication-mode)
(tool-bar-mode               -1)
(tooltip-mode                -1)
(menu-bar-mode               -1)


;;;  Indents setting:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(fringe-mode '(8 . 0))
(setq-default line-spacing 1)


;;;  Opacity setting:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(set-frame-parameter  (selected-frame)         'alpha   '(83 . 95))
(add-to-list          'default-frame-alist     '(alpha . (83 . 95)))


;;;  Dashboard setting:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(require 'dashboard)
(dashboard-setup-startup-hook)

(setq dashboard-banner-logo-title "Welcome to GNU Emacs, commander!")
(setq dashboard-init-info                               "Dashboard:")
(setq dashboard-set-init-info                                      t)
(setq dashboard-set-footer                                         t)
(setq dashboard-footer-messages          '("Shut up and hack, bro!"))
(setq dashboard-show-shortcuts                                   nil)
(setq dashboard-center-content                                     t)

(setq dashboard-items '((bookmarks  .   10)
                        (recents .      10)
                        (projects .     10)
                        (agenda .       10)
                        (registers .    10)))

(setq dashboard-set-heading-icons      t)     ;freezing on win...
(setq dashboard-set-file-icons         t)     ;freezing on win...

(setq dashboard-set-navigator           t)
(setq dashboard-set-init-info           t)

(add-to-list 'dashboard-items '(agenda) t)
(setq show-week-agenda-p                t)


;;;  Treemacs setting:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(treemacs)
(treemacs-resize-icons 32)


;;;  Mode-line theme:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(require 'telephone-line)


(setq telephone-line-lhs
      '((evil   . (telephone-line-evil-tag-segment))
        (accent . (telephone-line-vc-segment
                   telephone-line-erc-modified-channels-segment
                   telephone-line-process-segment))
        (nil    . (telephone-line-minor-mode-segment
                   telephone-line-buffer-segment))))

(setq telephone-line-rhs
      '((nil    . (telephone-line-misc-info-segment))
        (accent . (telephone-line-major-mode-segment))
        (evil   . (telephone-line-airline-position-segment))))


(telephone-line-mode t)


;;;  Themes:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(require    'kaolin-themes)
(load-theme 'kaolin-dark t)
(kaolin-treemacs-theme)        ;freezing on win...

(use-package kaolin-themes
  :config
  (load-theme 'kaolin-dark t)
  (kaolin-treemacs-theme))     ;freezing on win...


;;;  END  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(provide 'theme-gui)
