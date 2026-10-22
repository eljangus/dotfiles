;;; nox-theme.el --- Dark theme (nox) -*- lexical-binding: t -*-

;;; Commentary:
;;
;; Install: put this file in a directory, e.g. ~/.emacs.d/themes/, then in init.el:
;;
;;   (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;;   (load-theme 'nox t)
;;
;; Or interactively: M-x load-theme RET nox.

;;; Code:

(deftheme nox "Dark theme with a near-black background.")

(custom-theme-set-faces
 'nox
 '(completions-common-part ((t (:foreground "#569CD6"))))
 '(cursor ((t (:background "#aeafad"))))
 '(default ((t (:foreground "#d4d4d4" :background "#0d0d0d"))))
 '(error ((t (:foreground "#f48771"))))
 '(font-lock-bracket-face ((t (:foreground "#d4d4d4"))))
 '(font-lock-builtin-face ((t (:foreground "#BD63C5"))))
 '(font-lock-comment-delimiter-face ((t (:foreground "#57A64A" :slant italic))))
 '(font-lock-comment-face ((t (:foreground "#57A64A" :slant italic))))
 '(font-lock-constant-face ((t (:foreground "#D98BCE"))))
 '(font-lock-delimiter-face ((t (:foreground "#d4d4d4"))))
 '(font-lock-doc-face ((t (:foreground "#6A9955" :slant italic))))
 '(font-lock-doc-markup-face ((t (:foreground "#6A9955" :slant italic))))
 '(font-lock-escape-face ((t (:foreground "#D16969"))))
 '(font-lock-function-call-face ((t (:foreground "#DCDCAA"))))
 '(font-lock-function-name-face ((t (:foreground "#DCDCAA"))))
 '(font-lock-keyword-face ((t (:foreground "#569CD6" :slant italic))))
 '(font-lock-misc-punctuation-face ((t (:foreground "#d4d4d4"))))
 '(font-lock-negation-char-face ((t (:foreground "#ffffff"))))
 '(font-lock-number-face ((t (:foreground "#B5CEA8"))))
 '(font-lock-operator-face ((t (:foreground "#ffffff"))))
 '(font-lock-preprocessor-face ((t (:foreground "#7F8C99"))))
 '(font-lock-property-name-face ((t (:foreground "#9CDCFE"))))
 '(font-lock-property-use-face ((t (:foreground "#9CDCFE"))))
 '(font-lock-punctuation-face ((t (:foreground "#d4d4d4"))))
 '(font-lock-regexp-face ((t (:foreground "#D16969"))))
 '(font-lock-regexp-grouping-backslash ((t (:foreground "#D16969"))))
 '(font-lock-regexp-grouping-construct ((t (:foreground "#D16969"))))
 '(font-lock-string-face ((t (:foreground "#D69D85"))))
 '(font-lock-type-face ((t (:foreground "#4EC9B0" :weight bold))))
 '(font-lock-variable-name-face ((t (:foreground "#9CDCFE"))))
 '(font-lock-variable-use-face ((t (:foreground "#9CDCFE"))))
 '(font-lock-warning-face ((t (:foreground "#cca700" :weight bold))))
 '(fringe ((t (:background "#0d0d0d"))))
 '(header-line ((t (:foreground "#cccccc" :background "#141414"))))
 '(highlight ((t (:background "#2a2d2e"))))
 '(hl-line ((t (:background "#1a1a1a"))))
 '(isearch ((t (:foreground "#ffffff" :background "#062e49" :weight bold))))
 '(lazy-highlight ((t (:background "#515c6a"))))
 '(line-number ((t (:foreground "#858585" :background "#0d0d0d"))))
 '(line-number-current-line ((t (:foreground "#c6c6c6" :background "#1a1a1a"))))
 '(link ((t (:foreground "#3890d1" :underline t))))
 '(link-visited ((t (:foreground "#A88BE0" :underline t))))
 '(match ((t (:background "#264f78"))))
 '(minibuffer-prompt ((t (:foreground "#569CD6" :weight bold))))
 '(mode-line ((t (:foreground "#ffffff" :background "#040404"))))
 '(mode-line-active ((t (:foreground "#ffffff" :background "#040404"))))
 '(mode-line-inactive ((t (:foreground "#cccccc" :background "#3c3c3c"))))
 '(region ((t (:background "#264f78"))))
 '(shadow ((t (:foreground "#646464"))))
 '(show-paren-match ((t (:foreground "#74879f" :background "#515c6a"))))
 '(show-paren-mismatch ((t (:foreground "#ffffff" :background "#c74e39"))))
 '(success ((t (:foreground "#81b88b"))))
 '(tooltip ((t (:foreground "#d4d4d4" :background "#1b1b1b"))))
 '(trailing-whitespace ((t (:background "#c74e39"))))
 '(vertical-border ((t (:foreground "#6B6B6B"))))
 '(warning ((t (:foreground "#cca700"))))
 '(window-divider ((t (:foreground "#6B6B6B")))))

(provide-theme 'nox)

;;; nox-theme.el ends here
