;;  __        __             __   ___
;; |__)  /\  /  ` |__/  /\  / _` |__
;; |    /~~\ \__, |  \ /~~\ \__> |___
;;                      __   ___        ___      ___
;; |\/|  /\  |\ |  /\  / _` |__   |\/| |__  |\ |  |
;; |  | /~~\ | \| /~~\ \__> |___  |  | |___ | \|  |
;;使用 melpa 作为插件的源,将需要的插件名字写在 my/packages 中，Emacs 在启动时会自动下载未被安装的插件。
(when (>= emacs-major-version 24)
    (require 'package)
    (package-initialize)
    (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
    (add-to-list 'package-archives '("marmalade" . "http://melpa.org/packages/") t)
)

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar my/packages '(
	       ;; --- Auto-completion ---
	       company
	       ;; --- Better Editor ---
	       hungry-delete
	       swiper
	       ;;没有使用helm
	       counsel
	       smartparens
	       exec-path-from-shell
	       popwin
	       expand-region
	       iedit
	       helm-ag
               elpy
	       flycheck
	       py-autopep8
      	       yasnippet
	       web-mode
	       ;; --- Themes ---
	       solarized-theme
	       ) "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
    (loop for pkg in my/packages
	  when (not (package-installed-p pkg)) do (return nil)
	  finally (return t)))

(unless (my/packages-installed-p)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (dolist (pkg my/packages)
      (when (not (package-installed-p pkg))
	(package-install pkg))))

;; Find Executable Path on OS X
;;(when (memq window-system '(mac ns))
;;(exec-path-from-shell-initialize))


;;(require 'smex) ; Not needed if you use package.el
;;(smex-initialize)

;;设置匹配括号的插件
(require 'smartparens-config)
;; Always start smartparens mode in js-mode.
;;(add-hook 'js-mode-hook #'smartparens-mode)
(smartparens-global-mode t)

;;设置使用popwin
(require 'popwin)
(popwin-mode t)

;;设置使用expand-region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;;设置多行编辑package快捷键
(global-set-key (kbd "M-s e") 'iedit-mode)

;;设置使用helm-ag
(global-set-key (kbd "C-c p s") 'helm-do-ag-project-root)

;;设置yasnippet只在编程启动
;;(yas-reload-all)
;;(add-hook 'prog-mode-hook #'yas-minor-mode)

;;设置使用elpy搭建python环境
(elpy-enable)

;; 设置使用类似与vim中的NERDTree的目录树
(require 'neotree)
(setq neo-smart-open t)
(global-set-key [f8] 'neotree-toggle)

;;替换原有的flymake使用flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode)
  )

;;遵循pep8规范
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; 使用tabbar
;; (require 'tabbar)
;; (tabbar-mode)
;; ;; (define-prefix-command 'lwindow-map)
;; (global-set-key (kbd "<C-up>") 'tabbar-backward-group)
;; (global-set-key (kbd "<C-down>") 'tabbar-forward-group)
;; (global-set-key (kbd "<C-left>") 'tabbar-backward)
;; (global-set-key (kbd "<C-right>") 'tabbar-forward)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;;------------
(provide 'init-packages)
