;;; -*- lexical-binding: t; -*-

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(setq use-package-always-ensure t)

(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file 'noerror)

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
  (load-theme 'wombat t)
  (delete-selection-mode 1)
  (electric-pair-mode 1)
  (global-auto-revert-mode 1)
  (recentf-mode 1)
  (savehist-mode 1)
  (save-place-mode 1)
  (which-key-mode 1)
  :hook
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

;; lsp: pyright, typescript-language-server, lua-language-server, qmlls6
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
  (add-to-list 'eglot-server-programs '(qml-ts-mode . ("qmlls6"))))

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

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

(setq initial-buffer-choice 'dashboard-open)

(add-hook 'before-save-hook #'eglot-format)
