;;; -*- lexical-binding: t; -*-

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(setq use-package-always-ensure t)

(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file 'noerror)
(setq native-comp-async-report-warnings-errors 'silent)

(setq custom-theme-directory (locate-user-emacs-file "themes"))

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
  (tab-bar-show nil)
  :config
  (make-directory (locate-user-emacs-file "auto-save/") t)
  ; (load-theme 'molokai t) ; comment out if using doom-themes or base16
  (delete-selection-mode 1)
  (electric-pair-mode 1)
  (global-auto-revert-mode 1)
  (recentf-mode 1)
  (savehist-mode 1)
  (save-place-mode 1)
  (which-key-mode 1)
  :hook
  (activate-mark-hook . (lambda () (hl-line-mode -1)))
  (deactivate-mark-hook . (lambda () (when (derived-mode-p 'prog-mode) (hl-line-mode +1))))
  (prog-mode . (lambda () (hl-line-mode +1)))
  (prog-mode . display-line-numbers-mode))

(use-package doom-themes
  :ensure t
  :custom
  ;; Global settings (defaults)
  (doom-themes-enable-bold t)   ; if nil, bold is universally disabled
  (doom-themes-enable-italic t) ; if nil, italics is universally disabled
  ;; for treemacs users
  (doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  :config
  ;(load-theme 'doom-horizon t)

  ;; Enable flashing mode-line on errors
  ;(doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (nerd-icons must be installed!)
  ;(doom-themes-neotree-config)
  ;; or for treemacs users
  ;(doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(use-package base16-theme
  :ensure t
  :config
  (load-theme 'base16-oxocarbon-dark t)
  ;; base16 underlines widget-button, which the dashboard items inherit
  (set-face-attribute 'widget-button nil :underline nil))

;; make sure the font stays consistent
(set-face-attribute 'fixed-pitch nil :family 'unspecified :inherit 'default)
(set-face-attribute 'fixed-pitch-serif nil :family 'unspecified :inherit 'default)
(set-face-attribute 'variable-pitch nil :family 'unspecified :inherit 'default)

;; set cursor type
(setq-default cursor-type 'box)

;; font ligatures
(use-package ligature
  :config
  (ligature-set-ligatures
   'prog-mode
   '("<---" "<--" "<<-" "<-" "->" "-->" "--->" "<->" "<-->" "<--->" "<!--"
     "<==" "<===" "<=" "=>" "=>>" "==>" "===>" ">=" "<=>" "<==>" "<===>"
     "==" "===" "!=" "!==" "=/=" "=!=" "|=" "||" "&&" "::" ":::" "::="
     ":=" "=:" "..." ".." ".=" "..<" "?." "??" "?:" "//" "///" "/*" "*/"
     "/=" "++" "+++" "--" "---" "<<" ">>" "<<<" ">>>" "<<=" ">>=" "|>" "<|"
     "<|>" "<>" "</" "/>" "</>" "#{" "#[" "#(" "#!" "##" "###" "__" "~~"
     "~>" "<~" "~-" "-~" "~=" "%%"))
  (global-ligature-mode 1))

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
  (global-corfu-modes '((not org-mode) t)) ; no popup in org buffers
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

;; tree-sitter, grammars get installed on first use
(setq treesit-auto-install-grammar 'always)
(setopt treesit-enabled-modes t)        ; needs setopt, not setq

;; not autoloaded
(use-package markdown-ts-mode
  :ensure nil
  :mode "\\.md\\'")

;; lsp: clangd, pyright, typescript-language-server, lua-language-server, qmlls6
(use-package eglot
  :ensure nil
  :bind (:map eglot-mode-map
         ("C-c f" . eglot-format-buffer))
  :hook ((c-ts-mode
          c++-ts-mode
          python-ts-mode
          js-ts-mode
          typescript-ts-mode
          tsx-ts-mode
          lua-ts-mode
          qml-ts-mode)
         . eglot-ensure)
  ;; format on save, only where a server is running
  (eglot-managed-mode . (lambda ()
                          (if (eglot-managed-p)
                              (add-hook 'before-save-hook #'eglot-format-buffer nil t)
                            (remove-hook 'before-save-hook #'eglot-format-buffer t))))
  :config
  (add-to-list 'eglot-server-programs
               '(qml-ts-mode . ("qmlls6"))))

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
  (org-default-notes-file "~/org/inbox.org")
  (org-startup-indented t)
  (org-hide-emphasis-markers t)
  (org-log-done 'time)
  (org-capture-templates
   '(("t" "Todo" entry (file "inbox.org") "* TODO %?\n%U\n")
     ("n" "Note" entry (file "inbox.org") "* %?\n%U\n")
     ("u" "Uni")
     ("ue" "Eingang" entry (file+headline "~/Uni/aufgaben.org" "Eingang")
      "** %?\n   %U")
     ("ua" "Abgabe" entry (file+headline "~/Uni/aufgaben.org" "Abgaben")
      "** TODO %?\n   DEADLINE: %^t")
     ("uk" "Klausur" entry (file+headline "~/Uni/aufgaben.org" "Klausuren")
      "** %? :klausur:\n   %^T")))
  (org-refile-targets '((org-agenda-files :maxlevel . 2)))
  (org-refile-use-outline-path 'file)
  (org-outline-path-complete-in-steps nil)
  (org-startup-with-latex-preview t)
  :bind (("C-c a" . org-agenda)
         ("C-c c" . org-capture)
         ("C-c l" . org-store-link))
  :hook (org-mode . visual-line-mode)
  :config
  (require 'org-tempo)                  ; <s TAB, <q TAB, …
  ;; ~/org plus Uni tasks and every module's notizen.org,
  ;; rescanned before each agenda call so new modules show up
  (defun uni/refresh-agenda-files (&rest _)
    (setq org-agenda-files
          (seq-filter #'file-exists-p
                      (append '("~/org" "~/Uni/aufgaben.org")
                              (when (file-directory-p "~/Uni/semester/")
                                (directory-files-recursively "~/Uni/semester/" "\\.org\\'"))))))
  (uni/refresh-agenda-files)
  (advice-add 'org-agenda :before #'uni/refresh-agenda-files)
  (org-babel-do-load-languages
   'org-babel-load-languages '((emacs-lisp . t) (python . t) (R . t)))
  ;; open PDF links in pdf-tools instead of the system viewer
  (add-to-list 'org-file-apps '("\\.pdf\\'" . emacs)))

(use-package nerd-icons)

(use-package dashboard
  :custom
  (initial-buffer-choice 'dashboard-open)
  (dashboard-show-shortcuts nil)
  (dashboard-center-content t)
  (dashboard-items '((recents   . 5)
                     (bookmarks . 5)
                     (projects  . 5)
                     (agenda    . 5)))
  (dashboard-item-shortcuts '((recents   . "r")
                              (bookmarks . "m")
                              (projects  . "p")
                              (agenda    . "a")
                              (registers . "e")))
  (dashboard-item-names '(("Recent Files:"               . "Recently opened files:")
                          ("Agenda for today:"           . "Today's agenda:")
                          ("Agenda for the coming week:" . "Agenda:")))
  (dashboard-display-icons-p t)         ; display icons on both GUI and terminal
  (dashboard-icon-type 'nerd-icons)     ; use `nerd-icons' package
  (dashboard-set-heading-icons t)
  (dashboard-set-file-icons t)
  ;; paths: show the file name, with a shortened path next to it
  (dashboard-path-style 'truncate-beginning)
  (dashboard-path-max-length 40)
  (dashboard-recentf-show-base 'align)
  (dashboard-projects-show-base 'align)
  ;; bookmarks: the name is descriptive enough, drop the path
  (dashboard-bookmarks-item-format "%s")
  ;; agenda: no padded "inbox:" category, short date
  (dashboard-agenda-prefix-format " %i %s ")
  (dashboard-agenda-time-string-format "%a %d %b")
  ;; purple Emacs logo (system SVG, scales cleanly)
  (dashboard-startup-banner "/usr/share/icons/hicolor/scalable/apps/emacs.svg")
  ;; the SVG is 48px natively and max-height only shrinks, so set :height directly
  (dashboard-image-extra-props '(:height 250))
  :config
  ;; no footer quote (`dashboard-set-footer' is obsolete)
  (setq dashboard-startupify-list
        (delq 'dashboard-insert-footer dashboard-startupify-list))
  (dashboard-modify-heading-icons '((recents   . "nf-oct-file")
                                    (bookmarks . "nf-oct-book")
                                    (projects  . "nf-oct-project_roadmap")
                                    (agenda    . "nf-oct-log")
                                    (registers . "nf-oct-quote")))
  (dashboard-setup-startup-hook))

(use-package indent-bars
  :custom
  (indent-bars-display-on-blank-lines t)
  :hook
  (prog-mode . indent-bars-mode))

(use-package pdf-tools
  :config
  (pdf-loader-install))

;; align org tables by displayed pixel width, so hidden =markup= and
;; fallback glyphs (arrows etc.) don't leave the right edge ragged.
;; git, not ELPA: needs the folded-table fix (valign#36)
(use-package valign
  :vc (:url "https://github.com/casouri/valign" :rev :newest)
  :hook (org-mode . valign-mode))

;; pdf: link type for org-store-link, so links point at the current page
(use-package org-pdftools
  :hook (org-mode . org-pdftools-setup-link))
