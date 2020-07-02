;;
;; User setting for RCIRC client
;;


;; Rcirc package setting:
(setq rcirc-server-alist

      '(("irc.freenode.net"
	 :port 6697
	 :encryption tls
	 :channels
	 ("#lisp <#other-channel>")
	 :nick "<nick>"
	 :user-name "<User Name>"
	 :full-name "<Full Name>"
	 :password "<nick>:<password>")

	 ;for i2p:
	("localhost"
	 :port 6668
	 :channels ("#i2p-dev <#other-channel>")
	 :nick "<nick>")))


(provide 'irc)
