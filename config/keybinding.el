;;
;; User keybinging
;;


;; For multiple-cursors-mode:
(global-set-key (kbd "C-c C-,") 'mc/edit-lines)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


(provide 'keybinding)
