;;;
;;; GNU Emacs configuration file: init.el
;;;
;;; Author: SciBourne
;;;

(package-initialize)



(cl-defun load-local-packages (&key sub-dir packages)
  (cl-loop for package-name in packages
	   do (load

	       (expand-file-name
		(concat package-name ".el")

		(expand-file-name
		 package-name

		 (expand-file-name
		  sub-dir
		  user-emacs-directory))))))


(cl-defmacro load-org-config (&key sub-dir
				   user-utils
				   install-packages
				   common-settings
				   keybindings
				   user-interface
				   lang-modes)

  (cl-labels ((path-to (file-name)
		       (expand-file-name (concat file-name ".org")
					 (expand-file-name sub-dir user-emacs-directory)))
	      (ui-mode (file-names)
		       (let ((mode (if (display-graphic-p) "gui" "tty")))
			 (cl-remove-if-not (lambda (file-name)
					     (cl-search mode file-name))
			 		   file-names)))
	      (load-conf (path)
			 (condition-case error-msg
			     (progn (org-babel-load-file path)
				    (message " [ OK ]  Load file: %s" path))
			   (error (message " [ ER ]  Cannot load file %s: %s" path error-msg)))))

    (let ((file-names `(,user-utils
			,install-packages
			,common-settings
			,keybindings
			,@lang-modes
			,@(ui-mode user-interface))))

      (cl-loop for file-name in file-names
	       do (load-conf (path-to file-name))))))



(load-local-packages :sub-dir   "packages"
		     :packages  '("gas-mode"))



(load-org-config :sub-dir            "config"

		 :user-utils         "utils"
		 :install-packages   "packages"
		 :common-settings    "common"
		 :keybindings        "keybindings"

		 :user-interface    ("theme-gui"
				     "theme-tty")

		 :lang-modes        ("common-lisp-language"
				     "assembler-language"
				     "rust-language"
				     "python-language"))
