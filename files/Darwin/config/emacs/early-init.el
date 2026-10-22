;;; -*- lexical-binding: t; -*-

;; less gc during startup
(setq gc-cons-threshold most-positive-fixnum)
(add-hook 'emacs-startup-hook
          (lambda () (setq gc-cons-threshold (* 32 1024 1024))))

;; macOS renders fonts too thick by default, disable font smoothing for emacs only:
;;   defaults write org.gnu.Emacs AppleFontSmoothing -int 0   (then restart emacs / the daemon)
;;   undo: defaults delete org.gnu.Emacs AppleFontSmoothing
(push '(font . "JetBrainsMono Nerd Font Mono-14") default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(setq menu-bar-mode nil
      tool-bar-mode nil)
