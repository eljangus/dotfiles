;;; -*- lexical-binding: t; -*-

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(setq use-package-always-ensure t)

(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file 'noerror)

(use-package autothemer)

(setq custom-theme-directory "~/.config/emacs/themes")

(use-package emacs
  :ensure nil
  :custom
  (inhibit-startup-screen t)
  (ring-bell-function #'ignore)
  (use-short-answers t)
  (backup-directory-alist `(("." . ,(locate-user-emacs-file "backups"))))
  (auto-save-file-name-transforms
   `((".*" ,(locate-user-emacs-file "auto-save/") t)))
  (create-lockfiles nil)
  (indent-tabs-mode nil)
  (tab-always-indent 'complete)
  (display-line-numbers-type 'relative)
  :config
  (make-directory (locate-user-emacs-file "auto-save/") t)
  (load-theme 'oxocarbon t)
  (delete-selection-mode 1)
  (electric-pair-mode 1)
  (global-auto-revert-mode 1)
  (recentf-mode 1)
  (savehist-mode 1)
  (save-place-mode 1)
  (which-key-mode 1)
  :hook
  (activate-mark-hook . (lambda () (hl-line-mode -1)))
  (deactivate-mark-hook . (lambda () (hl-line-mode +1)))
  (prog-mode . (lambda () (hl-line-mode +1)))
  (prog-mode . display-line-numbers-mode))


;; keybind cheatsheet
(defun open-keys ()
  (interactive)
  (find-file (locate-user-emacs-file "keys.org")))
(keymap-global-set "C-c k" #'open-keys)

;; completion
(use-package vertico
  :init (vertico-mode 1))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion)))))

(use-package marginalia
  :init (marginalia-mode 1))

(use-package consult
  :bind (("C-x b" . consult-buffer)
         ("M-y"   . consult-yank-pop)
         ("M-g g" . consult-goto-line)
         ("M-g i" . consult-imenu)
         ("M-g e" . consult-flymake)
         ("M-s l" . consult-line)
         ("M-s r" . consult-ripgrep)
         ("M-s f" . consult-fd)))

(use-package corfu
  :custom
  (corfu-auto t)
  (corfu-auto-prefix 2)
  (corfu-cycle t)            ; wrap around at the end of the list
  (corfu-preselect 'first)   ; first candidate selected, C-<return> takes it
  :bind (:map corfu-map
              ;; TAB-and-Go: TAB/S-TAB cycle, the selection is inserted as you go
              ("TAB"       . corfu-next)
              ("<tab>"     . corfu-next)
              ("S-TAB"     . corfu-previous)
              ("<backtab>" . corfu-previous)
              ("<escape>"  . corfu-quit)
              ("C-<return>" . corfu-insert) ; keep the TAB'd candidate, then close
              ("RET" . nil)
              ;; keep C-n/C-p/C-a/C-e as normal movement while the popup is open
              ([remap next-line]              . nil)
              ([remap previous-line]          . nil)
              ([remap move-beginning-of-line] . nil)
              ([remap move-end-of-line]       . nil))
  :init (global-corfu-mode 1))

;; actions on whatever is at point / in the minibuffer
(use-package embark
  :bind (("C-." . embark-act)
         ("C-;" . embark-dwim)
         ("C-h B" . embark-bindings)))

;; export consult-ripgrep results to a grep buffer (e to edit, built in since 31)
(use-package embark-consult
  :after (embark consult)
  :hook (embark-collect-mode . consult-preview-at-point-mode))

;; tree-sitter, grammars get installed on first use
(setq treesit-auto-install-grammar 'always)
(setopt treesit-enabled-modes t)        ; needs setopt, not setq

(add-to-list 'auto-mode-alist '("\\.lua\\'" . lua-ts-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode))

;; not autoloaded
(use-package markdown-ts-mode
  :ensure nil
  :mode "\\.md\\'")

;; lsp: pyright, typescript-language-server, lua-language-server, qmlls
;; (qmlls6 on arch; brew's qt ships plain qmlls, outside a gui emacs' PATH)
(use-package eglot
  :ensure nil
  :bind (:map eglot-mode-map
         ("C-c f" . eglot-format-buffer))
  :hook ((python-ts-mode
          js-ts-mode
          typescript-ts-mode
          tsx-ts-mode
          lua-ts-mode
          qml-ts-mode)
         . eglot-ensure)
  :config
  (add-to-list 'eglot-server-programs
               `(qml-ts-mode . (,(if (eq system-type 'darwin)
                                     (expand-file-name
                                      "opt/qt/bin/qmlls"
                                      (if (file-directory-p "/opt/homebrew")
                                          "/opt/homebrew"
                                        "/usr/local"))
                                   "qmlls6")))))

(use-package qml-ts-mode
  :vc (:url "https://github.com/xhcoding/qml-ts-mode" :rev :newest)
  :mode "\\.qml\\'"
  :init
  (add-to-list 'treesit-language-source-alist
               '(qmljs "https://github.com/yuja/tree-sitter-qmljs"))
  :config
  (treesit-ensure-installed 'qmljs))

(use-package kdl-mode)
(use-package fish-mode)

(use-package dired
  :ensure nil
  :custom
  (dired-listing-switches "-alh --group-directories-first")
  (dired-dwim-target t)                 ; copy/move to the other dired window
  (dired-kill-when-opening-new-dired-buffer t)
  (delete-by-moving-to-trash t))

(use-package eat
  :bind (("C-c t" . eat)
         :map project-prefix-map
         ("t" . eat-project)))

(use-package envrc
  :hook (after-init . envrc-global-mode))

(use-package magit)

;; discord rich presence
(use-package elcord
  :config
  (if (not (daemonp))
      (elcord-mode)
    ;; daemon: only show presence while a client frame is open
    (add-hook 'server-after-make-frame-hook
              (lambda () (unless elcord-mode (elcord-mode +1))))
    (add-hook 'delete-frame-functions
              (lambda (frame)
                (unless (seq-some (lambda (f) (and (not (eq f frame))
                                                   (frame-parameter f 'client)))
                                  (frame-list))
                  (elcord-mode -1))))))

(use-package org
:ensure nil
  :custom
  (org-directory "~/org")
  (org-agenda-files '("~/org"))
  (org-default-notes-file "~/org/inbox.org")
  (org-startup-indented t)
  (org-hide-emphasis-markers t)
  (org-log-done 'time)
  (org-capture-templates
   '(("t" "Todo" entry (file "inbox.org") "* TODO %?\n%U\n")
     ("n" "Note" entry (file "inbox.org") "* %?\n%U\n")))
  :bind (("C-c a" . org-agenda)
         ("C-c c" . org-capture)
         ("C-c l" . org-store-link))
  :hook (org-mode . visual-line-mode))

(use-package nerd-icons
  :ensure t)

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))


(setq dashboard-show-shortcuts nil)
(setq dashboard-center-content t)
(setq dashboard-vertically-center-content t)
(setq initial-buffer-choice 'dashboard-open)
(setq dashboard-items '((recents   . 5)
                        (bookmarks . 5)
                        (projects  . 5)
                        (agenda    . 5)))

(setq dashboard-item-shortcuts '((recents   . "r")
                                 (bookmarks . "m")
                                 (projects  . "p")
                                 (agenda    . "a")
                                 (registers . "e")))

(setq dashboard-item-names '(("Recent Files:"               . "Recently opened files:")
                             ("Agenda for today:"           . "Today's agenda:")
                             ("Agenda for the coming week:" . "Agenda:")))

(setq dashboard-display-icons-p t)     ; display icons on both GUI and terminal
(setq dashboard-icon-type 'nerd-icons) ; use `nerd-icons' package
(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)

;; paths: show the file name, with a shortened path next to it
(setq dashboard-path-style 'truncate-beginning)
(setq dashboard-path-max-length 40)
(setq dashboard-recentf-show-base 'align)
(setq dashboard-projects-show-base 'align)

;; bookmarks: the name is descriptive enough, drop the path
(setq dashboard-bookmarks-item-format "%s")

;; agenda: no padded "inbox:" category, short date
(setq dashboard-agenda-prefix-format " %i %s ")
(setq dashboard-agenda-time-string-format "%a %d %b")

;; purple Emacs logo (system SVG, scales cleanly)
(setq dashboard-startup-banner "/usr/share/icons/hicolor/scalable/apps/emacs.svg")
;; the SVG is 48px natively and max-height only shrinks, so set :height directly
(setq dashboard-image-extra-props '(:height 250))
;; no footer quote (`dashboard-set-footer' is obsolete)
(setq dashboard-startupify-list
      (delq 'dashboard-insert-footer dashboard-startupify-list))

(dashboard-modify-heading-icons '((recents   . "nf-oct-file")
                                  (bookmarks . "nf-oct-book")
                                  (projects  . "nf-oct-project_roadmap")
                                  (agenda    . "nf-oct-log")
                                  (registers . "nf-oct-quote")))

(add-hook 'before-save-hook #'eglot-format)
