; Package
(add-to-list 'custom-theme-load-path "~/.config/.emacs.d/themes/")
(load-theme 'zenburn t)
(custom-set-variables
 '(gnutls-algorithm-priority "normal:-vers-tls1.3")
 '(package-selected-packages '(smex)))

(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

(setq package-check-signature nil)
(setq inhibit-startup-screen t)

(ido-mode 1)
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(show-paren-mode 1)

(global-set-key (kbd "M-x") 'smex)

(add-to-list 'default-frame-alist '(font . "Ubuntu Mono-18"))
