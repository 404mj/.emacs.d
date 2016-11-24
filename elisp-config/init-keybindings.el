;; ;; 快速打开配置文件
 (defun open-init-file()
   (interactive)
     (find-file "~/.emacs.d/init.el"))
;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
 (global-set-key (kbd "<f2>") 'open-init-file)


;; 这个快捷键绑定可以用之后的插件 counsel 代替
(global-set-key (kbd "C-x C-r") 'recentf-open-files)
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)


;;using semx to enhance M-x
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;;配置swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-c g") 'counsel-git)

;;设置缩进
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn 
	  (indent-region (region-beginning) (region-end))
	  (message "Indent selected region."))
      (progn 
	(indent-buffer)
	(message "Indent buffer.")))))

;;可以使用C-x C-j进入当前编辑文件的路径
(require 'dired-x)

;;像在shell一样C-w删除一个单词
;;(global-set-key (kbd "C-w") 'backward-kill-word)
;;问题是容易与选择模式下的剪切重复，暂时停用

;;设置统计字数的快捷键
(global-set-key (kbd "C-c w") 'word-like-count-mode)

;;----------------
(provide 'init-keybindings)

