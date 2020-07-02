;;
;; User packages for decoration, settings and color theme (tty)
;;


;; Fringe setting:
(fringe-mode '(8 . 0))


;; Font:
(set-default-font "Terminus 12")


;; Decore setting:
(setq inhibit-startup-screen t    ;Hide *scratch* buffer
      initial-buffer-choice  t)   ;when start

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

;(setq dashboard-set-heading-icons      t)
;(setq dashboard-set-file-icons         t)

(setq dashboard-set-navigator           t)
(setq dashboard-set-init-info           t)

(add-to-list 'dashboard-items '(agenda) t)
(setq show-week-agenda-p                t)


;; Color theme (still in dev-stage):
(custom-set-faces
 '(default ((t (:foreground "DarkSeaGreen1"))))
 '(apropos-property ((t nil)))
 '(apropos-symbol ((t (:inherit bold))))
 '(c-annotation-face ((t (:inherit font-lock-constant-face))))
 '(dired-mark ((t nil)))
 '(dired-marked ((t (:inherit warning))))
 '(font-lock-builtin-face ((t (:foreground "light sky blue"))))
 '(font-lock-comment-face ((t (:foreground "light goldenrod"))))
 '(font-lock-doc-face ((t (:inherit font-lock-string-face :foreground "antique white"))))
 '(font-lock-function-name-face ((t (:foreground "cornflower blue"))))
 '(font-lock-negation-char-face ((t (:foreground "aquamarine"))))
 '(font-lock-preprocessor-face ((t (:foreground "sky blue"))))
 '(font-lock-string-face ((t (:foreground "yellow green"))))
 '(menu ((t (:inverse-video t))))
 '(mode-line ((t (:background "color-48" :foreground "color-236" :box (:line-width -1 :style released-button)))))
 '(mode-line-inactive ((t (:background "color-84" :foreground "color-242" :box (:line-width -1 :style released-button)))))
 '(package-status-external ((t (:inherit package-status-built-in))))
 '(package-status-held ((t (:inherit font-lock-constant-face))))
 '(rcirc-other-nick ((t (:foreground "pale green"))))
 '(rcirc-server ((t (:foreground "medium aquamarine"))))
 '(rcirc-timestamp ((t (:inherit default :foreground "light sky blue"))))
 '(rcirc-track-keyword ((t (:foreground "medium sea green" :weight bold))))
 '(rcirc-track-nick ((t (:foreground "green yellow"))))
 '(sgml-namespace ((t (:inherit font-lock-builtin-face))))
 '(tool-bar ((t (:background "old lace" :foreground "systembuttontext" :box (:line-width 1 :style released-button))))))


(provide 'theme-tty)
