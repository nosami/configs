(message "-")
(setq mac-option-modifier 'meta)
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
(require 'evil-leader)
(require 'evil-jumper)
(global-evil-leader-mode)
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

(require 'mouse)
(xterm-mouse-mode t)
(defun track-mouse (e)) 
(setq mouse-sel-mode t)
(defun scroll-up-n-lines ()
  "Scroll up n lines"
  (interactive)
  (scroll-up 2))

(defun scroll-down-n-lines ()
  "Scroll down n lines"
  (interactive)
  (scroll-down 2))

(global-set-key (kbd "<mouse-4>") 'scroll-down-n-lines) ;
(global-set-key (kbd "<mouse-5>") 'scroll-up-n-lines) ;

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
 '(company-frontends (quote (company-pseudo-tooltip-frontend company-echo-metadata-frontend)))
 '(company-idle-delay 0.03)
 '(company-minimum-prefix-length 1)
 '(omnisharp-auto-complete-want-documentation nil)
 '(safe-local-variable-values (quote ((eval when (fboundp (quote rainbow-mode)) (rainbow-mode 1)))))
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

(key-chord-define evil-insert-state-map "jk"  'evil-normal-state) 
(key-chord-define evil-replace-state-map "jk"  'evil-normal-state) 
(key-chord-define evil-insert-state-map "kj"  'evil-normal-state) 
(key-chord-define evil-replace-state-map "kj"  'evil-normal-state) 
;; (key-chord-define evil-insert-state-map "
;; (define-key evil-insert-state-map (kbd "j k") 'evil-normal-state)

;; (define-key evil-insert-state-map (kbd "k j") 'evil-normal-state)
(define-key evil-normal-state-map (kbd "g d") 'omnisharp-go-to-definition)
(define-key evil-normal-state-map (kbd "C-p") 'helm-for-files)
(define-key evil-normal-state-map (kbd "<SPC> b") 'omnisharp-build-in-emacs)
(define-key evil-normal-state-map (kbd "<SPC> cf") 'omnisharp-code-format)
(define-key evil-normal-state-map (kbd "<SPC> nm") 'omnisharp-rename-interactively)
(define-key evil-normal-state-map (kbd "<SPC> fu") 'omnisharp-find-usages)
(define-key evil-normal-state-map (kbd "<SPC> ss") 'omnisharp-start-omnisharp-server)
(define-key evil-normal-state-map (kbd "<SPC> sp") 'omnisharp-stop-omnisharp-server)
(define-key evil-normal-state-map (kbd "<SPC> fi") 'omnisharp-find-implementations)
(define-key evil-normal-state-map (kbd "<SPC> e") 'find-file)
(define-key evil-normal-state-map (kbd "<SPC> w") 'evil-write)
(define-key evil-normal-state-map (kbd "<SPC> x") 'omnisharp-fix-code-issue-at-point)
(define-key evil-normal-state-map (kbd "<SPC> cc") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd "<SPC> cc") 'evilnc-comment-or-uncomment-lines)
(define-key evil-normal-state-map (kbd "<SPC> c <SPC>") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd "<SPC> c <SPC>") 'evilnc-comment-or-uncomment-lines)

(define-key company-active-map (kbd "C-j") 'company-select-next-or-abort)
(define-key company-active-map (kbd "C-k") 'company-select-previous-or-abort)
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
;;(define-key evil-normal-state-map(evil-leader/set-key-for-mode 'omnisharp-mode "f") 'omnisharp-find-usages) ;;(setq evil-normal-state-cursor 'hollow) 
;;(setq evil-insert-state-cursor '("red" hbar))

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

(require 'w3m-load)
