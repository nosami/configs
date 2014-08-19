(message "-")
;; Allow hash to be entered on UK mac keyboard
(global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))

(defun find-project-root ()
  (interactive)
  (if (ignore-errors (eproject-root))
      (eproject-root)
    (or (find-git-repo (buffer-file-name)) (file-name-directory (buffer-file-name)))))

(defun find-git-repo (dir)
  (if (string= "/" dir)
      nil
    (if (file-exists-p (expand-file-name "../.git/" dir))
        dir
      (find-git-repo (expand-file-name "../" dir)))))


(defun file-path-to-namespace ()
  (interactive)
  (let (
        (root (find-project-root))
        (base (file-name-nondirectory buffer-file-name))
        )
    (substring (replace-regexp-in-string "/" "\." (substring buffer-file-name (length root) (* -1 (length base))) t t) 0 -1)
    )
  )

(defun csharp-should-method-space-replace ()
  "When pressing space while naming a defined method, insert an underscore"
  (interactive)
  (if (and (looking-back "void Should.*")
           (not (and
                 (looking-at ".*)$")
                 (looking-back "(.*"))))
      (insert "_")
    (insert " ")))

(eval-after-load 'csharp-mode
  '(progn
     (define-key csharp-mode-map (kbd "SPC") 'csharp-should-method-space-replace)))

(add-to-list 'exec-path "/usr/local/bin")
;Recursively add site-lisp to the load path
;Make sure custom stuff goes to the front of the list
(let ((default-directory "~/src/elisp"))
  (let ((old-path (copy-sequence load-path))
		(new-load-path nil))
	(normal-top-level-add-to-load-path '("."))
	(normal-top-level-add-subdirs-to-load-path)
	(dolist (var load-path)
	  (unless (memql var old-path)
		(add-to-list 'new-load-path var)
		(setq load-path (append new-load-path old-path))))))

(set-scroll-bar-mode nil)
(require 'package)
(package-initialize)
(setq evil-want-C-u-scroll t)
(require 'evil-jumper)
(require 'evil-visualstar)
(global-evil-leader-mode)
(global-evil-tabs-mode t)
(evil-mode 1)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(tool-bar-mode -1)
(message "0")
(load-theme 'monokai t)
;;(if (not (display-graphic-p))
;;  (set-background-color "ARGBBB000000"))
;;; Install fsharp-mode
(unless (package-installed-p 'fsharp-mode)
  (package-install 'fsharp-mode))

(require 'fsharp-mode)

(global-linum-mode t)
;;(setq linum-format "%d ")

(setq yas-snippet-dirs
      '("~/src/yasnippet-csharp"))

(yas-global-mode 1)

(require 'mouse)
;; (xterm-mouse-mode t)
;; (defun track-mouse (e)) 
;; (setq mouse-sel-mode t)
(defun scroll-up-n-lines ()
  "Scroll up n lines"
  (interactive)
  (scroll-up 2))

(defun scroll-down-n-lines ()
  "Scroll down n lines"
  (interactive)
  (scroll-down 2))

(global-set-key (kbd "<mouse-4>") 'scroll-down-n-lines)
(global-set-key (kbd "<mouse-5>") 'scroll-up-n-lines)

(defun toggle-fullscreen ()
  "Toggle full screen"
  (interactive)
  (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth)))

(global-set-key (kbd "C-<return>") 'toggle-fullscreen)

(setq compilation-ask-about-save nil)
(message "0a")

(require 'company)
(require 'csharp-mode)
(require 'omnisharp)
(defun my-csharp-mode ()
  (add-to-list 'company-backends 'company-omnisharp)
  (omnisharp-mode)
  (company-mode)
  (flycheck-mode)
  (turn-on-eldoc-mode))

(setq omnisharp-company-strip-trailing-brackets nil)
(message "0b")
(add-hook 'csharp-mode-hook 'my-csharp-mode)
(message "0bb")

(message "0d")
(add-hook 'emacs-lisp-mode 'company-mode)
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
(message "0e")
(setq company-begin-commands '(self-insert-command))
(add-hook 'after-init-hook 'global-flycheck-mode)
  
(message "0c")

(add-to-list 'company-backends 'company-omnisharp)

(lexical-let ((default-color (cons (face-background 'mode-line)
                                     (face-foreground 'mode-line))))
    (add-hook 'post-command-hook
      (lambda ()
        (let ((color (cond ((minibufferp) default-color)
                           ((evil-insert-state-p) '("#e80000" . "#ffffff"))
                           ((evil-emacs-state-p)  '("#444488" . "#ffffff"))
                           ((buffer-modified-p)   '("#006fa0" . "#ffffff"))
                           (t default-color))))
          (set-face-background 'mode-line (car color))
          (set-face-foreground 'mode-line (cdr color))))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-frontends
   (quote
    (company-pseudo-tooltip-frontend company-echo-metadata-frontend)))
 '(company-idle-delay 0.03)
 '(company-minimum-prefix-length 1)
 '(company-show-numbers t)
 '(helm-ag-insert-at-point (quote word))
 '(omnisharp-auto-complete-want-documentation nil)
 '(omnisharp-company-sort-results t)
 '(safe-local-variable-values
   (quote
    ((eval when
	   (fboundp
	    (quote rainbow-mode))
	   (rainbow-mode 1)))))
 '(savehist-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-annotation ((t (:inherit company-tooltip :foreground "yellow")))))
(global-hl-line-mode 1)
(message "1")

;Load up certain files every time
;(find-file "~/emacs/dotemacs.el")
(file-cache-add-directory "~/.vim/bundle/Omnisharp" ".*")
(setq c-basic-offset 4) ; indents 4 chars
(setq tab-width 4)          ; and 4 char wide for TAB
(setq indent-tabs-mode nil) ; And force use of spaces 
;; To customize the background color
(set-face-background 'hl-line "#333")

(require 'key-chord)
(key-chord-mode 1)

(setq key-chord-one-key-delay 0.2)
(setq key-chord-two-keys-delay 0.15)
(define-key evil-normal-state-map (kbd "<SPC> a") 'helm-ag)
(key-chord-define evil-insert-state-map "jk"  'evil-normal-state) 
(key-chord-define evil-replace-state-map "jk"  'evil-normal-state) 
(key-chord-define evil-insert-state-map "kj"  'evil-normal-state) 
(key-chord-define evil-replace-state-map "kj"  'evil-normal-state) 
(key-chord-define global-map "fj" 'smex)
;; (key-chord-define evil-insert-state-map "
;; (define-key evil-insert-state-map (kbd "j k") 'evil-normal-state)

;; (define-key evil-insert-state-map (kbd "k j") 'evil-normal-state)
(define-key evil-normal-state-map (kbd "C-p") 'helm-for-files)
(define-key evil-normal-state-map (kbd "<SPC> e") 'find-file)
(define-key evil-normal-state-map (kbd "<SPC> w") 'evil-write)

(evil-define-key 'normal omnisharp-mode-map (kbd "g d") 'omnisharp-go-to-definition)
(evil-define-key 'normal omnisharp-mode-map (kbd "<SPC> b") 'omnisharp-build-in-emacs)
(evil-define-key 'normal omnisharp-mode-map (kbd "<SPC> cf") 'omnisharp-code-format)
(evil-define-key 'normal omnisharp-mode-map (kbd "<SPC> nm") 'omnisharp-rename-interactively)
(evil-define-key 'normal omnisharp-mode-map (kbd "<SPC> fu") 'omnisharp-helm-find-usages)
(evil-define-key 'normal omnisharp-mode-map (kbd "<SPC> ss") 'omnisharp-start-omnisharp-server)
(evil-define-key 'normal omnisharp-mode-map (kbd "<SPC> sp") 'omnisharp-stop-omnisharp-server)
(evil-define-key 'normal omnisharp-mode-map (kbd "<SPC> fi") 'omnisharp-find-implementations)
(evil-define-key 'normal omnisharp-mode-map (kbd "<SPC> x") 'omnisharp-fix-code-issue-at-point)
(evil-define-key 'normal omnisharp-mode-map (kbd "<SPC> fx") 'omnisharp-fix-usings)
(define-key evil-normal-state-map (kbd "M-J") 'flycheck-next-error)
(define-key evil-normal-state-map (kbd "M-K") 'flycheck-previous-error)

(define-key evil-normal-state-map (kbd "<SPC> cc") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd "<SPC> cc") 'evilnc-comment-or-uncomment-lines)
(define-key evil-normal-state-map (kbd "<SPC> c <SPC>") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd "<SPC> c <SPC>") 'evilnc-comment-or-uncomment-lines)
(define-key evil-normal-state-map (kbd "<SPC> cn") 'next-error)
(define-key evil-normal-state-map (kbd "<SPC> cp") 'previous-error)
(define-key evil-insert-state-map (kbd "<RET>") 'newline-and-indent)

(define-key company-active-map (kbd "C-j") 'company-select-next-or-abort)
(define-key company-active-map (kbd "C-k") 'company-select-previous-or-abort)

(define-key evil-normal-state-map (kbd "<SPC> <SPC>") 'ace-jump-mode)
(mapc (lambda (mode) (evil-set-initial-state mode 'emacs))
      '(eshell-mode
	git-rebase-mode
	term-mode
	magit-branch-manager-mode
	eww-mode
	))

;;change default browser for 'browse-url' to eww
(setq browse-url-browser-function 'eww-browse-url)

(eval-after-load "eww"
  '(progn (define-key eww-mode-map "f" 'eww-lnum-follow)
	  (define-key eww-mode-map (kbd "o") 'eww)
	  
	  (define-key eww-mode-map (read-kbd-macro "/") 'evil-search-forward)
	  (define-key eww-mode-map (read-kbd-macro "?") 'evil-search-backward)
	  (define-key eww-mode-map (read-kbd-macro "n") 'evil-search-next)
	  (define-key eww-mode-map (read-kbd-macro "N") 'evil-search-previous)
	  (define-key eww-mode-map (read-kbd-macro "r") 'eww-reload)

	  
	  (define-key eww-mode-map (read-kbd-macro "j") 'evil-next-line)
	  (define-key eww-mode-map (read-kbd-macro "k") 'evil-previous-line)
	  (define-key eww-mode-map (read-kbd-macro "C-j") (lambda () (interactive) (next-line 2) (scroll-up 2)))
	  (define-key eww-mode-map (read-kbd-macro "C-k") (lambda () (interactive) (scroll-down 2) (previous-line 2)))
	  (define-key eww-mode-map (read-kbd-macro "d") 'evil-scroll-down)
	  (define-key eww-mode-map (read-kbd-macro "u") 'evil-scroll-up)

	  (define-key eww-mode-map (read-kbd-macro "C-d") 'evil-scroll-down)
	  (define-key eww-mode-map (read-kbd-macro "C-u") 'evil-scroll-up)
	  
	  (define-key eww-mode-map (read-kbd-macro "b") 'eww-back-url)
	  (define-key eww-mode-map (read-kbd-macro "<backspace>") 'eww-back-url)
	  (define-key eww-mode-map (read-kbd-macro "S-<backspace>") 'eww-forward-url)
          (define-key eww-mode-map "F" 'eww-lnum-universal)))


;; (require 'w3m-load)
;; (define-key w3m-mode-map (kbd "f") 'w3m-lnum-follow)
;; (define-key w3m-mode-map (kbd "o") 'w3m-goto-url)
;; (define-key w3m-mode-map (kbd "<SPC>") 'ace-jump-mode)
;; (define-key w3m-mode-map (kbd "C-u") 'w3m-scroll-down-or-previous-url)
;; (define-key w3m-mode-map (kbd "C-d") 'w3m-scroll-up-or-next-url)
;; (define-key w3m-mode-map (kbd "C-u") 'w3m-view-previous-page)
(require 'twittering-mode)
(define-key twittering-mode-map (kbd "C-d") 'twittering-scroll-up)
(define-key twittering-mode-map (kbd "C-u") 'twittering-scroll-down)
(define-key twittering-mode-map (read-kbd-macro "/") 'evil-search-forward)
(define-key twittering-mode-map (read-kbd-macro "?") 'evil-search-backward)
(define-key twittering-mode-map (read-kbd-macro "n") 'evil-search-next)
(define-key twittering-mode-map (read-kbd-macro "N") 'evil-search-previous)
(define-key twittering-mode-map (kbd "<tab>") 'twittering-goto-next-uri)
(setq twittering-use-master-password t)

(defun company-complete-selection-insert-key(company-key)
  (company-complete-selection)
  (insert company-key))

(defun company-complete-selection-insert-key-and-complete(company-key)
  (company-complete-selection-insert-key company-key)
  (company-complete))

;; better than vim-vinegar
(define-key evil-normal-state-map (kbd "-") 'dired-jump)
(define-key dired-mode-map (kbd "-") 'dired-up-directory)

(define-key company-active-map (kbd ".") (lambda() (interactive) (company-complete-selection-insert-key-and-complete '".")))
(define-key company-active-map (kbd "(") (lambda() (interactive) (company-complete-selection-insert-key-and-complete '"(")))
(define-key company-active-map (kbd "]") (lambda() (interactive) (company-complete-selection-insert-key-and-complete '"]")))
(define-key company-active-map (kbd "[") (lambda() (interactive) (company-complete-selection-insert-key '"[")))
(define-key company-active-map (kbd ")") (lambda() (interactive) (company-complete-selection-insert-key '")")))
(define-key company-active-map (kbd "<SPC>") nil)
(define-key company-active-map (kbd ";") (lambda() (interactive) (company-complete-selection-insert-key '";")))
(define-key company-active-map (kbd ">") (lambda() (interactive) (company-complete-selection-insert-key '">")))

(global-set-key (kbd "C-x f") 'helm-for-files)
(require 'smex) ; Not needed if you use package.el
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                  ; when Smex is auto-initialized on its first run.
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(setq inhibit-splash-screen t) ;;disable splash screen
(fset 'yes-or-no-p 'y-or-n-p) ;;stop asking me to type ‘yes’ as a confirmation
(show-paren-mode t)
;;Ido mode for file completion:
(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-create-new-buffer 'always)
;;ido for better buffer management:
(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)
(global-set-key (kbd "C-x C-f") 'helm-for-files)
;;window movement
(global-set-key (kbd "C-h") 'windmove-left)
(global-set-key (kbd "C-l") 'windmove-right)
(global-set-key (kbd "C-j") 'windmove-down)
(global-set-key (kbd "C-k") 'windmove-up)
(autoload 'ibuffer "ibuffer" "List buffers." t)
;;Make emacs backups happen elsewhere:
(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/")))) ;; Save all backup file in this directory.
(setq auto-save-file-name-transforms `((".*", "~/.emacs_backups/" t)))
(require 'highlight-parentheses)
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)
(setq ring-bell-function 'ignore)

;; (require 'w3m-load)

(define-key evil-normal-state-map (kbd "<SPC> rt") (lambda() (interactive) (omnisharp-unit-test "single")))
(define-key evil-normal-state-map (kbd "<SPC> rf") (lambda() (interactive) (omnisharp-unit-test "fixture")))
(define-key evil-normal-state-map (kbd "<SPC> ra") (lambda() (interactive) (omnisharp-unit-test "all")))
(define-key evil-normal-state-map (kbd "<SPC> rl") 'recompile)

(defun check-expansion ()
  (save-excursion
    (if (looking-at "\\_>") t
      (backward-char 1)
      (if (looking-at "\\.") t
	(backward-char 1)
	(if (looking-at "->") t nil)))))

(defun do-yas-expand ()
  (let ((yas/fallback-behavior 'return-nil))
    (yas/expand)))

(defun tab-indent-or-complete ()
  (interactive)
  (if (minibufferp)
      (minibuffer-complete)
    (if (or (not yas/minor-mode)
	    (null (do-yas-expand)))
	(if (check-expansion)
	    (company-complete-common)
	  (indent-for-tab-command)))))

(define-key company-active-map (kbd "<tab>") 'tab-indent-or-complete)

(defun omnisharp-fix-usings ()
  (interactive)
  (save-buffer)
  (omnisharp-fix-usings-worker
   (buffer-file-name)
   (line-number-at-pos)
   (omnisharp--current-column)))

(defun omnisharp-fix-usings-worker (filename
				    current-line
				    current-column)
  (let ((json-result
         (omnisharp-post-message-curl-as-json
          (concat (omnisharp-get-host) "fixusings")
          (omnisharp--get-common-params))))


    ;; (message ambiguous-results)
    (omnisharp--set-buffer-contents-to
     filename
     (cdr (assoc 'Buffer json-result))
     current-line
     current-column)

    (ambiguous-results (cdr (assoc 'AmbiguousResults json-result)))

    ;; (omnisharp--write-quickfixes-to-compilation-buffer
    ;;  (omnisharp--vector-to-list 'ambiguous-results)
      
    ;;  omnisharp--find-implementations-buffer-name
    ;;  omnisharp-find-implementations-header)
    
    ))


(add-to-list 'compilation-error-regexp-alist
		 '(" in \\(.+\\):\\([1-9][0-9]+\\)" 1 2))

(defun omnisharp-unit-test (mode)
  (interactive)
  (let ((build-command (omnisharp-post-message-curl (concat (omnisharp-get-host) "buildcommand") (omnisharp--get-common-params)))
	(test-command (cdr (assoc 'TestCommand
		    (omnisharp-post-message-curl-as-json
		     (concat (omnisharp-get-host) "gettestcontext") 
		     (cons `("Type" . ,mode) (omnisharp--get-common-params)))))))
    
    (compile (concat build-command " && " test-command))))

(require 'helm-config)
(require 'helm-command)
(require 'helm-elisp)
(require 'helm-misc)
;; (require 'helm-descbinds)

(define-key helm-map (kbd "C-j") 'helm-next-line)
(define-key helm-map (kbd "C-k") 'helm-previous-line)
