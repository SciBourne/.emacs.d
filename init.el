;;
;; GNU Emacs initialization file
;;


;; System-type definition
(defun system-is-linux()
  (string-equal system-type "gnu/linux"))
(defun system-is-windows()
  (string-equal system-type "windows-nt"))


(add-to-list 'load-path (expand-file-name "config" user-emacs-directory))

(require 'packages)
(require 'extensions)
(require 'locales)
(require 'keybinding)
(require 'common-lisp-language)
(require 'python-language)
(require 'aliases)
(require 'irc)

(cond ((display-graphic-p)
       (require 'theme-gui))
      ((require 'theme-tty)))




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (deferred scrollkeeper scroll-on-drag fast-scroll expand-region pyenv-mode-auto py-autopep8 sublimity ipython-shell-send pyenv-mode flycheck smooth-scroll smooth-scrolling smartparens multiple-cursors xpm use-package treemacs-projectile treemacs-icons-dired telephone-line swiper svg-mode-line-themes slime rich-minority powerline mode-icons kaolin-themes irony highlight-indent-guides git-commit dashboard company-c-headers auto-complete arduino-mode all-the-icons)))
 '(rcirc-bright-nicks (quote ("wiselord" "ax-hack"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#18181B" :foreground "AntiqueWhite1" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 102 :width normal :foundry "outline" :family "Courier New"))))
 '(cursor ((t (:background "LemonChiffon1"))))
 '(rcirc-my-nick ((t (:foreground "medium aquamarine"))))
 '(rcirc-nick-in-message-full-line (quote ((t (:foreground "light blue" :weight bold)))))
 '(rcirc-other-nick ((t (:foreground "antique white"))))
 '(rcirc-server ((t (:foreground "slate gray"))))
 '(rcirc-timestamp ((t (:inherit default :foreground "sky blue")))))
;(set-face-foreground font-lock-variable-name "green")
