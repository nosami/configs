;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.
;; (setq ns-use-srgb-colorspace nil)

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
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     ;; csharp
     ;; org
     auto-completion
     better-defaults
     emacs-lisp
     erc
     ;; eyebrowse
     csharp
     ;; fsharp-git
     fsharp
     git
     markdown
     ocaml
     ;; nixos
     ;; mu4e
     ;; nyan-mode
     ;; omnisharp-emacs
     osx
     prodigy
     ;; smex
     syntax-checking
     yaml
     ;; twittering-mode
     ;; ivy
     ;; version-control
     ;; (colors :variables colors-enable-nyan-cat-progress-bar t)
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   ;; dotspacemacs-additional-packages '(csharp-mode shut-up)
   dotspacemacs-additional-packages '(evil-terminal-cursor-changer)
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
  (setq projectile-enable-caching 't)
  ;; use standard modifiers for railwaycat emacs
  (when (equal system-type 'darwin)
    (setq mac-option-modifier 'meta) ;; Bind meta to ALT
    (setq mac-command-modifier 'super) ;; Bind apple/command to  super if you want
    (setq mac-function-modifier 'hyper)) ;; Bind function key to hyper if you want 
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq mac-pass-command-to-system nil)
  (setq-default
   ;; Either `vim' or `emacs'. Evil is always enabled but if the variable
   ;; is `emacs' then the `holy-mode' is enabled at startup.
   dotspacemacs-editing-style 'hybrid
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
                               :size 14
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
   dotspacemacs-fullscreen-use-non-native 't
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 100
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 100
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
  ;; (set-frame-parameter (selected-frame) 'alpha '(60 60))
  ;; User initialization goes here
 
  )
(defun start-omni-server-for-omnisharp-emacs-development ()
  (interactive)
  (add-to-list 'load-path "/home/jason/.emacs.d/private/omnisharp-emacs/extensions/omnisharp-emacs/")
  (require 'omnisharp)
  (setq omnisharp-debug t)
  (setq omnisharp-server-executable-path
        "/Users/jason/src/omnisharp-roslyn/scripts/Omnisharp")
  (load-file "/Users/jason/.emacs.d/private/omnisharp-emacs/extensions/omnisharp-emacs/test/buttercup-tests/setup.el"))

(defun setup-mac-meta-keys ()
  (spacemacs/toggle-maximize-frame-on)
  (let ((m window-numbering-keymap))
    ;; On UK MBP keyboards, META key is used to insert certain characters clear the key
    (define-key m "\M-0" nil)
    (define-key m "\M-1" nil)
    (define-key m "\M-2" nil)
    (define-key m "\M-3" nil)
    (define-key m "\M-4" nil)
    (define-key m "\M-5" nil)
    (define-key m "\M-6" nil)
    (define-key m "\M-7" nil)
    (define-key m "\M-8" nil)
    (define-key m "\M-9" nil)

    ;; http://stackoverflow.com/questions/3977069/emacs-question-hash-key
    (global-set-key (kbd "M-2") '(lambda () (interactive) (insert "€")))
    (global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))
    (define-key isearch-mode-map (kbd "M-3")
      '(lambda ()
         (interactive)
         (isearch-process-search-char ?\#)))))

(defun dotspacemacs/user-config ()
  "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."
  (setq tramp-ssh-controlmaster-options "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")
  (setq powerline-default-separator 'wave)
  ;; omnisharp
  (add-hook 'csharp-mode-hook 'my-csharp-mode)
  ;; (fsharp-git/init-fsharp-git)
  (global-set-key (kbd "s-<return>") 'inferior-fsharp-eval-region)
  ;; text size
  (global-set-key (kbd "C-+") 'text-scale-increase)
  (global-set-key (kbd "C-=") 'text-scale-increase)
  (global-set-key (kbd "C--") 'text-scale-decrease)
  ;; window movement
  (global-set-key (kbd "s-h") 'windmove-left)
  (global-set-key (kbd "s-l") 'windmove-right)
  (global-set-key (kbd "s-j") 'windmove-down)
  (global-set-key (kbd "s-k") 'windmove-up)
  (global-set-key (kbd "s-/") 'evilnc-comment-or-uncomment-lines)
  (global-set-key (kbd "s-[") 'evil-shift-left)
  (global-set-key (kbd "s-]") 'evil-shift-right)

  (global-set-key (kbd "M-<tab>") 'spacemacs//workspaces-eyebrowse-next-window-config-n)
  (global-set-key (kbd "s-1") 'eyebrowse-switch-to-window-config-1)
  (global-set-key (kbd "s-2") 'eyebrowse-switch-to-window-config-2)
  (global-set-key (kbd "s-3") 'eyebrowse-switch-to-window-config-3)
  (global-set-key (kbd "s-4") 'eyebrowse-switch-to-window-config-4)
  (global-set-key (kbd "s-5") 'eyebrowse-switch-to-window-config-5)
  (global-set-key (kbd "s-6") 'eyebrowse-switch-to-window-config-6)
  (global-set-key (kbd "s-7") 'eyebrowse-switch-to-window-config-7)
  (global-set-key (kbd "s-8") 'eyebrowse-switch-to-window-config-8)
  (global-set-key (kbd "s-9") 'eyebrowse-switch-to-window-config-9)
  (global-set-key (kbd "H-<backspace>") 'delete-char)
  (setup-mac-meta-keys)
  ;; whitespace
  (global-whitespace-mode)
  (setq whitespace-style '(trailing tabs tab-mark))
  (setq vc-follow-symlinks t)
  ;; (define-key global-map (kbd "s-j") 'ace-jump-mode)

  ;; better than vim-vinegar
  (require 'dired)
  (define-key evil-normal-state-map (kbd "-") 'dired-jump)
  (define-key dired-mode-map (kbd "-") 'dired-up-directory)
  ;; company mode
  (setq company-idle-delay 0.03)
  (setq company-minimum-prefix-length 1)
  (setq company-require-match 'nil)
  (setq company-show-numbers 't) 
  ;; use flex matching for company
  (setq omnisharp-company-match-type 'company-match-flx)
  (setq gc-cons-threshold 20000000)

  (setq flycheck-display-errors-delay 0)
  ;; don't show inline error display when company popup is active
  (setq flycheck-display-errors-function 'my-flycheck-pos-tip-error-messages)

  (setq ac-auto-show-menu 0.05)
  (setq ac-delay 0.05)
  (setq ac-menu-height 20)

  (def-omnisharp-service
    "omnisharp-roslyn stdio"
    "./omnisharp-roslyn/omnisharp"
    '("-v" "-s" "test/MinimalSolution/" "--stdio"))

  (def-omnisharp-service
    "omnisharp-emacs integration tests"
    "run-integration-tests.sh")

  (def-omnisharp-service
    "omnisharp-emacs unit tests"
    "run-tests.sh")

  (def-omnisharp-service
    "omnisharp-emacs installation test"
    "run-melpa-build-test.sh")

  ;; (let ((default-directory "/usr/local/share/emacs/site-lisp/"))
  ;;   (normal-top-level-add-subdirs-to-load-path))
  (setq mu4e-mu-binary "/usr/local/bin/mu")
  (defun my-render-html-message ()
    (let ((dom (libxml-parse-html-region (point-min) (point-max))))
      (erase-buffer)
      (shr-insert-document dom)
      (goto-char (point-min))))

  (setq mu4e-html2text-command 'my-render-html-message)
  ;; (fsharp-git/init-fsharp-git)
  )

(defmacro def-omnisharp-service (name command &optional args-to-command)
     (let ((omni-dir "~/.emacs.d/private/omnisharp-emacs/extensions/omnisharp-emacs/"))
       `(prodigy-define-service
          :name ,name
          :args ,args-to-command
          :command (concat ,omni-dir ,command)
          :cwd ,omni-dir
          :stop-signal 'kill
          :kill-process-buffer-on-stop t
          :truncate-output 200
          :tags '(omnisharp))))

;;
(defun my-flycheck-pos-tip-error-messages (errors)
  ;; don't show inline error display when company popup is active
  (when (not (company-search-mode))
    (flycheck-pos-tip-error-messages errors))
  )

(defun my-company-fixes(company-callee other-callee)
  (interactive)
  ;; no idea why this is needed.
  ;; seems like company-mode-map isn't active at times
  ;; when it should be.
  (if (company-search-mode)
    (funcall company-callee)
    (funcall other-callee))
  )

(defun my-csharp-mode ()
  (yas-minor-mode)
  (omnisharp-mode)
  ;; (flycheck-mode)
  (linum-mode)
  ;; (whole-line-or-region-mode)
  ;; (add-to-list 'ac-sources 'ac-source-omnisharp)
  (electric-pair-mode)
  (company-mode)
  ;; strange company mode map fixes
  ;; (evil-define-key 'insert omnisharp-mode-map (kbd "<return>") (lambda() (interactive) (my-company-fixes 'company-complete-selection 'evil-ret)))
  ;; (evil-define-key 'insert omnisharp-mode-map (kbd "RET") (lambda() (interactive) (my-company-fixes 'company-complete-selection 'evil-ret)))
  (evil-define-key 'insert omnisharp-mode-map (kbd "C-j") (lambda() (interactive) (my-company-fixes 'company-select-next 'electric-newline-and-maybe-indent)))
  (evil-define-key 'insert omnisharp-mode-map (kbd "C-k") (lambda() (interactive) (my-company-fixes 'company-select-previous 'evil-insert-digraph)))
  ;; end strangeness

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
  (evil-define-key 'insert omnisharp-mode-map (kbd ";") (lambda() (interactive) (omnisharp-format-on-keystroke ";")))
  (evil-define-key 'insert omnisharp-mode-map (kbd "}") (lambda() (interactive) (omnisharp-format-on-keystroke "}")))

  ;; (evil-define-key 'insert omnisharp-mode-map (kbd ".") (lambda() (interactive) (company-complete-selection-insert-key-and-complete '".")))
  ;; (evil-define-key 'insert omnisharp-mode-map (kbd "]") (lambda() (interactive) (company-complete-selection-insert-key-and-complete '"]")))
  ;; (evil-define-key 'insert omnisharp-mode-map (kbd "[") (lambda() (interactive) (company-complete-selection-insert-key '"[")))
  ;; (evil-define-key 'insert omnisharp-mode-map (kbd ")") (lambda() (interactive) (company-complete-selection-insert-key '")")))
  ;; (evil-define-key 'insert omnisharp-mode-map (kbd "<SPC>") nil)
  ;; (evil-define-key 'insert omnisharp-mode-map (kbd ";") (lambda() (interactive) (company-complete-selection-insert-key '";")))
  ;; (evil-define-key 'insert omnisharp-mode-map (kbd ">") (lambda() (interactive) (company-complete-selection-insert-key '">")))
  
  (define-key company-active-map (kbd ".") (lambda() (interactive) (company-complete-selection-insert-key-and-complete '".")))
  (define-key company-active-map (kbd "]") (lambda() (interactive) (company-complete-selection-insert-key-and-complete '"]")))
  (define-key company-active-map (kbd "[") (lambda() (interactive) (company-complete-selection-insert-key '"[")))
  (define-key company-active-map (kbd ")") (lambda() (interactive) (company-complete-selection-insert-key '")")))
  (define-key company-active-map (kbd "<SPC>") nil)
  (define-key company-active-map (kbd ";") (lambda() (interactive) (company-complete-selection-insert-key '";")))
  (define-key company-active-map (kbd ">") (lambda() (interactive) (company-complete-selection-insert-key '">")))

  ;; (define-key omnisharp-mode-map (kbd "}") 'csharp-indent-function-on-closing-brace) 

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
  (define-key omnisharp-mode-map (kbd "<f5>") 'revert-omnisharp-file)
  (setq c-basic-offset 4) ; indents 4 chars
  (setq tab-width 4)          ; and 4 char wide for TAB
  (setq indent-tabs-mode nil) ; And force use of spaces
  (setq eldoc-idle-delay 0.1
        flycheck-display-errors-delay 0.2)
  (turn-on-eldoc-mode))

;; Company mode stuff
(defun company-complete-selection-insert-key(company-key)
  (if (not (null company-candidates))
      (company-complete-selection))
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

(defun find-omnisharp-emacs-file ()
  (interactive)
  "Edit the `file' in the spacemacs base directory, in the current window."
  (ido-find-file-in-dir "~/.emacs.d/private/omnisharp-emacs/extensions/omnisharp-emacs"))
;alist of 'buffer-name / timer' items
(defvar buffer-tail-alist nil)
(defun buffer-tail (name)
  "follow buffer tails"
  (cond ((or (equal (buffer-name (current-buffer)) name)
         (string-match "^ \\*Minibuf.*?\\*$" (buffer-name (current-buffer)))))
        ((get-buffer name)
      (with-current-buffer (get-buffer name)
        (goto-char (point-max))
        (let ((windows (get-buffer-window-list (current-buffer) nil t)))
          (while windows (set-window-point (car windows) (point-max))
         (with-selected-window (car windows) (recenter -3)) (setq windows (cdr windows))))))))

(defun toggle-buffer-tail (name &optional force)
  "toggle tailing of buffer NAME. when called non-interactively, a FORCE arg of 'on' or 'off' can be used to to ensure a given state for buffer NAME"
  (interactive (list (cond ((if name name) (read-from-minibuffer 
      (concat "buffer name to tail" 
        (if buffer-tail-alist (concat " (" (caar buffer-tail-alist) ")") "") ": ")
    (if buffer-tail-alist (caar buffer-tail-alist)) nil nil
           (mapcar '(lambda (x) (car x)) buffer-tail-alist)
        (if buffer-tail-alist (caar buffer-tail-alist)))) nil)))
  (let ((toggle (cond (force force) ((assoc name buffer-tail-alist) "off") (t "on")) ))
    (if (not (or (equal toggle "on") (equal toggle "off"))) 
      (error "invalid 'force' arg. required 'on'/'off'") 
      (progn 
        (while (assoc name buffer-tail-alist) 
           (cancel-timer (cdr (assoc name buffer-tail-alist)))
           (setq buffer-tail-alist (remove* name buffer-tail-alist :key 'car :test 'equal)))
        (if (equal toggle "on")
            (add-to-list 'buffer-tail-alist (cons name (run-at-time t 1 'buffer-tail name))))
        (message "toggled 'tail buffer' for '%s' %s" name toggle)))))

(defun revert-omnisharp-file ()
  "Revert buffer without confirmation."
  (interactive)
  (save-buffer)
  (revert-buffer t t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-case-fold-search nil)
 '(ahs-default-range (quote ahs-range-whole-buffer))
 '(ahs-idle-interval 0.25)
 '(ahs-idle-timer 0 t)
 '(ahs-inhibit-face-list nil)
 '(powerline-default-separator (quote wave))
 '(powerline-height 15)
 '(ring-bell-function (quote ignore) t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; '(default ((t (:background "black" :foreground "#fdf4c1"))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(powerline-active1 ((t (:inherit mode-line :background "gray28")))))
