(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(company neotree zenburn-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))

(add-to-list 'load-path "~/.emacs.d/plugins")
(require 'imenu-list)

;; Theme
(load-theme 'zenburn t)


;; neotree
(setq neo-smart-open t)
(defun neotree-startup ()
  (interactive)
  (neotree-show)
  (call-interactively 'other-window))

(if (daemonp)
    (add-hook 'server-switch-hook #'neotree-startup)
  (add-hook 'after-init-hook #'neotree-startup)
)


;; company mode
(add-hook 'after-init-hook 'global-company-mode)


;; imenu-list
(global-set-key (kbd "C-'") #'imenu-list-smart-toggle)
(setq imenu-list-auto-resize t)
