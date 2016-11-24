;入口

(package-initialize)
(add-to-list 'load-path "~/.emacs.d/elisp-config/")

;;Package Management
;;------------------------------
(require 'init-packages)
(require 'init-better-defaults)
(require 'init-org)
(require 'init-ui)
;;不适用require，可减少启动时间
(setq custom-file (expand-file-name "elisp-config/custom.el" user-emacs-directory))
(load-file custom-file)

;;怎样延迟加载这个模块
(setq jekyll-blog-file (expand-file-name "elisp-config/jekyll-blog.el" user-emacs-directory))
(load-file jekyll-blog-file)
;;(autoload 'jekyll-blog "lazy loading jekyll-blog" nil)

;;this line should at last!
;;使用Emacs server模式
(server-start)

(require 'init-keybindings)

