;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     better-defaults
     emacs-lisp
     git
     csharp
     ;; markdown
     ;; org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     syntax-checking
     version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."
  ;; use standard modifiers for railwaycat emacs
  (when (equal system-type 'darwin)
    (setq mac-option-modifier 'meta) ;; Bind meta to ALT
    (setq mac-command-modifier 'super) ;; Bind apple/command to  super if you want
    (setq mac-function-modifier 'hyper)) ;; Bind function key to hyper if you want 
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Either `vim' or `emacs'. Evil is always enabled but if the variable
   ;; is `emacs' then the `holy-mode' is enabled at startup.
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer.
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed.
   dotspacemacs-startup-banner nil
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'."
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(gruvbox
                         monokai
                         solarized-dark
                         solarized-light
                         spacemacs-dark
                         spacemacs-light
                         leuven
                         zenburn)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 12
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it.
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; Default value is `cache'.
   dotspacemacs-auto-save-file-location 'cache
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f) is replaced.
   dotspacemacs-use-ido nil
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content.
   dotspacemacs-enable-paste-micro-state nil
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay 0.4
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil ;; to boost the loading time.
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up.
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line.
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen.
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible value is `all',
   ;; `current' or `nil'. Default is `all'
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil
   )
  ;; User initialization goes here
  )

(defun dotspacemacs/config ()
  "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."
  
  ;; omnisharp
  (add-hook 'csharp-mode-hook 'my-csharp-mode)
  ;; text size
  (global-set-key (kbd "C-+") 'text-scale-increase)
  (global-set-key (kbd "C-=") 'text-scale-increase)
  (global-set-key (kbd "C--") 'text-scale-decrease)
  ;; window movement
  (global-set-key (kbd "s-h") 'windmove-left)
  (global-set-key (kbd "s-l") 'windmove-right)
  (global-set-key (kbd "s-j") 'windmove-down)
  (global-set-key (kbd "s-k") 'windmove-up)
  ;; whitespace
  (global-whitespace-mode)
  (setq whitespace-style '(trailing tabs tab-mark))

  (define-key global-map (kbd "s-j") 'ace-jump-mode)

  ;; better than vim-vinegar
  (require 'dired)
  (define-key evil-normal-state-map (kbd "-") 'dired-jump)
  (define-key dired-mode-map (kbd "-") 'dired-up-directory)
  ;; only flycheck in normal mode
  ;; (add-hook 'evil-insert-state-exit-hook (lambda() (interactive) (spacemacs/toggle-syntax-checking)))
  ;; (add-hook 'evil-normal-state-exit-hook (lambda() (interactive) (spacemacs/toggle-syntax-checking)))
  )

(defun my-csharp-mode ()
  (yas-minor-mode)
  (omnisharp-mode)
  (company-mode)
  (flycheck-mode)
  (linum-mode)
  ;; (whole-line-or-region-mode)
  ;; use flex matching for company
  (setq omnisharp-company-match-type 'company-match-flx)
  (setq gc-cons-threshold 20000000)
  (electric-pair-mode)
  (evil-define-key 'normal omnisharp-mode-map (kbd "g d") 'omnisharp-go-to-definition)
  (evil-define-key 'normal omnisharp-mode-map (kbd "<SPC> ob") 'omnisharp-build-in-emacs)
  (evil-define-key 'normal omnisharp-mode-map (kbd "<SPC> ocf") 'omnisharp-code-format)
  (evil-define-key 'normal omnisharp-mode-map (kbd "<SPC> or") 'omnisharp-rename-interactively)
  (evil-define-key 'normal omnisharp-mode-map (kbd "<SPC> ofu") 'omnisharp-helm-find-usages)
  (evil-define-key 'normal omnisharp-mode-map (kbd "<M-RET>") 'omnisharp-run-code-action-refactoring)
  (evil-define-key 'normal omnisharp-mode-map (kbd "<SPC> oss") 'omnisharp-start-omnisharp-server)
  (evil-define-key 'normal omnisharp-mode-map (kbd "<SPC> osp") 'omnisharp-stop-omnisharp-server)
  (evil-define-key 'normal omnisharp-mode-map (kbd "<SPC> ofi") 'omnisharp-find-implementations)
  (evil-define-key 'normal omnisharp-mode-map (kbd "<SPC> ox") 'omnisharp-fix-code-issue-at-point)
  (evil-define-key 'normal omnisharp-mode-map (kbd "<SPC> ofx") 'omnisharp-fix-usings)
  (evil-define-key 'normal omnisharp-mode-map (kbd "<SPC> oo") 'omnisharp-auto-complete-overrides)
  (define-key company-active-map (kbd ".") (lambda() (interactive) (company-complete-selection-insert-key-and-complete '".")))
  (define-key company-active-map (kbd "]") (lambda() (interactive) (company-complete-selection-insert-key-and-complete '"]")))
  (define-key company-active-map (kbd "[") (lambda() (interactive) (company-complete-selection-insert-key '"[")))
  (define-key company-active-map (kbd ")") (lambda() (interactive) (company-complete-selection-insert-key '")")))
  (define-key company-active-map (kbd "<SPC>") nil)
  (define-key company-active-map (kbd ";") (lambda() (interactive) (company-complete-selection-insert-key '";")))
  (define-key company-active-map (kbd ">") (lambda() (interactive) (company-complete-selection-insert-key '">")))
  (define-key omnisharp-mode-map (kbd "}") 'csharp-indent-function-on-closing-brace) 
  (define-key omnisharp-mode-map (kbd "<RET>") 'csharp-newline-and-indent) 

  (define-key omnisharp-mode-map (kbd "<f12>") 'omnisharp-go-to-definition)
  (define-key omnisharp-mode-map (kbd "s-d") 'omnisharp-go-to-definition)
  (define-key omnisharp-mode-map (kbd "S-s-<up>") 'omnisharp-navigate-up)
  (define-key omnisharp-mode-map (kbd "S-s-<down>") 'omnisharp-navigate-down)
  (define-key omnisharp-mode-map (kbd "S-<f12>") 'omnisharp-helm-find-usages)

  (define-key omnisharp-mode-map (kbd "s-u") 'omnisharp-helm-find-usages)
  (define-key omnisharp-mode-map (kbd "s-i") 'omnisharp-helm-find-implementations)
  (define-key omnisharp-mode-map (kbd "S-s-<f12>") 'omnisharp-helm-find-usages)
  (define-key omnisharp-mode-map (kbd "<M-RET>") 'omnisharp-run-code-action-refactoring)
  (define-key omnisharp-mode-map (kbd "C-.") 'omnisharp-run-code-action-refactoring)

  (define-key omnisharp-mode-map (kbd "C-k C-d") 'omnisharp-code-format)
  (define-key omnisharp-mode-map (kbd "C-d") 'duplicate-current-line-or-region)

  (define-key omnisharp-mode-map (kbd "<f2>") 'omnisharp-rename-interactively)
  (define-key omnisharp-mode-map (kbd "<f5>") 'omnisharp-build-in-emacs)
  ;; (add-to-list 'company-backends 'company-omnisharp)
  (setq c-basic-offset 4) ; indents 4 chars
  (setq tab-width 4)          ; and 4 char wide for TAB
  (setq indent-tabs-mode nil) ; And force use of spaces
  ;; (setq eldoc-idle-delay 0.1
  ;;       flycheck-display-errors-delay 0.2)
  (setq eldoc-idle-delay 0.1)
  (turn-on-eldoc-mode))

;; Company mode stuff
(defun company-complete-selection-insert-key(company-key)
  (company-complete-selection)
  (insert company-key))

(defun company-complete-selection-insert-key-and-complete(company-key)
  (company-complete-selection-insert-key company-key)
  (company-complete))

(defun csharp-indent-function-on-closing-brace()
  (interactive)
  (insert "}")
  (c-indent-defun))

(defun csharp-newline-and-indent ()
  "Open a newline and indent.
If point is between a pair of braces, opens newlines to put braces
on their own line."
  (interactive)
  (save-excursion
    (save-match-data
      (when (and
             (looking-at " *}")
             (save-match-data
               (when (looking-back "{ *")
                 (goto-char (match-beginning 0))
                 (unless (looking-back "^[[:space:]]*")
                   (newline-and-indent))
                 t)))
        (unless (and (boundp electric-pair-open-newline-between-pairs)
                     electric-pair-open-newline-between-pairs
                     electric-pair-mode)
          (goto-char (match-beginning 0))
          (newline-and-indent)))))
  (newline-and-indent)) 
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.