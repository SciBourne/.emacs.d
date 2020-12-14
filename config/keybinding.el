;;
;; User keybinging
;;


;; hi-lock-mode:
(if (functionp 'global-hi-lock-mode)
            (global-hi-lock-mode 1)
          (hi-lock-mode 1))


;; For multiple-cursors-mode:
(global-set-key [M-S-mouse-3] 'mc/mark-all-symbols-like-this-in-defun)
(global-set-key [M-S-mouse-2] 'mc/mark-all-symbols-like-this)
(global-set-key [M-S-mouse-1] 'mc/add-cursor-on-click)
(global-set-key (kbd "M--") 'mc/mark-next-like-this)


;; Pythom mode:
(global-set-key (kbd "M-.") 'jedi:goto-definition)
(global-set-key (kbd "M-,") 'jedi:goto-definition-pop-marker)
(global-set-key (kbd "M-/") 'jedi:show-doc)
(global-set-key (kbd "M-?") 'helm-jedi-related-names)
(global-set-key
 (kbd "C-c f") (lambda ()
		 (interactive)
		 (shell-command (concat "C:/ProgramData/Miniconda3/python.exe " "\"" buffer-file-name "\""))))


;; Scrolling:
(global-set-key
  [down-mouse-2]
  (lambda ()
    (interactive)
    (unless (scroll-on-drag)
      (mouse-yank-primary t))))


(provide 'keybinding)
