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
         ;(ledger . t)
         (org . t)
         (plantuml . t)
         (latex . t))))

; Use fundamental mode when editing plantuml blocks with C-c '
;;(add-to-list 'org-src-lang-modes (quote ("plantuml" . fundamental)))

;;;添加在org中统计字数的功能
(add-hook 'org-mode-hook 'word-like-count-mode t)
;;------------
(provide 'init-org)
