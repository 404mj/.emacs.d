;关闭工具栏tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)

;关闭文件滑动控件
(scroll-bar-mode -1)

;;显示行号
(add-hook 'prog-mode-hook 'linum-mode 1)
;;(global-linum-mode 1)

;; 更改光标的样式（不能生效，解决方案见第二集）
(setq-default cursor-type 'bar)

;;关闭启动帮助画面
(setq inhibit-splash-screen 1)

;;关闭缩进 (第二天中被去除)
;;(electric-indent-mode -1)
;;更改显示字体大小 16pt
;;http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
;;(set-face-attribute 'default nil :height 160)

;;可以选中一段文字后替换
(delete-selection-mode 1)

;;自动加载外部修改过的文件
(global-auto-revert-mode 1)

;;自动保存文件
(setq auto-save-default nil)
;;close ~ file 
(setq make-backup-files nil)

;;简化确认与否
(fset 'yes-or-no-p 'y-or-n-p)

;;﻿设置文本解码方式
(set-language-environment "UTF-8")

;;开启默认全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;;高亮显示匹配的括号
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
;;配置当光标在代码中时也高亮两边的括号
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))

;;高亮当前行
(global-hl-line-mode t)

;;开启全局 Company 补全,也可以添加钩子部分mode生效
(global-company-mode 1)

;;
(require 'hungry-delete)
(global-hungry-delete-mode)

;;添加 Org-mode 文本内语法高亮
(require 'org)
(setq org-src-fontify-natively t)

;;设置Dired mode来减少进入目录产生的buffer
;;延迟加载
(put 'dired-find-alternate-file 'disabled nil)
(with-eval-after-load 'dired
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;;解决在org-mode后期的版本内C-c C-e 不支持导出markdown的问题
(eval-after-load "org" '(require 'ox-md nil t))

;;移动整行
(defun move-line (n)
  "Move the current line up or down by N lines."
  (interactive "p")
  (setq col (current-column))
  (beginning-of-line) (setq start (point))
  (end-of-line) (forward-char) (setq end (point))
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (insert line-text)
    ;; restore point to original column in moved line
    (forward-line -1)
    (forward-char col)))

(defun move-line-up (n)
  "Move the current line up by N lines."
  (interactive "p")
  (move-line (if (null n) -1 (- n))))

(defun move-line-down (n)
  "Move the current line down by N lines."
  (interactive "p")
  (move-line (if (null n) 1 n)))

(global-set-key (kbd "M-p") 'move-line-up)
(global-set-key (kbd "M-n") 'move-line-down)
;;-------------
(provide 'init-better-defaults)
