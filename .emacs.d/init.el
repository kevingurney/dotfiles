;; Automatic installation of use-package inspired by:
;; https://github.com/CachesToCaches/getting_started_with_use_package

;; Require package.el.
(require 'package)
(setq package-enable-at-startup nil)
(package-initialize)

;; Configure Emacs Lisp package archives.

;; Enable the GNU Emacs Lisp Package Archive (ELPA).
(add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/"))
;; Enable Milkypostman's Emacs Lisp Package Archive (MELPA).
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; Automatically install use-package for Emacs Lisp package management.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(setq use-package-always-ensure t)

;; Install the gruvbox color theme.
(use-package gruvbox-theme)

;; Load the gruvbox-dark-hard color theme after initialization.
(add-hook 'after-init-hook (lambda()
			     (load-theme 'gruvbox-dark-hard)))

;; Save customizations in a separate custom.el file.
;; Inspired by:
;; http://emacsblog.org/2008/12/06/quick-tip-detaching-the-custom-file/
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;; Disable the tool bar.
(tool-bar-mode -1)
;; Disable the menu bar.
(menu-bar-mode -1)
;; Disable the scroll bar.
(scroll-bar-mode -1)
