(require 'ox-publish)

(setq org-publish-project-alist
      '(
	("org-blog"
	 :base-directory "~/404mj.github.io/_org/"
	 :base-extension "org"
	 :publishing-directory "~/404mj.github.io/"
	 :recursive t
	 :publishing-function org-publish-org-to-html
	 :headline-levels 4
	 :html-extension "html"
	 :body-only t  ;;Only export section between <body>
	 )

	("org-static"
	 :base-directory "~/404mj.github.io/_org/"
	 :base-extension "css\\|js\\|png\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|php"
	 :publishing-directory "~/404mj.github.io/"
	 :recursive t
	 :publishing-function org-publish-attachment
	 )

	("xuetu" :components ("org-blog" "org-static"))

	)
      )
