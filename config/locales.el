;;;;
;;;; User locales
;;;;


;;; Input method:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(set-input-method "russian-computer")


;;;  Coding systems:  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(setq locale-coding-system    'utf-8)
(set-language-environment     'Russian)
(set-default-coding-systems   'utf-8)
(set-terminal-coding-system   'utf-8)
(prefer-coding-system         'utf-8)


;;;  END  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(provide 'locales)
