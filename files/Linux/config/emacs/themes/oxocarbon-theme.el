;;; oxocarbon-theme.el --- IBM Carbon inspired dark theme -*- lexical-binding: t; -*-

;;; Commentary:
;; Port of nyoom-engineering/oxocarbon.nvim, styled for the packages in
;; init.el (vertico, corfu, consult, magit, org, dashboard, eat, …).
;; Plain `deftheme', no autothemer needed.

;;; Code:

(deftheme oxocarbon "Dark theme based on IBM Carbon (oxocarbon).")

(let* ((c '((class color) (min-colors 89)))
       ;; grays
       (bg       "#161616")             ; base00
       (bg-alt   "#1c1c1c")             ; code blocks, popups
       (base01   "#262626")             ; hl-line, mode-line
       (base02   "#393939")             ; selection
       (base03   "#525252")             ; line numbers, borders
       (gray     "#6f6f6f")             ; comments
       (gray2    "#8d8d8d")             ; docstrings, dim ui text
       (fg       "#dde1e6")             ; base04
       (base06   "#ffffff")
       ;; accents
       (teal     "#08bdba")             ; base07
       (cyan     "#3ddbd9")             ; base08
       (blue     "#78a9ff")             ; base09
       (magenta  "#ee5396")             ; base10
       (sky      "#33b1ff")             ; base11
       (pink     "#ff7eb6")             ; base12
       (green    "#42be65")             ; base13
       (purple   "#be95ff")             ; base14
       (light    "#82cfff")             ; base15
       (yellow   "#ffe97b")             ; terminal only
       ;; accents blended into bg, for diffs
       (green-bg   "#1d2f22") (green-bg+ "#23482e")
       (red-bg     "#361f29") (red-bg+   "#57283c")
       (blue-bg    "#252c39"))

  (custom-theme-set-faces
   'oxocarbon

;;;; base
   `(default ((,c (:foreground ,fg :background ,bg))))
   `(cursor ((,c (:background ,fg))))
   `(fringe ((,c (:background ,bg :foreground ,base03))))
   `(region ((,c (:background ,base02 :extend t))))
   `(secondary-selection ((,c (:background ,base01 :extend t))))
   `(highlight ((,c (:background ,base02))))
   `(hl-line ((,c (:background ,base01 :extend t))))
   `(shadow ((,c (:foreground ,gray))))
   `(link ((,c (:foreground ,sky :underline t))))
   `(link-visited ((,c (:foreground ,purple :underline t))))
   `(button ((,c (:foreground ,sky :underline t))))
   `(error ((,c (:foreground ,magenta :weight bold))))
   `(warning ((,c (:foreground ,purple :weight bold))))
   `(success ((,c (:foreground ,green :weight bold))))
   `(minibuffer-prompt ((,c (:foreground ,blue :weight bold))))
   `(vertical-border ((,c (:foreground ,base01))))
   `(window-divider ((,c (:foreground ,base01))))
   `(window-divider-first-pixel ((,c (:foreground ,base01))))
   `(window-divider-last-pixel ((,c (:foreground ,base01))))
   `(internal-border ((,c (:background ,bg))))
   `(child-frame-border ((,c (:background ,base02))))
   `(tooltip ((,c (:foreground ,fg :background ,base01))))
   `(trailing-whitespace ((,c (:background ,magenta))))
   `(escape-glyph ((,c (:foreground ,pink))))
   `(homoglyph ((,c (:foreground ,pink))))
   `(nobreak-space ((,c (:foreground ,gray :underline t))))
   `(header-line ((,c (:foreground ,fg :background ,base01))))
   `(help-key-binding ((,c (:foreground ,light :background ,base01
                            :box (:line-width (1 . -1) :color ,base02)))))
   `(widget-field ((,c (:background ,base01 :extend t))))
   `(completions-common-part ((,c (:foreground ,blue))))
   `(completions-first-difference ((,c (:foreground ,pink :weight bold))))
   `(completions-annotations ((,c (:foreground ,gray))))

;;;; line numbers
   `(line-number ((,c (:foreground ,base03 :background ,bg))))
   `(line-number-current-line ((,c (:foreground ,fg :background ,base01 :weight bold))))
   `(line-number-major-tick ((,c (:inherit line-number))))
   `(line-number-minor-tick ((,c (:inherit line-number))))

;;;; mode-line / tab-bar
   `(mode-line ((,c (:foreground ,fg :background ,base01
                     :box (:line-width 5 :color ,base01)))))
   `(mode-line-active ((,c (:inherit mode-line))))
   `(mode-line-inactive ((,c (:foreground ,gray :background ,bg
                              :box (:line-width 5 :color ,bg)))))
   `(mode-line-buffer-id ((,c (:foreground ,base06 :weight bold))))
   `(mode-line-emphasis ((,c (:foreground ,blue :weight bold))))
   `(mode-line-highlight ((,c (:foreground ,pink))))
   `(tab-bar ((,c (:foreground ,gray :background ,bg))))
   `(tab-bar-tab ((,c (:foreground ,fg :background ,base01 :weight bold
                       :box (:line-width 4 :color ,base01)))))
   `(tab-bar-tab-inactive ((,c (:foreground ,gray :background ,bg
                                :box (:line-width 4 :color ,bg)))))

;;;; search / parens
   `(isearch ((,c (:foreground ,bg :background ,pink :weight bold))))
   `(isearch-fail ((,c (:foreground ,magenta :background ,red-bg))))
   `(lazy-highlight ((,c (:foreground ,light :background ,base02))))
   `(match ((,c (:foreground ,bg :background ,blue))))
   `(query-replace ((,c (:inherit isearch))))
   `(show-paren-match ((,c (:foreground ,pink :background ,base02 :weight bold))))
   `(show-paren-match-expression ((,c (:background ,base01))))
   `(show-paren-mismatch ((,c (:foreground ,bg :background ,magenta))))

;;;; syntax
   `(font-lock-comment-face ((,c (:foreground ,gray :slant italic))))
   `(font-lock-comment-delimiter-face ((,c (:inherit font-lock-comment-face))))
   `(font-lock-doc-face ((,c (:foreground ,gray2 :slant italic))))
   `(font-lock-doc-markup-face ((,c (:foreground ,purple))))
   `(font-lock-string-face ((,c (:foreground ,purple))))
   `(font-lock-regexp-grouping-backslash ((,c (:foreground ,pink))))
   `(font-lock-regexp-grouping-construct ((,c (:foreground ,pink))))
   `(font-lock-escape-face ((,c (:foreground ,pink))))
   `(font-lock-keyword-face ((,c (:foreground ,blue))))
   `(font-lock-builtin-face ((,c (:foreground ,teal))))
   `(font-lock-preprocessor-face ((,c (:foreground ,blue))))
   `(font-lock-function-name-face ((,c (:foreground ,pink :weight bold))))
   `(font-lock-function-call-face ((,c (:foreground ,pink))))
   `(font-lock-variable-name-face ((,c (:foreground ,fg))))
   `(font-lock-variable-use-face ((,c (:foreground ,fg))))
   `(font-lock-property-name-face ((,c (:foreground ,cyan))))
   `(font-lock-property-use-face ((,c (:foreground ,cyan))))
   `(font-lock-type-face ((,c (:foreground ,light))))
   `(font-lock-constant-face ((,c (:foreground ,teal))))
   `(font-lock-number-face ((,c (:foreground ,light))))
   `(font-lock-operator-face ((,c (:foreground ,blue))))
   `(font-lock-punctuation-face ((,c (:foreground ,gray2))))
   `(font-lock-bracket-face ((,c (:foreground ,gray2))))
   `(font-lock-delimiter-face ((,c (:foreground ,gray2))))
   `(font-lock-misc-punctuation-face ((,c (:foreground ,gray2))))
   `(font-lock-negation-char-face ((,c (:foreground ,magenta))))
   `(font-lock-warning-face ((,c (:foreground ,magenta :weight bold))))

;;;; vertico / orderless / marginalia / consult / embark
   `(vertico-current ((,c (:background ,base02 :foreground ,base06 :extend t))))
   `(vertico-group-title ((,c (:foreground ,gray :slant italic))))
   `(vertico-group-separator ((,c (:foreground ,base03 :strike-through t))))
   `(orderless-match-face-0 ((,c (:foreground ,blue :weight bold))))
   `(orderless-match-face-1 ((,c (:foreground ,pink :weight bold))))
   `(orderless-match-face-2 ((,c (:foreground ,cyan :weight bold))))
   `(orderless-match-face-3 ((,c (:foreground ,purple :weight bold))))
   `(marginalia-documentation ((,c (:foreground ,gray :slant italic))))
   `(marginalia-key ((,c (:foreground ,pink))))
   `(marginalia-type ((,c (:foreground ,light))))
   `(marginalia-mode ((,c (:foreground ,teal))))
   `(marginalia-file-priv-dir ((,c (:foreground ,blue))))
   `(marginalia-date ((,c (:foreground ,gray2))))
   `(marginalia-size ((,c (:foreground ,gray2))))
   `(consult-preview-line ((,c (:background ,base01 :extend t))))
   `(consult-preview-match ((,c (:inherit lazy-highlight))))
   `(consult-highlight-match ((,c (:foreground ,blue :weight bold))))
   `(consult-file ((,c (:foreground ,fg))))
   `(consult-line-number ((,c (:foreground ,base03))))
   `(consult-separator ((,c (:foreground ,base03))))
   `(embark-keybinding ((,c (:foreground ,pink :weight bold))))
   `(embark-target ((,c (:background ,base02))))

;;;; corfu
   `(corfu-default ((,c (:foreground ,fg :background ,bg-alt))))
   `(corfu-current ((,c (:foreground ,base06 :background ,base02))))
   `(corfu-border ((,c (:background ,base02))))
   `(corfu-bar ((,c (:background ,base03))))
   `(corfu-annotations ((,c (:foreground ,gray))))
   `(corfu-deprecated ((,c (:foreground ,gray :strike-through t))))

;;;; which-key
   `(which-key-key-face ((,c (:foreground ,pink :weight bold))))
   `(which-key-separator-face ((,c (:foreground ,base03))))
   `(which-key-command-description-face ((,c (:foreground ,fg))))
   `(which-key-group-description-face ((,c (:foreground ,blue))))
   `(which-key-local-map-description-face ((,c (:foreground ,cyan))))
   `(which-key-note-face ((,c (:foreground ,gray))))

;;;; flymake / eglot / compilation
   `(flymake-error ((,c (:underline (:style wave :color ,magenta)))))
   `(flymake-warning ((,c (:underline (:style wave :color ,purple)))))
   `(flymake-note ((,c (:underline (:style wave :color ,green)))))
   `(flymake-error-echo ((,c (:foreground ,magenta))))
   `(flymake-warning-echo ((,c (:foreground ,purple))))
   `(flymake-note-echo ((,c (:foreground ,green))))
   `(eglot-highlight-symbol-face ((,c (:background ,base02 :weight bold))))
   `(eglot-inlay-hint-face ((,c (:foreground ,base03 :height 0.9))))
   `(eglot-mode-line ((,c (:foreground ,teal :weight bold))))
   `(compilation-error ((,c (:foreground ,magenta))))
   `(compilation-warning ((,c (:foreground ,purple))))
   `(compilation-info ((,c (:foreground ,green))))
   `(compilation-line-number ((,c (:foreground ,gray2))))
   `(compilation-mode-line-exit ((,c (:foreground ,green :weight bold))))
   `(compilation-mode-line-fail ((,c (:foreground ,magenta :weight bold))))
   `(compilation-mode-line-run ((,c (:foreground ,blue :weight bold))))

;;;; diff / magit
   `(diff-added ((,c (:foreground ,green :background ,green-bg :extend t))))
   `(diff-removed ((,c (:foreground ,magenta :background ,red-bg :extend t))))
   `(diff-changed ((,c (:foreground ,blue :background ,blue-bg :extend t))))
   `(diff-refine-added ((,c (:background ,green-bg+))))
   `(diff-refine-removed ((,c (:background ,red-bg+))))
   `(diff-header ((,c (:foreground ,fg :background ,base01))))
   `(diff-file-header ((,c (:foreground ,blue :background ,base01 :weight bold))))
   `(diff-hunk-header ((,c (:foreground ,purple :background ,base01))))
   `(diff-indicator-added ((,c (:foreground ,green))))
   `(diff-indicator-removed ((,c (:foreground ,magenta))))
   `(magit-section-heading ((,c (:foreground ,blue :weight bold))))
   `(magit-section-highlight ((,c (:background ,base01 :extend t))))
   `(magit-section-heading-selection ((,c (:foreground ,pink))))
   `(magit-branch-local ((,c (:foreground ,cyan))))
   `(magit-branch-remote ((,c (:foreground ,green))))
   `(magit-branch-current ((,c (:foreground ,cyan :box (:line-width (1 . -1))))))
   `(magit-tag ((,c (:foreground ,purple))))
   `(magit-hash ((,c (:foreground ,gray))))
   `(magit-dimmed ((,c (:foreground ,gray))))
   `(magit-filename ((,c (:foreground ,fg))))
   `(magit-log-author ((,c (:foreground ,pink))))
   `(magit-log-date ((,c (:foreground ,gray2))))
   `(magit-log-graph ((,c (:foreground ,gray))))
   `(magit-head ((,c (:foreground ,cyan))))
   `(magit-keyword ((,c (:foreground ,purple))))
   `(magit-mode-line-process ((,c (:foreground ,blue))))
   `(magit-process-ok ((,c (:foreground ,green :weight bold))))
   `(magit-process-ng ((,c (:foreground ,magenta :weight bold))))
   `(magit-diff-file-heading ((,c (:foreground ,fg :weight bold))))
   `(magit-diff-file-heading-highlight ((,c (:background ,base01 :weight bold))))
   `(magit-diff-hunk-heading ((,c (:foreground ,gray2 :background ,base01 :extend t))))
   `(magit-diff-hunk-heading-highlight ((,c (:foreground ,fg :background ,base02 :extend t))))
   `(magit-diff-context ((,c (:foreground ,gray :extend t))))
   `(magit-diff-context-highlight ((,c (:foreground ,fg :background ,bg-alt :extend t))))
   `(magit-diff-added ((,c (:foreground ,green :background ,green-bg :extend t))))
   `(magit-diff-added-highlight ((,c (:foreground ,green :background ,green-bg+ :extend t))))
   `(magit-diff-removed ((,c (:foreground ,magenta :background ,red-bg :extend t))))
   `(magit-diff-removed-highlight ((,c (:foreground ,magenta :background ,red-bg+ :extend t))))
   `(magit-diffstat-added ((,c (:foreground ,green))))
   `(magit-diffstat-removed ((,c (:foreground ,magenta))))

;;;; dired
   `(dired-directory ((,c (:foreground ,blue :weight bold))))
   `(dired-symlink ((,c (:foreground ,cyan))))
   `(dired-broken-symlink ((,c (:foreground ,magenta :strike-through t))))
   `(dired-header ((,c (:foreground ,purple :weight bold))))
   `(dired-marked ((,c (:foreground ,pink :weight bold))))
   `(dired-mark ((,c (:foreground ,pink :weight bold))))
   `(dired-flagged ((,c (:foreground ,magenta :weight bold))))
   `(dired-ignored ((,c (:foreground ,gray))))
   `(dired-perm-write ((,c (:foreground ,gray2))))
   `(dired-special ((,c (:foreground ,teal))))

;;;; org
   `(org-document-title ((,c (:foreground ,base06 :weight bold :height 1.4))))
   `(org-document-info ((,c (:foreground ,gray2))))
   `(org-document-info-keyword ((,c (:foreground ,base03))))
   `(org-level-1 ((,c (:foreground ,blue :weight bold :height 1.2))))
   `(org-level-2 ((,c (:foreground ,pink :weight bold :height 1.1))))
   `(org-level-3 ((,c (:foreground ,purple :weight bold :height 1.05))))
   `(org-level-4 ((,c (:foreground ,cyan :weight bold))))
   `(org-level-5 ((,c (:foreground ,light :weight bold))))
   `(org-level-6 ((,c (:foreground ,green :weight bold))))
   `(org-level-7 ((,c (:foreground ,sky :weight bold))))
   `(org-level-8 ((,c (:foreground ,teal :weight bold))))
   `(org-hide ((,c (:foreground ,bg))))
   `(org-indent ((,c (:inherit org-hide))))
   `(org-ellipsis ((,c (:foreground ,gray :underline nil))))
   `(org-todo ((,c (:foreground ,magenta :weight bold))))
   `(org-done ((,c (:foreground ,green :weight bold))))
   `(org-headline-done ((,c (:foreground ,gray))))
   `(org-headline-todo ((,c (:foreground ,fg))))
   `(org-priority ((,c (:foreground ,pink))))
   `(org-tag ((,c (:foreground ,gray :weight normal))))
   `(org-checkbox ((,c (:foreground ,blue :weight bold))))
   `(org-checkbox-statistics-todo ((,c (:foreground ,magenta))))
   `(org-checkbox-statistics-done ((,c (:foreground ,green))))
   `(org-date ((,c (:foreground ,light :underline t))))
   `(org-sexp-date ((,c (:foreground ,light))))
   `(org-link ((,c (:foreground ,sky :underline t))))
   `(org-footnote ((,c (:foreground ,teal :underline t))))
   `(org-target ((,c (:foreground ,teal))))
   `(org-code ((,c (:foreground ,pink))))
   `(org-verbatim ((,c (:foreground ,green))))
   `(org-quote ((,c (:background ,bg-alt :slant italic :extend t))))
   `(org-verse ((,c (:inherit org-quote))))
   `(org-block ((,c (:background ,bg-alt :extend t))))
   `(org-block-begin-line ((,c (:foreground ,base03 :background ,bg-alt :extend t))))
   `(org-block-end-line ((,c (:inherit org-block-begin-line))))
   `(org-meta-line ((,c (:foreground ,base03))))
   `(org-drawer ((,c (:foreground ,base03))))
   `(org-special-keyword ((,c (:foreground ,gray))))
   `(org-property-value ((,c (:foreground ,gray2))))
   `(org-table ((,c (:foreground ,light))))
   `(org-table-header ((,c (:foreground ,blue :background ,base01 :weight bold))))
   `(org-formula ((,c (:foreground ,pink))))
   `(org-latex-and-related ((,c (:foreground ,purple))))
   `(org-macro ((,c (:foreground ,teal))))
   `(org-list-dt ((,c (:foreground ,blue :weight bold))))
   `(org-warning ((,c (:foreground ,magenta :weight bold))))
   `(org-scheduled ((,c (:foreground ,fg))))
   `(org-scheduled-today ((,c (:foreground ,cyan))))
   `(org-scheduled-previously ((,c (:foreground ,purple))))
   `(org-upcoming-deadline ((,c (:foreground ,pink))))
   `(org-upcoming-distant-deadline ((,c (:foreground ,gray2))))
   `(org-imminent-deadline ((,c (:foreground ,magenta :weight bold))))
   `(org-time-grid ((,c (:foreground ,base03))))
   `(org-agenda-structure ((,c (:foreground ,blue :weight bold :height 1.1))))
   `(org-agenda-date ((,c (:foreground ,blue))))
   `(org-agenda-date-today ((,c (:foreground ,pink :weight bold))))
   `(org-agenda-date-weekend ((,c (:foreground ,purple))))
   `(org-agenda-date-weekend-today ((,c (:foreground ,purple :weight bold))))
   `(org-agenda-done ((,c (:foreground ,gray))))
   `(org-agenda-dimmed-todo-face ((,c (:foreground ,gray))))
   `(org-agenda-current-time ((,c (:foreground ,cyan))))
   `(org-agenda-calendar-event ((,c (:foreground ,fg))))
   `(org-agenda-clocking ((,c (:background ,base02))))

;;;; dashboard
   `(dashboard-banner-logo-title ((,c (:foreground ,blue :weight bold))))
   `(dashboard-text-banner ((,c (:foreground ,blue))))
   `(dashboard-heading ((,c (:foreground ,pink :weight bold))))
   ;; no :foreground: the item buttons are overlays, a colour here would
   ;; paint over the org-todo / org-level faces on agenda entries
   `(dashboard-items-face ((,c (:weight normal))))
   `(dashboard-no-items-face ((,c (:foreground ,gray))))
   `(dashboard-navigator ((,c (:foreground ,cyan))))
   `(dashboard-footer-face ((,c (:foreground ,gray :slant italic))))
   `(widget-button ((,c (:weight normal))))

;;;; indent guides
   `(highlight-indent-guides-character-face ((,c (:foreground ,base01))))
   `(highlight-indent-guides-top-character-face ((,c (:foreground ,base03))))
   `(highlight-indent-guides-stack-character-face ((,c (:foreground ,base02))))

;;;; eat / ansi (eat-term-color-* inherit these)
   `(ansi-color-black ((,c (:foreground ,base01 :background ,base01))))
   `(ansi-color-red ((,c (:foreground ,magenta :background ,magenta))))
   `(ansi-color-green ((,c (:foreground ,green :background ,green))))
   `(ansi-color-yellow ((,c (:foreground ,yellow :background ,yellow))))
   `(ansi-color-blue ((,c (:foreground ,blue :background ,blue))))
   `(ansi-color-magenta ((,c (:foreground ,purple :background ,purple))))
   `(ansi-color-cyan ((,c (:foreground ,teal :background ,teal))))
   `(ansi-color-white ((,c (:foreground ,fg :background ,fg))))
   `(ansi-color-bright-black ((,c (:foreground ,base03 :background ,base03))))
   `(ansi-color-bright-red ((,c (:foreground ,pink :background ,pink))))
   `(ansi-color-bright-green ((,c (:foreground "#6fdc8c" :background "#6fdc8c"))))
   `(ansi-color-bright-yellow ((,c (:foreground "#fff1a8" :background "#fff1a8"))))
   `(ansi-color-bright-blue ((,c (:foreground ,light :background ,light))))
   `(ansi-color-bright-magenta ((,c (:foreground "#d4bbff" :background "#d4bbff"))))
   `(ansi-color-bright-cyan ((,c (:foreground ,cyan :background ,cyan))))
   `(ansi-color-bright-white ((,c (:foreground ,base06 :background ,base06))))
   `(eat-shell-prompt-annotation-success ((,c (:foreground ,green))))
   `(eat-shell-prompt-annotation-failure ((,c (:foreground ,magenta))))
   `(eat-shell-prompt-annotation-running ((,c (:foreground ,blue))))

;;;; misc packages
   `(envrc-mode-line-on-face ((,c (:foreground ,green))))
   `(envrc-mode-line-error-face ((,c (:foreground ,magenta))))
   `(envrc-mode-line-none-face ((,c (:foreground ,gray))))
   `(pdf-view-region ((,c (:background ,base02)))))

  (custom-theme-set-variables
   'oxocarbon
   ;; keep the guide faces above instead of auto-computed ones
   '(highlight-indent-guides-auto-enabled nil)
   `(pdf-view-midnight-colors '(,fg . ,bg))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'oxocarbon)

;;; oxocarbon-theme.el ends here
