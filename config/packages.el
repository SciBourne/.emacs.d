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
			  auto-complete
			  projectile
			  company
			  swiper
			  slime
			  magit
			  live-preview
			  multiple-cursors
			  smartparens))


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
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("gnu" .   "https://elpa.gnu.org/packages/")     t)
(add-to-list 'package-archives '("org" .   "http://orgmode.org/elpa/")           t)


(package-initialize)
(cfg:install-packages)


(provide 'packages)
