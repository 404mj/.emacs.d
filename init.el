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

;;this line should at last!
(require 'init-keybindings)

