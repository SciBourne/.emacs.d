;;
;; User packages
;;


(require 'cl)
(require 'package)


;; Package list:
(setq cfg-var:packages '(use-package

			 ;for themes:
			 kaolin-themes
			 all-the-icons
			 dashboard
			 treemacs
			 treemacs-projectile
			 treemacs-icons-dired
			 telephone-line
			 svg-mode-line-themes

			 ;for programming:
			 highlight-indent-guides
			 highlight-parentheses
			 highlight-numbers
			 highlight
			 auto-complete
			 scroll-on-drag
			 projectile
			 company
			 swiper
			 slime
			 elpy
			 magit
			 live-preview
			 multiple-cursors
			 pyenv-mode-auto
			 pyenv-mode
			 smartparens
			 py-autopep8
			 flycheck))


;; Installing packages if someone else is not installed:
(defun cfg:install-packages ()
  (let ((pkgs (remove-if #'package-installed-p cfg-var:packages)))
    (when pkgs
      (message "%s" "Emacs is now refreshing its package database...")
      (package-refresh-contents)
      (message "%s" " done.")
      (dolist (p cfg-var:packages)
        (package-install p)))))


;; Repositories:
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu" .   "https://elpa.gnu.org/packages/")     t)
(add-to-list 'package-archives '("org" .   "http://orgmode.org/elpa/")           t)


(package-initialize)
(cfg:install-packages)


(provide 'packages)
