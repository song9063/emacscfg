;; ____________________________________________________________________________
;; Aquamacs custom-file warning:
;; Warning: After loading this .emacs file, Aquamacs will also load
;; customizations from `custom-file' (customizations.el). Any settings there
;; will override those made here.
;; Consider moving your startup settings to the Preferences.el file, which
;; is loaded after `custom-file':
;; ~/Library/Preferences/Aquamacs Emacs/Preferences
;; _____________________________________________________________________________
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files '("~/Documents/emacs/orgmode/commands.org"))
 '(package-selected-packages
   '(flycheck elpy yaml yaml-mode f editorconfig yasnippet devdocs eglot gnu-elpa-keyring-update auctex tramp go-mode company neotree zenburn-theme)))
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

;; Python
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
(custom-set-variables
 '(flycheck-python-flake8-executable "python3")
 '(flycheck-python-pycompile-executable "python3")
 '(flycheck-python-pylint-executable "python3")
 )

;; buffer
(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive)
  (revert-buffer :ignore-auto :noconfirm))

;; Theme
(load-theme 'zenburn t)

;; UI
(tool-bar-mode -1)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(set-frame-parameter (selected-frame) 'alpha '(95 . 80))
(add-to-list 'default-frame-alist '(alpha . (95 . 80)))


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

(setq imenu-list-position 'right)
;;(setq imenu-list-size 30)

(setq image-types (cons 'svg image-types))

(add-hook 'LaTeX-mode-hook
      (lambda ()
        (setq indent-tabs-mode t
              indent-line-function 'tab-to-tab-stop
              tab-width 4
              electric-indent-mode nil)))


;; Shortcuts
(defun other-window-backward ()
  "Move to previous window"
  (interactive)
  (other-window -1))
(global-set-key (kbd "\C-x p") 'other-window-backward)


;;frame size
;(add-to-list 'default-frame-alist '(height . 80))
;(add-to-list 'default-frame-alist '(width . 120))
;(set-frame-position (selected-frame) 50 0)

(require 'yasnippet)
(yas-global-mode 1)
(setq yas-snippet-dirs '("~/.emacs.d/plugins/snippets"))
(yas-reload-all)
(add-hook 'LaTeX-mode-hook #'yas-minor-mode)

;; Org mode
(transient-mark-mode 1)

(require 'org)
(setq org-todo-keywords
      '((sequence "TODO" "IN-PREGRESS" "WAITING" "DONE")))

;; ssh
;; C-x C-f /ssh:user@host#port:/path/to/file
