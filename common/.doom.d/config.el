;; the contents of this file (config.el) are automatically combined from config.org
;; make all your edits in config.org

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Sig Lange"
      user-mail-address "sig.lange@gmail.com")

;; blinking cursor
(blink-cursor-mode 1)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; (global-set-key [f5] 'hl-line-mode)
(remove-hook 'doom-first-buffer-hook #'global-hl-line-mode)

;;(setq doom-localleader-key ",")
(after! treemacs
  (treemacs-follow-mode 1))

(server-start)
(pcre-mode +1)

(defun save-all () (interactive) (save-some-buffers t))
(global-set-key (kbd "C-S") 'save-all)

;; disable automatically adding various pairs of matching parentheses
(remove-hook 'doom-first-buffer-hook #'smartparens-global-mode)

;; (setq +notmuch-sync-backend 'mbsync)

;; save current cursor position in files
(save-place-mode 1)

(setq confirm-kill-emacs nil)

(setq doom-theme 'doom-zenburn)

(setq projectile-use-native-indexing t)

;;(after! go-mode
;;        (setq gofmt-command "goimports")
;;)

;;(add-hook 'go-mode-hook 'lsp-deferred)

(setq lsp-enable-file-watchers nil)

(setq lsp-gopls-codelens nil)

(after! go-mode
  (setq gofmt-command "goimports")
  (add-hook 'go-mode-hook
            (lambda ()
              (add-hook 'after-save-hook 'gofmt nil 'make-it-local))))

(after! go-mode
  (set-lookup-handlers! 'go-mode
    :definition #'godef-jump
    :references #'go-guru-referrers
    :documentation #'godoc-at-point))

;; rust
 ;; (after! lsp-rust
 ;;   (setq lsp-rust-analyzer-display-chaining-hints t
 ;;         lsp-rust-analyzer-display-parameter-hints t
 ;;         lsp-rust-analyzer-completion-add-call-argument-snippets t
 ;;         lsp-rust-analyzer-call-info-full t
 ;;         lsp-rust-analyzer-inlay-chain-format " : %s"
 ;;         lsp-rust-analyzer-server-display-inlay-hints t
 ;;         lsp-rust-analyzer-server-display-inlay-hints t))
(after! lsp-rust
  (setq lsp-rust-analyzer-display-chaining-hints t
        lsp-rust-analyzer-display-parameter-hints t
        lsp-rust-analyzer-completion-add-call-argument-snippets t
        lsp-rust-analyzer-call-info-full t
        lsp-rust-analyzer-inlay-chain-format " : %s"
        lsp-rust-analyzer-max-inlay-hint-length 40
        lsp-rust-analyzer-server-display-inlay-hints t)
  (map! :localleader :map rustic-mode-map "tl" 'rustic-cargo-test-rerun)
  (map! :localleader :map rustic-mode-map "c" 'rustic-cargo-check)
)
;; (after! lsp-rust
;;        (setq racer-rust-src-path
;;        (concat (string-trim
;;                (shell-command-to-string "rustc --print sysroot"))
;;                "/lib/rustlib/src/rust/src")))

;; (after! rustic
;;   (setq rustic-format-on-save t)
;;   (setq rustic-lsp-server 'rust-analyzer))

(after! lsp-rust
  (setq lsp-rust-server 'rust-analyzer))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!


;; org-capture
;; (setq org-default-notes-file (concat org-directory "/notes.org"))
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(setq org-directory "~/org")
(after! org
  (setq org-log-done t))
(after! org
  (setq org-agenda-files '("~/org/")))

; xorg clipboard handling
(setq x-select-enable-primary t)
(setq x-select-enable-clipboard t)

; ibuffer grouping
(use-package ibuffer-vc
  :ensure t
  :init
  :config
  (add-hook 'ibuffer-hook
            (lambda ()
              (ibuffer-vc-set-filter-groups-by-vc-root)
              (unless (eq ibuffer-sorting-mode 'alphabetic)
                (ibuffer-do-sort-by-alphabetic)))))

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function.
;; This is the default: doom-one
;; (setq doom-theme 'doom-one)
;; (setq doom-theme 'doom-spacegrey)
;; notes
;; - zenburn seems easy to read on my laptop, in the morning

;; (ef-themes-select 'ef-bio)

;; snippets
(yas-global-mode 1)
(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")

(require 'restclient)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((restclient . t)))

;; recoll
(use-package! org-recoll
  :after org)

(global-set-key (kbd "C-c g") 'org-recoll-search)
(global-set-key (kbd "C-c u") 'org-recoll-update-index)
