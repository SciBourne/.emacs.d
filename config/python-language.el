;;
;; Setting for Python:
;;


(require 'elpy)

(setq python-shell-interpreter "python3")
(setq python-shell-interpreter-args "-i")


;(highlight-phrase "Label")
;(highlight-regexp "window")

;; Hooks:
(add-hook 'python-mode-hook 'elpy-enable)
(add-hook 'elpy-mode-hook 'highlight-numbers-mode)
(add-hook 'elpy-mode-hook 'highlight-parentheses-mode)
(add-hook 'elpy-mode-hook 'smartparens-mode)


(provide 'python-language)
