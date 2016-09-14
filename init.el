;入口

(package-initialize)
(add-to-list 'load-path "~/.emacs.d/elisp-config/")

;;Package Management
;;------------------------------
(require 'init-packages)
(require 'init-better-defaults)
(require 'init-org)
(require 'init-ui)

;;this line should at last!
(require 'init-keybindings)


