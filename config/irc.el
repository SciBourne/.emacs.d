;;;;
;;;; User setting for RCIRC client
;;;;


;;;  Rcirc package setting:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(setq rcirc-server-alist

      '(("irc.freenode.net"
	 :port 6697
	 :encryption tls
	 :channels
	 ("#lisp #emacs")
	 :nick "Jenkins"
	 :user-name "Leroy"
	 :full-name "Leroy Jenkins"
	 :password "VerySecretPassword")))


;;;  Bright niks:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(custom-set-variables
 '(rcirc-bright-nicks '("your-bro-1" "your-bro-2")))


;;;  Highlight nicks and server messages:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;; TODO: Rebuild color theme:
(custom-set-faces
 '(rcirc-my-nick                    ((t (:foreground "medium aquamarine"))))
 '(rcirc-nick-in-message-full-line '((t (:foreground "light blue"
					 :weight bold))))

 '(rcirc-other-nick                 ((t (:foreground "antique white"))))
 '(rcirc-server                     ((t (:foreground "slate gray"))))

 '(rcirc-timestamp                  ((t (:inherit default
					 :foreground "sky blue")))))


(put 'upcase-region 'disabled nil)


(custom-set-faces
 '(rcirc-my-nick                    ((t (:foreground "medium aquamarine"))))
 '(rcirc-nick-in-message-full-line '((t (:foreground "light blue"
					 :weight bold))))

 '(rcirc-other-nick                 ((t (:foreground "antique white"))))
 '(rcirc-server                     ((t (:foreground "slate gray"))))
 '(rcirc-timestamp                  ((t (:inherit default
					 :foreground "sky blue")))))


;;;  END  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(provide 'irc)
