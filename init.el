;;;
;;; GNU Emacs configuration file: init.el
;;;
;;; Author: SciBourne
;;;

(package-initialize)



(cl-defmacro load-org-config (&key sub-dir
				   user-utils
				   install-packages
				   common-settings
				   keybindings
				   user-interface
				   lang-modes)

  (cl-labels ((path-to (file-name)
		       (expand-file-name file-name
					 (expand-file-name sub-dir
							   user-emacs-directory)))
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




(load-org-config :sub-dir            "config"

		 :user-utils         "utils"
		 :install-packages   "packages.org"
		 :common-settings    "common.org"
		 :keybindings        "keybindings.org"

		 :user-interface    ("theme-gui.org"
				     "theme-tty.org")

		 :lang-modes        ("common-lisp-language.org"
				     "python-language.org"))
