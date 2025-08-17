;;; editing-utils.el --- Editor Utilities

;;; Commentary:
;;

;;; Code:

(use-package symbol-overlay)

(dolist (hook '(prog-mode-hook yaml-mode-hook conf-mode-hook log-view-mode-hook))
  (add-hook hook 'symbol-overlay-mode))
(with-eval-after-load 'symbol-overlay
  (diminish 'symbol-overlay-mode)
  (define-key symbol-overlay-mode-map (kbd "M-i") 'symbol-overlay-put)
  (define-key symbol-overlay-mode-map (kbd "M-I") 'symbol-overlay-remove-all)
  (define-key symbol-overlay-mode-map (kbd "M-n") 'symbol-overlay-jump-next)
  (define-key symbol-overlay-mode-map (kbd "M-p") 'symbol-overlay-jump-prev))

(use-package multiple-cursors)
;; multiple-cursors
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-+") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(defun kill-back-to-indentation ()
  "Kill from point back to the first non-whitespace character on the line."
  (interactive)
  (let ((prev-pos (point)))
    (back-to-indentation)
    (kill-region (point) prev-pos)))

(global-set-key (kbd "C-M-<backspace>") 'kill-back-to-indentation)

(global-set-key (kbd "M-o") 'other-window)

(when (fboundp 'repeat-mode)
  (add-hook 'after-init-hook 'repeat-mode))



(provide 'editing-utils)

;;; editing-utils.el ends here
