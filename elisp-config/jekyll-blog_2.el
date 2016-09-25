(add-to-list 'load-path "~/.emacs.d/elpa/org-jekyll-mode/") 
(require 'org-jekyll-mode)
(org-jekyll-mode)

(setq org-jekyll/jekyll-project-root "~/404mj.github.io/")
(setq org-jekyll/org-mode-project-root "~/404mj.github.io/_org/")

(provide 'jekyll-blog)

