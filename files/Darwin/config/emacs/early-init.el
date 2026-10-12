;;; -*- lexical-binding: t; -*-

;; less gc during startup
(setq gc-cons-threshold most-positive-fixnum)
(add-hook 'emacs-startup-hook
          (lambda () (setq gc-cons-threshold (* 32 1024 1024))))

(push '(font . "Iosevka Nerd Font-15") default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(setq menu-bar-mode nil
      tool-bar-mode nil)
