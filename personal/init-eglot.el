;;; init-eglot.el --- Eglot

;;; Commentary:
;;

;;; Code:
(unless (package-installed-p 'eglot)
  (use-package eglot))

(use-package consult-eglot)

(add-hook 'c-mode-hook #'eglot-ensure)
(add-hook 'c++-mode-hook #'eglot-ensure)
(add-hook 'python-mode-hook #'eglot-ensure)
(add-hook 'c-ts-mode-hook #'eglot-ensure)
(add-hook 'c++-ts-mode-hook #'eglot-ensure)
(add-hook 'python-ts-mode-hook #'eglot-ensure)

(use-package flycheck-eglot
  :ensure t
  :after (flycheck eglot)
  :config
  (global-flycheck-eglot-mode 1))

(provide 'init-eglot)

;;; init-eglot.el ends here
