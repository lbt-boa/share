;; -*- Mode: lisp-interaction; coding: utf-8; -*-

					; Hmmm makes sense I think
(add-to-list 'load-path "~/.emacs.d/lisp/")
(setq visible-bell t)

;; this avoids an issue with https in 26.1
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(setq-default cursor-type 'bar)
;; Useful...
(auto-compression-mode 'true)
(put 'upcase-region 'disabled nil)
(global-font-lock-mode t)

;; Global settings
					;(define-key function-key-map [delete] [deletechar])
					;(define-key function-key-map [kp-delete] [deletechar])
					;(define-key global-map "\d" 'delete-char)
(define-key global-map [home] `beginning-of-line)
(define-key global-map [end] `end-of-line)
(define-key global-map "\M-#" 'comment-region)
(define-key global-map "\C-cg" 'magit-status)
(define-key global-map "\C-z" 'undo)

;; multiple cursors
(global-set-key (kbd "C-c m c") 'mc/edit-lines)

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
					;(when
					;    (load
					;     (expand-file-name "~/.emacs.d/elpa/package.el"))
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
					;(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(browse-url-browser-function 'browse-url-firefox)
 '(browse-url-firefox-program "firefox")
 '(calendar-daylight-time-zone-name "BST")
 '(calendar-standard-time-zone-name "BST")
 '(confirm-kill-emacs 'y-or-n-p)
 '(debian-changelog-mailing-address "david@dgreaves.com")
 '(desktop-base-file-name "desktop-data")
 '(desktop-files-not-to-save nil)
 '(desktop-lazy-verbose nil)
 '(desktop-load-locked-desktop t)
 '(desktop-path '("~/.emacs.d/desktop-session"))
 '(desktop-restore-eager t)
 '(desktop-restore-in-current-display nil)
 '(desktop-save 'ask)
 '(desktop-save-mode t)
 '(diary-file "~/org/diary")
 '(doxymacs-doxygen-style "JavaDoc")
 '(doxymacs-group-begin-comment-template '("/** @name" '> 'n "*" 'p '> 'n "*/" '> 'n "//@{" '> 'n))
 '(ecb-layout-window-sizes nil)
 '(ecb-options-version "2.40")
 '(ecb-source-path '("/everything/devel"))
 '(edit-server-port 9922)
 '(elpy-rpc-python-command "python3")
 '(enable-recursive-minibuffers t)
 '(gc-cons-threshold 20000000)
 '(global-smart-shift-mode t)
 '(helm-ff-keep-cached-candidates nil)
 '(icicle-saved-completion-sets nil)
 '(js2-external-pretty-print-command "python2.6 -mjson.tool")
 '(ldap-host-parameters-alist '(("egw" base "dc=dgreaves,dc=com")))
 '(magit-commit-signoff t)
 '(magit-diff-refine-hunk t)
 '(magit-log-auto-more t)
 '(magit-remote-ref-format 'remote-slash-branch)
 '(mediawiki-site-alist
   '(("Wikipedia" "http://en.wikipedia.org/wiki/index.php" "username"
      "password" "Main Page")
     ("MerProject" "https://wiki.merproject.org/wiki/Main_Page" "" ""
      "Main Page")))
 '(mediawiki-site-default "MerProject")
 '(mouse-wheel-follow-mouse t)
 '(org-agenda-clock-consistency-checks
   '(:max-duration "10:00" :min-duration 0 :max-gap "0:05" :gap-ok-around
     ("4:00") :default-face
     ((:background "DarkRed") (:foreground "white"))
     :overlap-face ((:foreground "red")) :gap-face nil
     :no-end-time-face nil :long-face nil :short-face
     nil))
 '(org-agenda-skip-comment-trees nil t)
 '(org-agenda-skip-function-global nil)
 '(org-agenda-start-on-weekday nil)
 '(org-capture-templates
   '(("c" "Mer Community" entry
      (file+headline "Mer.org" "Community Tasks")
      "* TODO %?                   :MEEGO:\12  added: %u")
     ("i" "Mer IT" entry (file+headline "Mer.org" "IT Tasks")
      "* TODO %?                   :MEEGO-IT:\12  added: %u" :prepend
      t)
     ("m" "Mer Task" entry (file+headline "Mer.org" "General Task")
      "* TODO %?                   :Mer:\12  added: %u" :prepend t)
     ("g" "General Task" entry
      (file+headline "UnorganisedTasks.org" "Uncategorised")
      "* TODO %?                   :HOME:\12  added: %u")
     ("M" "Meeting" entry
      (file+headline "Meetings.org" "Uncategorised")
      "* Meeting %? %^{When is it}T\12")
     ("t" "Todo" entry (file+headline "UnorganisedTasks.org" "Tasks")
      "* TODO %?\12  %i\12  %a")
     ("j" "Journal" entry (file+datetree "~/org/journal.org")
      "* %?\12Entered on %U\12  %i\12  %a")
     ("r" "Read" entry (file "~/org/reading-list.org")
      "* Read: %x %?\12Entered on %U\12  %i\12  %a")
     ("w" "Who" entry (file "~/org/whoswho.org")
      "* <<%x>> %?\12\11on %U")))
 '(org-clock-continuously nil)
 '(org-clock-into-drawer nil)
 '(org-default-notes-file "/everything/everything/org/notes.org")
 '(org-directory "/everything/everything/org")
 '(org-display-custom-times nil)
 '(org-duration-format 'h:mm)
 '(org-latex-classes
   '(("memoir" "\\documentclass{memoir}"
      ("\\chapter{%s}" . "\\chapter*{%s}")
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
     ("article" "\\documentclass[11pt]{article}"
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
      ("\\paragraph{%s}" . "\\paragraph*{%s}")
      ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
     ("report" "\\documentclass[11pt]{report}"
      ("\\part{%s}" . "\\part*{%s}")
      ("\\chapter{%s}" . "\\chapter*{%s}")
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
     ("book" "\\documentclass[11pt]{book}"
      ("\\part{%s}" . "\\part*{%s}")
      ("\\chapter{%s}" . "\\chapter*{%s}")
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))))
 '(org-latex-image-default-macro "\\jollaicon")
 '(org-latex-image-default-option "scale=0.25")
 '(org-latex-image-default-width "")
 '(org-log-states-order-reversed t)
 '(org-mobile-directory "/everything/everything/orgdav/")
 '(org-publish-project-alist
   '(("jolla-ug-org" :base-directory
      "/everything/everything/Jolla/ug/web" :base-extension "org"
      :publishing-directory "/everything/everything/Jolla/ug/web-html"
      :recursive t :publishing-function org-html-publish-to-html
      :headline-levels 4 :auto-preamble t :section-numbers nil
      :body-only t :completion-function
      (lambda nil
	(call-process "/everything/everything/Jolla/ug/web/fix.pl" nil
		      nil nil
		      "/everything/everything/Jolla/ug/web-html"
		      "/everything/everything/Jolla/ug/")))
     ("jolla-ug-static" :base-directory
      "/everything/everything/Jolla/ug/web" :base-extension
      "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
      :publishing-directory "/everything/everything/Jolla/ug/web-html"
      :recursive t :publishing-function org-publish-attachment)
     ("jolla-ug" :components ("jolla-ug-org" "jolla-ug-static"))
     ("jolla-ug-org2" :base-directory "/mer/jolla/ug/web"
      :base-extension "org" :publishing-directory
      "/mer/jolla/ug/web-html" :recursive t :publishing-function
      org-html-publish-to-html :headline-levels 4 :auto-preamble t
      :section-numbers nil :body-only t :completion-function
      (lambda nil
	(call-process "/mer/jolla/ug/web/fix.pl" nil nil nil
		      "/mer/jolla/ug/web-html" "/mer/jolla/ug/")))
     ("jolla-ug-static2" :base-directory "/mer/jolla/ug/web"
      :base-extension
      "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
      :publishing-directory "/mer/jolla/ug/web-html" :recursive t
      :publishing-function org-publish-attachment)
     ("jolla-ug2" :components ("jolla-ug-org2" "jolla-ug-static2"))))
 '(org-refile-targets '((org-agenda-files :maxlevel . 3)))
 '(org-refile-use-outline-path 'file)
 '(org-startup-folded nil)
 '(org-tag-persistent-alist
   '(("JOLLA" . 106) ("MER_IT" . 109) ("MER_CORE" . 99) ("HOME" . 104)
     ("BUG" . 98)))
 '(org-time-clocksum-format
   '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t))
 '(org-time-stamp-custom-formats '("<%d/%m/%y %a>" . "<%d/%m/%y %a %H:%M>"))
 '(org-todo-keywords '((sequence "TODO" "In Progress" "Blocked" "DONE")))
 '(package-selected-packages
   '(annotate apache-mode bar-cursor bm boxquote browse-kill-ring
     company-lsp company-qml csv-mode diminish discover
     edit-server elpy eproject flycheck flymake-ruff folding
     ggtags ghub go-mode graphviz-dot-mode haml-mode helm-lsp
     htmlize indent-tools initsplit js2-mode lsp-ivy lsp-mode
     lsp-ui mutt-alias muttrc-mode pod-mode python-coverage
     python-pytest session smart-shift tabbar toml-mode
     ws-butler x509-mode yaml-mode))
 '(py-autopep8-options '("-aa"))
 '(python-shell-interpreter "python3")
 '(rails-ws:default-server-type "webrick")
 '(safe-local-variable-values
   '((eval org-display-inline-images) (org-image-actual-width . 600)
     (c-indent-level . 4) (org-export-html-style-include-default)
     (encoding . utf-8)))
 '(speedbar-fetch-etags-command "ctags -e")
 '(tooltip-gud-tips-p t)
 '(tramp-allow-unsafe-temporary-files t)
 '(treemacs-icons-dired-mode nil nil (treemacs-icons-dired))
 '(warning-suppress-log-types '((comp))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "Black" :foreground "Orange" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight regular :height 120 :width normal :foundry "GOOG" :family "Noto Sans Mono"))))
 '(cursor ((t (:background "yellow"))))
 '(font-lock-comment-face ((((class color) (background dark)) (:foreground "yellow2"))))
 '(font-lock-string-face ((((class color) (background light)) (:foreground "Green"))))
 '(fringe ((((class color) (background dark)) (:inherit default))))
 '(highlight ((((class color) (background dark)) (:background "blue"))))
 '(markdown-code-face ((t nil)))
 '(mouse ((t (:background "green"))))
 '(rst-level-1-face ((t (:background "gray15"))) t)
 '(rst-level-2-face ((t (:background "gray20"))) t)
 '(rst-level-3-face ((t (:background "gray25"))) t)
 '(rst-level-4-face ((t (:background "gray30"))) t)
 '(rst-level-5-face ((t (:background "gray35"))) t)
 '(rst-level-6-face ((t (:background "gray40"))) t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org mode config
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(add-hook 'org-mode-hook 'turn-on-font-lock)  ; Org buffers only
					; link in remember mode
					; (org-remember-insinuate)
					; (define-key global-map "\C-cr" 'org-remember)
(setq org-agenda-include-diary t)
(setq org-agenda-files '("/everything/everything/org/"))
(define-key global-map "\C-cc" 'org-capture)


(defadvice capture-other-frame (around capture-frame-parameters activate)
  "Set some frame parameters for the capture frame."
  (let ((default-frame-alist (append
    			      '(
    				(name . "*Capture*")
    				(width . 80)
    				(height . 10)
    				(vertical-scroll-bars . nil)
    				(menu-bar-lines . 0)
    				(tool-bar-lines . 0)
    				)
    			      default-frame-alist)))
    ad-do-it
    ))

;; http://irreal.org/blog/?p=2030
(setq org-agenda-archives-mode nil)
(setq org-agenda-skip-comment-trees nil)
(setq org-agenda-skip-function nil)


(org-clock-persistence-insinuate)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'tramp)
(tramp-set-completion-function "ssh"
                               '((tramp-parse-sconfig "/etc/ssh_config")
                                 (tramp-parse-sconfig "~/.ssh/config")))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; https://github.com/Alexander-Miller/treemacs
(use-package treemacs
    :ensure t
    :defer t
    :init
    (with-eval-after-load 'winum
      (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
    :config
    (progn
      (setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
            treemacs-deferred-git-apply-delay      0.5
            treemacs-directory-name-transformer    #'identity
            treemacs-display-in-side-window        t
            treemacs-eldoc-display                 t
            treemacs-file-event-delay              5000
            treemacs-file-extension-regex          treemacs-last-period-regex-value
            treemacs-file-follow-delay             0.2
            treemacs-file-name-transformer         #'identity
            treemacs-follow-after-init             t
            treemacs-git-command-pipe              ""
            treemacs-goto-tag-strategy             'refetch-index
            treemacs-indentation                   2
            treemacs-indentation-string            " "
            treemacs-is-never-other-window         nil
            treemacs-max-git-entries               5000
            treemacs-missing-project-action        'ask
            treemacs-move-forward-on-expand        nil
            treemacs-no-png-images                 nil
            treemacs-no-delete-other-windows       t
            treemacs-project-follow-cleanup        nil
            treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
            treemacs-position                      'left
            treemacs-recenter-distance             0.1
            treemacs-recenter-after-file-follow    nil
            treemacs-recenter-after-tag-follow     nil
            treemacs-recenter-after-project-jump   'always
            treemacs-recenter-after-project-expand 'on-distance
            treemacs-show-cursor                   nil
            treemacs-show-hidden-files             t
            treemacs-silent-filewatch              nil
            treemacs-silent-refresh                nil
            treemacs-sorting                       'alphabetic-asc
            treemacs-space-between-root-nodes      t
            treemacs-tag-follow-cleanup            t
            treemacs-tag-follow-delay              1.5
            treemacs-user-mode-line-format         nil
            treemacs-user-header-line-format       nil
            treemacs-width                         35
            treemacs-workspace-switch-cleanup      nil)

      ;; The default width and height of the icons is 22 pixels. If you are
      ;; using a Hi-DPI display, uncomment this to double the icon size.
      ;;(treemacs-resize-icons 44)

      (treemacs-follow-mode t)
      (treemacs-filewatch-mode t)
      (treemacs-fringe-indicator-mode t)
      (pcase (cons (not (null (executable-find "git")))
                   (not (null treemacs-python-executable)))
	(`(t . t)
	  (treemacs-git-mode 'deferred))
	(`(t . _)
	  (treemacs-git-mode 'simple))))
    :bind
    (:map global-map
          ("M-0"       . treemacs-select-window)
          ("C-x t 1"   . treemacs-delete-other-windows)
          ("C-x t t"   . treemacs)
          ("C-x t B"   . treemacs-bookmark)
          ("C-x t C-t" . treemacs-find-file)
          ("C-x t M-t" . treemacs-find-tag)))

;; (use-package treemacs-projectile
;;   :after treemacs projectile
;;   :ensure t)

(use-package treemacs-icons-dired
    :after treemacs dired
    :ensure t
    :config (treemacs-icons-dired-mode))

(use-package treemacs-magit
    :after treemacs magit
    :ensure t)

(use-package treemacs-perspective ;;treemacs-persective if you use perspective.el vs. persp-mode
    :after treemacs perspective ;;or perspective vs. persp-mode
    :ensure t
    :config (treemacs-set-scope-type 'Perspectives))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Development things

;; Syntax Checker
;; https://www.flycheck.org/en/latest/
(use-package flycheck
    :ensure t
    :init (global-flycheck-mode)
    :hook (prog-mode . flycheck-mode)
    :bind (:map flycheck-mode-map
		("M-n" . flycheck-next-error) ; optional but recommended error navigation
		("M-p" . flycheck-previous-error))
    )

;; Whitespace butler
;; https://github.com/lewang/ws-butler
(use-package ws-butler)
(ws-butler-global-mode)

;; Autocompletion
;; https://company-mode.github.io/
(use-package company
    :hook (prog-mode . company-mode)
    :config (setq company-tooltip-align-annotations t)
    (setq company-minimum-prefix-length 1))

;; IDE-like experience
;; https://emacs-lsp.github.io/lsp-mode/
;; (use-package lsp-mode
;;   :commands lsp
;;   )
;; https://www.ovistoica.com/blog/2024-7-05-modern-emacs-typescript-web-tsx-config#orgc542f94
;; not yet configured for lsp-booster
(use-package lsp-mode
    ;;      :config (require 'lsp-clients))
    :diminish "LSP"
    :ensure t
    :hook ((lsp-mode . lsp-diagnostics-mode)
           (lsp-mode . lsp-enable-which-key-integration)
           ((tsx-ts-mode
             typescript-ts-mode
             js-ts-mode) . lsp-deferred))
    :custom
    (lsp-keymap-prefix "C-c l")           ; Prefix for LSP actions
    (lsp-completion-provider :none)       ; Using Corfu as the provider
    (lsp-diagnostics-provider :flycheck)
    (lsp-session-file (locate-user-emacs-file ".lsp-session"))
    (lsp-log-io nil)                      ; IMPORTANT! Use only for debugging! Drastically affects performance
    (lsp-keep-workspace-alive nil)        ; Close LSP server if all project buffers are closed
    (lsp-idle-delay 0.5)                  ; Debounce timer for `after-change-function'
    ;; core
    (lsp-enable-xref t)                   ; Use xref to find references
    (lsp-auto-configure t)                ; Used to decide between current active servers
    (lsp-eldoc-enable-hover t)            ; Display signature information in the echo area
    (lsp-enable-dap-auto-configure t)     ; Debug support
    (lsp-enable-file-watchers nil)
    (lsp-enable-folding nil)              ; I disable folding since I use origami
    (lsp-enable-imenu t)
    (lsp-enable-indentation nil)          ; I use prettier
    (lsp-enable-links nil)                ; No need since we have `browse-url'
    (lsp-enable-on-type-formatting nil)   ; Prettier handles this
    (lsp-enable-suggest-server-download t) ; Useful prompt to download LSP providers
    (lsp-enable-symbol-highlighting t)     ; Shows usages of symbol at point in the current buffer
    (lsp-enable-text-document-color nil)   ; This is Treesitter's job

    (lsp-ui-sideline-show-hover nil)      ; Sideline used only for diagnostics
    (lsp-ui-sideline-diagnostic-max-lines 20) ; 20 lines since typescript errors can be quite big
    ;; completion
    (lsp-completion-enable t)
    (lsp-completion-enable-additional-text-edit t) ; Ex: auto-insert an import for a completion candidate
    (lsp-enable-snippet t)                         ; Important to provide full JSX completion
    (lsp-completion-show-kind t)                   ; Optional
    ;; headerline
    (lsp-headerline-breadcrumb-enable t)  ; Optional, I like the breadcrumbs
    (lsp-headerline-breadcrumb-enable-diagnostics nil) ; Don't make them red, too noisy
    (lsp-headerline-breadcrumb-enable-symbol-numbers nil)
    (lsp-headerline-breadcrumb-icons-enable nil)
    ;; modeline
    (lsp-modeline-code-actions-enable nil) ; Modeline should be relatively clean
    (lsp-modeline-diagnostics-enable nil)  ; Already supported through `flycheck'
    (lsp-modeline-workspace-status-enable nil) ; Modeline displays "LSP" when lsp-mode is enabled
    (lsp-signature-doc-lines 1)                ; Don't raise the echo area. It's distracting
    (lsp-ui-doc-use-childframe t)              ; Show docs for symbol at point
    (lsp-eldoc-render-all nil)            ; This would be very useful if it would respect `lsp-signature-doc-lines', currently it's distracting
    ;; lens
    (lsp-lens-enable nil)                 ; Optional, I don't need it
    ;; semantic
    (lsp-semantic-tokens-enable nil)      ; Related to highlighting, and we defer to treesitter

    :init
    (setq lsp-use-plists t))

(use-package lsp-completion
    :no-require
  :hook ((lsp-mode . lsp-completion-mode)))

(use-package lsp-ui
    :ensure t
    :commands
    (lsp-ui-doc-show
     lsp-ui-doc-glance)
    :bind (:map lsp-mode-map
		("C-c C-d" . 'lsp-ui-doc-glance))
    :after (lsp-mode evil)
    :config (setq lsp-ui-doc-enable t
                  evil-lookup-func #'lsp-ui-doc-glance ; Makes K in evil-mode toggle the doc for symbol at point
                  lsp-ui-doc-show-with-cursor nil      ; Don't show doc when cursor is over symbol - too distracting
                  lsp-ui-doc-include-signature t       ; Show signature
                  lsp-ui-doc-position 'at-point))

(use-package lsp-eslint
    :demand t
    :after lsp-mode)


;;; APHELEIA
;; auto-format different source code files extremely intelligently
;; https://github.com/radian-software/apheleia
(use-package apheleia
    :ensure apheleia
    :diminish ""
    :defines
    apheleia-formatters
    apheleia-mode-alist
    :functions
    apheleia-global-mode
    :config
    (setf (alist-get 'prettier-json apheleia-formatters)
          '("prettier" "--stdin-filepath" filepath))
    (apheleia-global-mode +1))


(require 'tooltip)
(tooltip-mode 1)

(require 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
              (ggtags-mode 1))))

(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)

(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C/C++

(defun linux-c-mode ()
  "C mode with adjusted defaults for use with the Linux kernel."
  (interactive)
  (c-mode)
  (c-set-style "K&R")
  (setq tab-width 8)
  (setq indent-tabs-mode t)
  (setq c-basic-offset 8))
;; Makes RET indent, and add comment leaders
(add-hook 'c-mode-common-hook
	  '(lambda ()
	    (define-key c-mode-base-map "\C-m" 'c-context-line-break)
	    (c-set-style "K&R")
	    (setq tab-width 4)
	    (setq indent-tabs-mode t)
	    (setq c-basic-offset 4)))

(push '("/usr/src/linux.*/.*\\.[ch]$" . linux-c-mode) auto-mode-alist)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Rust
;; https://github.com/rust-lang/rust-mode
(use-package rust-ts-mode
    :hook (rust-ts-mode . lsp))

;; ;; Add keybindings for interacting with Cargo
;; (use-package cargo
;;   :hook (rust-mode . cargo-minor-mode))

;; (use-package flycheck-rust
;;   :config (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

					;(setq rust-mode-hook '(lsp cargo-minor-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; golang
;; https://cs.opensource.google/go/x/tools/+/refs/tags/gopls/v0.16.2:gopls/doc/emacs.md
(add-hook 'go-mode-hook #'lsp-deferred)

;; Set up before-save hooks to format buffer and add/delete imports.
;; Make sure you don't have other gofmt/goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Doxymacs : great documentation system
;;
					;(when (require 'doxymacs)
					;    (progn
					;      (setq doxymacs-relative-path "Doc/html"
					;            doxymacs-use-external-xml-parser t)
					;      (add-hook 'c-mode-common-hook 'doxymacs-mode)
					;      (defun my-doxymacs-font-lock-hook ()
					;        (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
					;            (doxymacs-font-lock)))
					;      (add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)
					;
					;      ;; hack of doxymacs : determines where documentation is from location of current_buffer
					;      (defun mydox ()
					;        (interactive)
					;        (custom-set-variables '(doxymacs-doxygen-root
					;                                (concat "file://"
					;                                        (if (string= (substring default-directory 0 2) home-directory;)
					;                                            (concat home-directory (substring default-directory 1))
					;                                          default-directory)
					;                                        doxymacs-relative-path)))
					;        (doxymacs-rescan-tags))
					;      (define-key doxymacs-mode-map "\C-cdr" 'mydox)
					;      ))


;; perl
(push '("\\.pl$" . cperl-mode) auto-mode-alist)
(push '("\\.pm$" . cperl-mode) auto-mode-alist)
(defalias 'perl-mode 'cperl-mode)
;;(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))

(add-to-list 'auto-mode-alist '("\\.jinja\\'" . html-mode))

					; nxhtml for html/xml editing
					;(load "~/.emacs.d/nxhtml/autostart.el")
					;(setq mumamo-background-colors nil)
					;(add-to-list 'auto-mode-alist '("\\.html$" . django-html-mumamo-mode))

;; save a list of open files in ~/.emacs.desktop
;; save the desktop file automatically if it already exists
					;(setq desktop-save 'if-exists)
					;(desktop-save-mode 1)

;; save a bunch of variables to the desktop file
;; for lists specify the len of the maximal saved data also
					;(setq desktop-globals-to-save
					;      (append '((extended-command-history . 30)
					;                (file-name-history        . 100)
					;                (grep-history             . 30)
					;                (compile-history          . 30)
					;                (minibuffer-history       . 50)
					;                (query-replace-history    . 60)
					;                (read-expression-history  . 60)
					;                (regexp-history           . 60)
					;                (regexp-search-ring       . 20)
					;                (search-ring              . 20)
					;                (shell-command-history    . 50)
					;                tags-file-name
					;                register-alist)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

					; BigBrotherDataBase
					;(require 'bbdb)
					;(bbdb-initialize)

					; ldap
(require 'eudc)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; js2-mode : https://wikemacs.org/wiki/Js2-mode
(use-package "js2-mode")
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'ruby-mode-hook
	  #'(lambda ()
              (define-key ruby-mode-map "\t" 'ruby-indent-line)
	      ))

;; QML
(autoload 'qml-mode "qml-mode")
(add-to-list 'auto-mode-alist '("\\.qml$" . qml-mode))

;; TOML
(use-package toml-mode)

;; YAML
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.y.?ml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.y.?ml.gotmpl$" . yaml-mode))

;; X509 SSL Certs/keys etc
(use-package x509-mode
    :ensure t)
;; These seem to be needed to bind the mode
(add-to-list 'auto-mode-alist '("\\.\\(pem\\|crt\\|key\\)$" . x509-mode))
(add-hook 'x509-mode-hook
          (lambda () (local-set-key (kbd "C-c C-c") 'x509-dwim)))

;; elpy : extension to work with Python projects
;; https://elpy.readthedocs.io/en/latest/introduction.html
(use-package elpy
    :ensure t
    :init
    (elpy-enable))

;; For the new ruff
(require 'flymake-ruff)
(add-hook 'python-ts-mode-hook #'flymake-ruff-load)

(require 'haml-mode)

					; https://gist.github.com/tkf/3951163
;; (when (and (>= emacs-major-version 24)
;; 	   (>= emacs-minor-version 2))
;;   (eval-after-load "mumamo"
;;     '(setq mumamo-per-buffer-local-vars
;; 	   (delq 'buffer-file-name mumamo-per-buffer-local-vars))))

;; These improve window resizing
(setq redisplay-dont-pause t)
(setq frame-resize-pixelwise t)

					; General line performance
					;https://200ok.ch/posts/2020-09-29_comprehensive_guide_on_handling_long_lines_in_emacs.html
(setq bidi-paragraph-direction 'left-to-right)

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

					; https://github.com/tomalexander/orgmode-mediawiki
					;(add-to-list 'load-path (expand-file-name "~/emacs.d/orgmode-mediawiki"))
					;(require 'ox-mediawiki)
					; https://www.masteringemacs.org/article/discoverel-discover-emacs-context-menus
					;(require 'discover)
					;(global-discover-mode 0)

;; http://pragmaticemacs.com/
(global-set-key (kbd "C-x w") 'delete-frame)
(defun lbt/kill-this-buffer ()
  "Kill the current buffer."
  (interactive)
  (kill-buffer (current-buffer)))
(global-set-key (kbd "C-x k") 'lbt/kill-this-buffer)

;;(load-theme 'zenburn t)

(setq tramp-default-method "ssh")

(let ((bookmarkplus-dir "~/.emacs.d/lisp/bookmark-plus/")
      ;; (emacswiki-base "https://www.emacswiki.org/emacs/download/")
      (bookmark-first-file "bookmark+-mac.el")
      ;; (bookmark-files '("bookmark+.el" "bookmark+-mac.el" "bookmark+-bmu.el" "bookmark+-key.el" "bookmark+-lit.el" "bookmark+-1.el"))
      )
  ;; (require 'url)
  (add-to-list 'load-path bookmarkplus-dir)
  ;; (make-directory bookmarkplus-dir t)
  ;; (mapcar (lambda (arg)
  ;;           (let ((local-file (concat bookmarkplus-dir arg)))
  ;;             (unless (file-exists-p local-file)
  ;;               (url-copy-file (concat emacswiki-base arg) local-file t))))
  ;;         bookmark-files)
  (require 'bookmark+)
					; this loads the -mac.el
  (unless (file-exists-p (concat bookmarkplus-dir bookmark-first-file "c"))
    (byte-recompile-directory bookmarkplus-dir 0)))


;; Start the generic emacs server for emacsclient
(server-start)

;; New Firefox server
(require 'edit-server)
(edit-server-start)

;;(let ((bookmarkplus-dir "~/.emacs.d/custom/bookmark-plus/")
;;       (emacswiki-base "https://www.emacswiki.org/emacs/download/")
;;       (bookmark-first-file "bookmark+-mac.el")
;;       (bookmark-files '("bookmark+.el" "bookmark+-mac.el" "bookmark+-bmu.el" "bookmark+-key.el" "bookmark+-lit.el" "bookmark+-1.el")))
;;   (require 'url)
;;   (add-to-list 'load-path bookmarkplus-dir)
;;   (make-directory bookmarkplus-dir t)
;;   (mapcar (lambda (arg)
;;             (let ((local-file (concat bookmarkplus-dir arg)))
;;               (unless (file-exists-p local-file)
;;                 (url-copy-file (concat emacswiki-base arg) local-file t))))
;;           bookmark-files)
;;   ;; compile and load this first
;;   (byte-compile-file (concat bookmarkplus-dir bookmark-first-file) t)
;;   (byte-recompile-directory bookmarkplus-dir 0))


;; https://www.reddit.com/r/emacs/comments/8hpyp5/tip_how_to_execute_a_bash_function_when_saving_a/

;; (defvar *afilename-cmd*
;;   '(
;;     ("/mer/mer/devel/mer-mint/slipway/slipway/tools/sync_obs_to_releases.py" . "scp /mer/mer/devel/mer-mint/slipway/slipway/tools/sync_obs_to_releases.py root@obsdl.hz.jollamobile.com:/var/lib/slipway/slipway/slipway/tools/")
;;     ("/mer/mer/devel/mer-mint/slipway/slipway/tools/make_release.py" . "scp /mer/mer/devel/mer-mint/slipway/slipway/tools/make_release.py root@releases.hz.jollamobile.com:/var/lib/slipway/slipway/slipway/tools/")
;;     )
;;   "File association list with their respective command.")
;; (defun my/cmd-after-saved-file ()
;;   "Execute a command after saved a specific file."
;;   (let* ((match (assoc (buffer-file-name) *afilename-cmd* 'string-match-p)))
;;     (when match
;;       (shell-command (replace-regexp-in-string
;; 		      (regexp-quote "%s")
;; 		      buffer-file-name (cdr match)
;; 		      nil 'literal
;; 		      )))))
;; (add-hook 'after-save-hook 'my/cmd-after-saved-file)


;; (setq *afilename-cmd*
;;       '(
;; 	("/mer/jolla/devel/infra/it-mgmt-tools/*" .
;; 	 "scp %s root@mgmt.eos:mgmt-tools/")
;; 	("/mer/mer/devel/mer-mint/slipway/participants/.*py" .
;; 	 "scp %s root@releases2.hz.jollamobile.com:/var/lib/slipway/slipway/participants/; scp %s root@slipway.hz.jollamobile.com:/var/lib/slipway/slipway/participants/")
;; 	("/mer/mer/devel/mer-mint/slipway/participants/supervisor/.*conf" .
;; 	 "scp %s root@releases2.hz.jollamobile.com:/var/lib/slipway/slipway/participants/supervisor")
;; 	("/mer/mer/devel/mer-mint/slipway/slipway/tools/release/.*py" .
;; 	 "scp %s root@releases2.hz.jollamobile.com:/var/lib/slipway/slipway/slipway/tools/release/;scp %s root@slipway.hz.jollamobile.com:/var/lib/slipway/slipway/slipway/tools/release/;scp %s root@reports.hz.jollamobile.com:/var/lib/reports/slipway/")
;; 	("/mer/mer/devel/mer-mint/slipway/slipway/tools/.*py" .
;; 	 "scp %s root@slipway.hz.jollamobile.com:/var/lib/slipway/slipway/slipway/tools/")
;; 	))

;; This disables the stupid "pinging" when ffap thinks point is on a
;; machine name and user types C-x C-f
;; https://github.com/emacs-helm/helm/issues/648
(setq ffap-machine-p-known 'accept)

;; Icicles - minibuffer autocompletion
;; https://www.emacswiki.org/emacs/Icicles
;; this is done late in .emacs as it looks at previous keybindings
(let ((icicles-dir "~/.emacs.d/lisp/icicles/")
      (icicles-first-file "bookmark+-mac.el"))
  (add-to-list 'load-path icicles-dir)
  (unless (file-exists-p (concat icicles-dir icicles-first-file "c"))
    (byte-recompile-directory icicles-dir 0)))
(require 'icicles)
(add-hook 'desktop-after-read-hook 'icy-mode)

;; treesitter and combobulate
;; https://github.com/mickeynp/combobulate
(use-package treesit
    :mode (("\\.tsx\\'" . tsx-ts-mode))
    :preface
    (defun mp-setup-install-grammars ()
      "Install Tree-sitter grammars if they are absent."
      (interactive)
      (dolist (grammar
		;; Note the version numbers. These are the versions that
		;; are known to work with Combobulate *and* Emacs.
		'((css . ("https://github.com/tree-sitter/tree-sitter-css" "v0.20.0"))
		  (go . ("https://github.com/tree-sitter/tree-sitter-go" "v0.20.0"))
		  (html . ("https://github.com/tree-sitter/tree-sitter-html" "v0.20.1"))
		  (javascript . ("https://github.com/tree-sitter/tree-sitter-javascript" "v0.20.1" "src"))
		  (json . ("https://github.com/tree-sitter/tree-sitter-json" "v0.20.2"))
		  (markdown . ("https://github.com/ikatyang/tree-sitter-markdown" "v0.7.1"))
		  (python . ("https://github.com/tree-sitter/tree-sitter-python" "v0.20.4"))
		  (rust . ("https://github.com/tree-sitter/tree-sitter-rust" "v0.21.2"))
		  (toml . ("https://github.com/tree-sitter/tree-sitter-toml" "v0.5.1"))
		  (tsx . ("https://github.com/tree-sitter/tree-sitter-typescript" "v0.20.3" "tsx/src"))
		  (typescript . ("https://github.com/tree-sitter/tree-sitter-typescript" "v0.20.3" "typescript/src"))
		  (yaml . ("https://github.com/ikatyang/tree-sitter-yaml" "v0.5.0"))))
	(add-to-list 'treesit-language-source-alist grammar)
	;; Only install `grammar' if we don't already have it
	;; installed. However, if you want to *update* a grammar then
	;; this obviously prevents that from happening.
	(unless (treesit-language-available-p (car grammar))
          (treesit-install-language-grammar (car grammar)))))

    ;; Optional. Combobulate works in both xxxx-ts-modes and
    ;; non-ts-modes.

    ;; You can remap major modes with `major-mode-remap-alist'. Note
    ;; that this does *not* extend to hooks! Make sure you migrate them
    ;; also
    (dolist (mapping
              '((python-mode . python-ts-mode)
		(css-mode . css-ts-mode)
		(typescript-mode . typescript-ts-mode)
		(js2-mode . js-ts-mode)
		(bash-mode . bash-ts-mode)
		(conf-toml-mode . toml-ts-mode)
		(go-mode . go-ts-mode)
		(css-mode . css-ts-mode)
		(json-mode . json-ts-mode)
		(js-json-mode . json-ts-mode)))
      (add-to-list 'major-mode-remap-alist mapping))
    :config
    (mp-setup-install-grammars)
    ;; Do not forget to customize Combobulate to your liking:
    ;;
    ;;  M-x customize-group RET combobulate RET
    ;;
    (use-package combobulate
	:custom
      ;; You can customize Combobulate's key prefix here.
      ;; Note that you may have to restart Emacs for this to take effect!
      (combobulate-key-prefix "C-c o")
      :hook ((prog-mode . combobulate-mode))
      ;; Amend this to the directory where you keep Combobulate's source
      ;; code.
      :load-path ("~/.emacs.d/combobulate")
      :hook
      ((python-ts-mode . combobulate-mode)
       (js-ts-mode . combobulate-mode)
       (go-mode . go-ts-mode)
       (html-ts-mode . combobulate-mode)
       (css-ts-mode . combobulate-mode)
       (yaml-ts-mode . combobulate-mode)
       (typescript-ts-mode . combobulate-mode)
       (json-ts-mode . combobulate-mode)
       (tsx-ts-mode . combobulate-mode))
      ))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))


(defun generate-frame-title ()
  (let ((retval ""))
    (walk-window-tree (lambda (x) (setf retval (seq-concatenate 'string (buffer-name (window-buffer x)) "  " retval))))
    (setf (frame-parameter nil 'name) retval)
    retval))
(setq-default frame-title-format '(:eval (generate-frame-title)))
;; (setq-default frame-title-format '(multiple-frames ("%b <%f> @" system-name)
;; 					   ("" invocation-name "@" system-name)))

(setq-default minibuffer-follows-selected-frame t)

;; OCaml (Jane St Interview)
					;(add-to-list 'load-path "/home/david/.opam/default/share/emacs/site-lisp")
					;(require 'ocp-indent)

;; https://lwn.net/Articles/1002046/
;; https://eshelyaron.com/posts/2024-11-27-emacs-aritrary-code-execution-and-how-to-avoid-it.html
;; mitigated in emacs 30
;; (rassq-delete-all 'emacs-lisp-mode auto-mode-alist)
;; (setq enable-local-variables t)

(provide '.emace)
;;; .emacs ends here
