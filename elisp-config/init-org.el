;;Org-mode 文本内语法高亮
(require 'org)
(setq org-src-fontify-natively t)


;;(setq org-ditaa-jar-path "")
(setq org-plantuml-jar-path "~/java/plantuml.jar")



; Do not prompt to confirm evaluation
; This may be dangerous - make sure you understand the consequences
; of setting this -- see the docstring for details
;(setq org-confirm-babel-evaluate nil)

(add-hook 'org-babel-after-execute-hook 'display-inline-images 'append)

; Make babel results blocks lowercase
(setq org-babel-results-keyword "RESULTS")

(defun display-inline-images ()
  (condition-case nil
      (org-display-inline-images)
    (error nil)))

(org-babel-do-load-languages
 (quote org-babel-load-languages)
 (quote ((emacs-lisp . t)
         (dot . t)
         ;(ditaa . t)
         ;(R . t)
         (python . t)
         (ruby . t)
         ;(gnuplot . t)
         ;(clojure . t)
         (sh . t)
	 (C . t)
	 ;;	 (css , t)
	 ;;	 (scheme . t)
	 
         ;(ledger . t)
         (org . t)
         (plantuml . t)
         (latex . t))))
(setq org-confirm-babel-evaluate nil)

; Use fundamental mode when editing plantuml blocks with C-c '
;;(add-to-list 'org-src-lang-modes (quote ("plantuml" . fundamental)))

;;;添加在org中统计字数的功能
(add-hook 'org-mode-hook 'word-like-count-mode t)

;;设置org导出默认使用xelatex解决导出pdf问题
;;(add-hook 'LaTeX-mode-hook(lambda ()(add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex --synctex=1%(mode)%' %t" TeX-run-TeX nil t))))
;;(setq org-latex-pdf-process (quote ("xelatex -interaction nonstopmode -output-directory %o %f")))
;;(setq org-latex-pdf-process '("xelatex -interaction nonstopmode %f"))
;;(load)


(setenv "PATH" (concat (getenv "PATH") ":/usr/local/texlive/2013/bin/x86_64-linux/"))
(setq exec-path (append exec-path '("/usr/local/texlive/2013/bin/x86_64-linux/")))

(setq org-latex-pdf-process
  '("xelatex -interaction nonstopmode -output-directory %o %f"
        "xelatex -interaction nonstopmode -output-directory %o %f"
        "xelatex -interaction nonstopmode -output-directory %o %f"))


(setq org-confirm-babel-evaluate nil)

(setq org-latex-classes
      '(("article"
         " \\documentclass{ctexart}
")))

;;usage:#+LATEX_CLASS: article
(setq tex-compile-commands '(("xelatex %r")))
(setq tex-command "xelatex")
(setq-default TeX-engine 'xelatex)



;;------------
(provide 'init-org)
