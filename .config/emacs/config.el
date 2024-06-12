(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
(package-refresh-contents))

(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)	
	 ("C-l" . ivy-alt-done)
	 ("C-j" . ivy-next-line)
	 ("C-k" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-k" . ivy-previous-line)
	 ("C-l" . ivy-done)
	 ("C-d" . ivy-switch-buffer-kill)
	 :map ivy-reverse-i-search-map
	 ("C-k" . ivy-previous-line)
	 ("C-d" . ivy-reverse-i-search-kill))
   :config)
(ivy-mode 1)

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
         ("C-x b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history))
  :config
  (setq ivy-initial-inputs-alist nil))

(use-package helpful
:custom
(counsel-describe-function-function #'helpfull-callable)
(counsel-describe-variable-function #'helpfull-callable)
:bind
([remap describe-function] . counsel-describe-function)
([remap describe-command] . helpfull-command)
([remap describe-variable] . counsel-describe-variable)
([remap describe-key] . helpfull.key))

(use-package which-key
   :init
   (which-key-mode 1)
   :config
   (setq which-key-side-window-location 'bottom
         which-key-sort-order #'which-key-key-order-alpha
         which-key-sort-uppercase-first nil
         which-key-add-column-padding 1
         which-key-max-display-columns nil
         which-key-min-display-lines 6
         which-key-side-window-slot -10
         which-key-side-window-max-height 0.25
         which-key-idle-delay 0.3
         which-key-max-description-length 25
         which-key-allow-imprecise-window-fit t
         which-key-separator " → " ))

(setq inhibit-startup-message t)
(scroll-bar-mode -1)             ; Disable visible scrollbar
(tool-bar-mode -1)               ; Disable the toolbar
(tooltip-mode -1)                ; Disable tooltips
(set-fringe-mode 10)             ; Give some breathing room
; (menu-bar-mode -1)             ; Disable the menu bar
; Set up the visible bell
(setq visible-bell t)
; Make ESC quit prompts

; (load-theme 'wombat)

(use-package doom-themes
:init (load-theme 'doom-snazzy t))

(column-number-mode)
(global-display-line-numbers-mode 1)
(global-visual-line-mode t)

(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		eshell-mode-hook))
  (add-hook mode(lambda ()(display-line-numbers-mode 0))))

(use-package toc-org
    :commands toc-org-enable
    :init (add-hook 'org-mode-hook 'toc-org-enable))

(add-hook 'org-mode-hook 'org-indent-mode)
(use-package org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(set-face-attribute 'default nil
  :font "JetBrainsMono Nerd Font"
  :height 110
  :weight 'medium)
(set-face-attribute 'variable-pitch nil
  :font "Ubuntu Nerd Font"
  :height 120
  :weight 'medium)
(set-face-attribute 'fixed-pitch nil
  :font "JetBrainsMono Nerd Font"
  :height 110
  :weight 'medium)
;; Makes commented text and keywords italics.
;; This is working in emacsclient but not emacs.
(set-face-attribute 'font-lock-comment-face nil
  :slant 'italic)
(set-face-attribute 'font-lock-keyword-face nil
  :slant 'italic)

;; This sets the default font on all graphical frames created after restarting Emacs.
;; Does the same thing as 'set-face-attribute default' above, but emacsclient fonts
;; are not right unless I also add this method of setting the default font.
(add-to-list 'default-frame-alist '(font . "JetBrainsMono Nerd Font-11"))

(setq-default line-spacing 0.12)

(use-package doom-modeline
:ensure t
:init (doom-modeline-mode 1)
:custom ((doom-modeline-height 35)))

(use-package all-the-icons)

(use-package rainbow-delimiters
 :hook (prog-mode . rainbow-delimiters-mode))

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "C-M-j") 'counsel-switch-buffer)
