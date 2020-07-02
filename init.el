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
(require 'common-lisp)
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
    (smartparens multiple-cursors xpm use-package treemacs-projectile treemacs-icons-dired telephone-line swiper svg-mode-line-themes slime rich-minority powerline mode-icons kaolin-themes irony highlight-indent-guides git-commit dashboard company-c-headers auto-complete arduino-mode all-the-icons))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
