2;;
;; User packages for decoration, settings and color theme (tty)
;;


;; Font:
(set-default-font "Terminus 12")


;; Decore setting:
(setq inhibit-startup-screen t    ;Hide *scratch* buffer
      initial-buffer-choice  t)   ;when start

(setq inhibit-splash-screen t)
(setq use-dialog-box      nil)

(column-number-mode)
(display-time-mode)
(show-paren-mode)
(size-indication-mode)
(tool-bar-mode             -1)
(tooltip-mode              -1)
(menu-bar-mode             -1)


;; Mode-line theme:
(telephone-line-mode)


;; Dashboard setting:
(require 'dashboard)

(dashboard-setup-startup-hook)

(setq dashboard-init-info                               "Dashboard:")
(setq dashboard-set-init-info                                      t)
(setq dashboard-set-footer                                         t)
(setq dashboard-footer-messages          '("Shut up and hack, bro!"))
(setq dashboard-footer-icon                                      ">")
(setq dashboard-show-shortcuts                                   nil)
(setq dashboard-center-content                                     t)

(setq dashboard-items '((recents  .     20)
                        (bookmarks .    5)
                        (projects .     5)
                        (agenda .       5)
                        (registers .    5)))


(setq dashboard-set-navigator           t)
(setq dashboard-set-init-info           t)

(add-to-list 'dashboard-items '(agenda) t)
(setq show-week-agenda-p                t)


;; Theme:
(require    'kaolin-themes)
(load-theme 'kaolin-dark t)


(provide 'theme-tty)
