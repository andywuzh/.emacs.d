;;; Package --- Summary
;;; Commentary:
;;; Code:
;;; 自定义函数


(defun open-with-vscode()
  "Open current file with vscode."
  (interactive)
  (let ((line (number-to-string (line-number-at-pos)))
        (column (number-to-string (current-column))))
    (apply 'call-process "code" nil nil nil (list (concat buffer-file-name ":" line ":" column) "--goto"))))

(defun open-with-sublime()
  "Open current file with sublime."
  (interactive)
  (let ((line (number-to-string (line-number-at-pos)))
        (column (number-to-string (current-column))))
    (apply 'call-process "subl" nil nil nil (list buffer-file-name))))

(provide 'init-funcs)
;;; init-funcs.el ends here
